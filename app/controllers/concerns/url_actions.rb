module UrlActions
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
    url = Url.new(body: link)

    if url.save
      json = {"success": true, "url": link, "short": "#{ENV["host"]}#{url.short}"}
    else
      json = {"success": false, "url": link, "errors": url.errors_as_string}
    end
  end

  def get_url_data
    # don't recall the design decision for this - revise
    if params["url"].match(/localhost/)
      short_url = params["url"][-6..-1]
    else
      short_url = params["url"]
    end

    url = Url.find_by(short: short_url)

    if url
      {"success": true, "url": url.body, "click_count": url.click_count}
    else
      {"success": false, "url": params["url"], "errors": "URL not found"}
    end
  end
end
