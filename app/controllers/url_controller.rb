class UrlController < ApplicationController
  include UrlActions

  def create
    render json: shorten_multiple_links
  end

  def index
    render json: get_url_data
  end

  def show
    short = params[:short]
    url = Url.find_by(short: short)

    if url
      url.click_count += 1
      url.save

      redirect_to url.body
    else
      @short = "#{ENV["host"]}#{short}"
      render "/not_found"
    end
  end
end
