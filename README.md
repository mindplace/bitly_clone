# Bitly clone: URL shortener

This lightweight API does only a couple actions: it can shorten a single url, shorten several urls at a time,
showcase data on how many times a url has been used, and redirect the short url to the original url.

Checkout the [runner file](https://github.com/mindplace/bitly_clone/blob/master/runner.rb) for some sample uses.

### Shortening a single URL:
Make a get request to http://localhost:3000/shorten + your params:
```
 GET http://localhost:3000/shorten?url=https%3A%2F%2Fgoogle.com
```

What you'll get back:

```
{
  "success": true,
  "url": "http://www.google.com",
  "short": "http://localhost:3000/ABC123"
}
```

### Looking at click data:
Make a get request to http://localhost:3000/data + your link (doesn't matter whether it was the shortened link or the original one):
```
GET http://localhost:3000/data?url=https%3A%2F%2Fgoogle.com
```

What you'll get back:

```
{
  "success": true,
  "url": "http://www.google.com",
  "count": 10
}
```

Nifty!
