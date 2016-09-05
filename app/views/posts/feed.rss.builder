#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "onlinecensorship.org"
    xml.author "OnlineCensorship"
    xml.description "If you feel that your content or account has been erroneously or unjustly removed from a social media platform, submit a report and let us know."
    xml.link "https://www.onlinecensorship.org"
    xml.language "en"

    for article in @posts
      xml.item do
        if article.title
          xml.title article.title
        else
          xml.title ""
        end
        if article.person
        	xml.author article.person.name
        else
        	xml.author ""
        end
        xml.pubDate article.publish_date.to_s(:rfc822)
        xml.link "https://www.onlinecensorship.org/news-and-analysis/" + article.id.to_s
        xml.guid article.id

        if article.description
          text = article.description
        else
          text = ""
        end

        if article.photo.exists?
            image_url = article.photo.url
            image_tag = "
                <p><img src='" + image_url +  "' alt='" + article.title + "' title='" + article.title + "' /></p><br/>
              "
            text = image_tag + text
        end
        xml.description "<p>" + text + "</p>"

      end
    end
  end
end