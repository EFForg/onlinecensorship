require 'rss'
require 'open-uri'

class ImportDeeplinksJob < ApplicationJob
  queue_as :default

  def perform
    category = Category.where(title: 'Analysis').first
    feed.each do |update|
      body = Nokogiri::HTML.fragment(update.description)
      intro = body.css('p').first.text
      intro = body.css('p')[1].text if intro.blank?

      authorship = update.dc_creators.map(&:content)
      authorship[-1].prepend("and ") if authorship.size > 2
      authors = authorship.join(authorship.size > 2 ? ", " : " and ")
      authors = Nokogiri::HTML.fragment(authors).to_s

      body.css("a, img").each do |a|
        if a["href"] && a["href"] !~ /^https?:\/\//
          a["href"].sub(/^\//, "")
          a["href"] = %(https://www.eff.org/#{a["href"]})
        end

        if a["src"] && a["src"] !~ /^https?:\/\//
          a["src"].sub(/^\//, "")
          a["src"] = %(https://www.eff.org/#{a["src"]})
        end
      end

      post = Post.where(link: update.link)
      post = post.empty? ? Post.new : post.first
        post.update!(
          title: update.title,
          news_source: authors,
          intro: intro,
          description: body.to_html,
          publish_date: update.pubDate,
          published: true,
          category: category
        )
    end
  end

  private

  def feed
    @items ||= []
    return @items unless @items.empty?
    open("https://www.eff.org/deeplinks.xml") do |rss|
      @items = RSS::Parser.parse(rss).items
    end
    @items
  end
end
