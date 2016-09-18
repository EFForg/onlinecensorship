#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0", 'xmlns:atom' => "http://www.w3.org/2005/Atom" do
  xml.channel do
    xml.title "onlinecensorship.org"
    xml.description "If you feel that your content or account has been erroneously or unjustly removed from a social media platform, submit a report and let us know."
    xml.link "https://www.onlinecensorship.org"
    xml.language "en"
    xml.tag! 'atom:link', :rel => 'self', :type => 'application/rss+xml', :href => "https://www.onlinecensorship.org" + feed_path(format: :rss)

    for article in @posts
      xml.item do
        if article.title
          xml.title article.title
        else
          xml.title ""
        end
        # xml.pubDate article.publish_date.to_s
        xml.link "https://www.onlinecensorship.org/news-and-analysis/" + article.id.to_s
        # xml.guid article.id

        if article.description
          text = strip_tags(article.description.html_safe)
        else
          text = ""
        end

        publish_date = "<p>" + article.publish_date.to_s + "</p>"

        if article.photo.exists?
            image_url = article.photo.url
            image_tag = "
                <p><img src='" + image_url +  "' alt='" + article.title + "' title='" + article.title + "' /></p><br/>
              "
            text = image_tag + text + publish_date
        end
        xml.description "<p>" + text + "</p>"

      end
    end
  end
end