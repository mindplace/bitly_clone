Rails.application.routes.draw do
  get '/shorten', to: "url#shorten",        as: "shorten_link"
  get '/data',    to: "url#data",           as: "get_click_data"
  get '/:short',  to: "url#redirect_link",  as: "redirect_link"
end
