load './util/lookup_word.rb'
load './util/display.rb'
require './util/translate'
require 'rainbow'
require "tty-prompt"

def check_input(input)
  system "clear"

  if input.to_s == "lookup"
    puts Rainbow("Enter Word to Lookup: ").bright.white.bg(:blue)
    res = lookup_word(gets.chomp)
  elsif input.to_s == "translate"
    puts Rainbow("Enter language to translate to: ").bright.black.bg(:blue)
    puts Rainbow("Options:    es fr jp").bright.black.bg(:blue)
    lang = gets.chomp

    res = translate(lang, gets.chomp)
  end
end