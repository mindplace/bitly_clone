urls = File.readlines("urls.txt").map(&:strip)

urls.each do |url|
  link = Url.new(body: url)
  link.save
end
