load './util/lookup_word.rb'
load './util/display.rb'
require './util/translate'
require 'rainbow'
require "tty-prompt"
require 'tty-spinner'


def check_input(input)
  system "clear"

  words = input.split(' ')

  if input.to_s == "lookup"
    puts Rainbow("Enter Word to Lookup: ").bright.white.bg(:blue)
    res = lookup_word(gets.chomp)
  elsif input.to_s == "translate"
    puts Rainbow("Enter language to translate to: ").bright.black.bg(:blue)
    puts Rainbow("Options:    es fr jp").bright.black.bg(:blue)
    lang = gets.chomp
    res = translate(lang, gets.chomp)
  elsif input.to_s == "clear"
    system "clear"
  elsif input.to_s == "help"
    system "clear"
    puts "Commands: " + Rainbow("lookup").bg(:blue).black + " To use dictionary       " + Rainbow("translate").bg(:blue).black + "
    translate from Eng to another"
    puts "Exit: close   or   exit    or    quit"
    puts "Shortcuts:"
    puts "Translation: translate {lang} {string to be converted}   eg translate fr hello world from user"
  elsif input.to_s == "exit" || input.to_s == "close" || input.to_s == "quit"
    $isActive = false
    spinner = TTY::Spinner.new("[:spinner] Shutting Down . . .", format: :arrow_pulse)
    spinner.auto_spin
    sleep(Random.rand(1.0))
    spinner.success("(successful)")
  elsif words[0] == "translate"
    words = words.drop(2)
    res = translate(words[1], words.join(' '))

  end
end