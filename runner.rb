require "net/http"
require "uri"
require 'pry'
require 'json'
require 'rails' # in order to use the Object#to_query method for an array of links

def shorten_link(url)
  uri = URI.parse("http://localhost:3000/shorten")
  params = {"url": url}
  uri.query = URI.encode_www_form(params)
  JSON.parse(Net::HTTP.get(uri))
end

def shorten_multiple_links(link_array)
  uri = URI.parse("http://localhost:3000/shorten")

  params = {"urls": []}
  link_array.each do |link|
    params[:urls] << {"url": link}
  end

  uri.query = params.to_query
  JSON.parse(Net::HTTP.get(uri))
end

def check_data(url)
  uri = URI.parse("http://localhost:3000/data")
  params = {"url": url}
  uri.query = URI.encode_www_form(params)
  JSON.parse(Net::HTTP.get(uri))
end

def make_http_request_to_short_url(short)
  uri = URI.parse("http://localhost:3000/" + short)
  Net::HTTP.get(uri)
end

# test data
urls = [
  "http://twitter.com", "http://google.com", "http://apidock.com/rails/ActiveRecord/AttributeMethods/Serialization/ClassMethods/serialize",
  "http://stackoverflow.com/questions/15459104/how-would-i-generate-a-random-and-unique-string-in-ruby",
  "http://ruby-doc.org/stdlib-2.1.2/libdoc/securerandom/rdoc/SecureRandom.html",
  "http://api.rubyonrails.org/classes/ActiveRecord/Migration.html",
  "https://rubygems.org/profiles/mindplace",
  "https://coderwall.com/p/uh8kiw/pass-arrays-objects-via-querystring-the-rack-rails-way",
]

single = urls.sample
response_from_single = shorten_link(single)

binding.pry

response_from_multiple = shorten_multiple_links(urls.sample(3))
sample_short_url = response_from_multiple["urls"].sample["short"]

binding.pry

10.times do
  make_http_request_to_short_url(sample_short_url)
end

data = check_data(sample_short_url)

binding.pry
