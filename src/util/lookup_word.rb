require 'uri'
require 'net/http'
require 'openssl'
require 'cgi'
require 'json'
require 'tty-reader'
require "tty-prompt"

def lookup_word(word)
  url = URI("https://wordsapiv1.p.rapidapi.com/words/#{word}/definitions")
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)
  request["x-rapidapi-host"] = 'wordsapiv1.p.rapidapi.com'
  request["x-rapidapi-key"] = '3d2db8ad79mshbb0002729d09d3dp194e1cjsn83f61811ef67'

  response = http.request(request)
  new = CGI::parse(response.read_body)
  response = JSON.parse(response.read_body, {symbolize_names: true})
  prompt = TTY::Prompt.new

  number_of_definitions = response.dig(:definitions).length.to_s
  puts "Definitions Found: " + number_of_definitions

  i = 0
  definitions = []
  index = []
  while i < number_of_definitions.to_i
    index.push i
    definitions.push(response.dig(:definitions, i, :definition))
    i += 1
  end
  # p definitions

  choices = definitions
  prompt.multi_select("View Definitions", choices)

  definitions = response.dig(:definitions)
  p definitions
  puts response.dig(:definitions, 0, :definition)

end

# lookup_word("friend")