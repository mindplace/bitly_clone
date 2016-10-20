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
    url = Url.new({body: link, base_url: request.base_url})

    if url.save
      json = {"success": true, "original": link, "short": url.complete_short}
    else
      json = {"success": false, "original": link, "errors": url.errors_as_string}
    end
  end
 
  def get_url_data
    url = Url.find_by(complete_short: params["url"])

    if url
      {"success": true, "original": url.body, "short": url.complete_short, "click_count": url.click_count}
    else
      {"success": false, "short": params["url"], "errors": "URL not found"}
    end
  end
end
