class UrlController < ApplicationController
  include UrlHelper
  
  def shorten
    render json: shorten_multiple_links
  end

  def data
    render json: get_url_data
  end

  def redirect_link
    @short = params[:short]
    url = Url.find_by(short: @short)

    if url
      url.click_count += 1
      url.save

      redirect_to url.body
    else
      render "/not_found"
    end
  end
end
