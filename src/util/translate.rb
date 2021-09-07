require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'cgi'

def translate(end_language, string)
  url = URI("https://deep-translate1.p.rapidapi.com/language/translate/v2")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Post.new(url)
  request["content-type"] = 'application/json'
  request["x-rapidapi-host"] = 'deep-translate1.p.rapidapi.com'
  request["x-rapidapi-key"] = '3d2db8ad79mshbb0002729d09d3dp194e1cjsn83f61811ef67'
  request.body = "{\r
  \"q\": \"#{string}\",\r
  \"source\": \"en\",\r
  \"target\": \"#{end_language}\"\r
  }"

  response = http.request(request)
  # puts response.read_body
  # puts response.read_body
  # return response.read_body
  system "clear"
  new = CGI::parse(response.read_body).to_hash
  response = JSON.parse(response.read_body, {symbolize_names: true})
  puts "Original: " + string
  puts "Translation into #{end_language}:   " + response.dig(:data, :translations, :translatedText).to_s


end

# temp = trans('en', 'fr', "Good morning friend")
