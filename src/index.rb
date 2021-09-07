require 'rainbow'
require './util/commands'
require 'tty-box'
require 'tty-spinner'
require 'tty-reader'
require "tty-prompt"
require './init.rb'

init_waste_time
print TTY::Box.frame Rainbow("        Hello world!        ").black.bg(:blue), Rainbow("Welcome to Sam's Strange App").bg(:green)
prompt = TTY::Prompt.new

name = prompt.ask("What is your name?")
puts ""
puts "Welcome #{name}."
puts "Commands: " + Rainbow("lookup").bg(:blue).black + " To use dictionary       " + Rainbow("translate").bg(:blue).black + "
    translate from Eng to another"

$isActive = true

while $isActive
  check_input(gets.chomp)
end


