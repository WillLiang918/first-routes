require 'addressable/uri'
require 'rest-client'


url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users.json'
).to_s

url2 = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/3'
).to_s

puts RestClient.delete(url2)


# puts RestClient.get(url)
# puts RestClient.get(url2)
# puts RestClient.post(url, "test")
