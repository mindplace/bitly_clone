Rails.application.routes.draw do
  get '/shorten', to: "url#create",   as: "create_short_link"
  get '/data',    to: "url#index",    as: "get_click_data"
  get '/:short',  to: "url#show",     as: "redirect_link"
end
