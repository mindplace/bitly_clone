module UrlHelper
  def shorten_multiple_links
    if params["urls"]
      json = {"urls": []}
      params["urls"].each{ |set| json[:urls] << shorten_single_link(set["url"]) }
      json
    else
      shorten_single_link(params["url"])
    end
  end

  def shorten_single_link(link)
    url = Url.find_by(body: link)
    if url
      json = {"success": true, "url": link, "short": "http://localhost:3000/#{url.short}"}
    else
      url = Url.new(body: link)
      url.generate_short

      if url.save
        json = {"success": true, "url": link, "short": "http://localhost:3000/#{url.short}"}
      else
        json = {"success": false, "url": link, "errors": url.errors_as_string}
      end
    end

    json
  end

  def get_url_data
  end
end