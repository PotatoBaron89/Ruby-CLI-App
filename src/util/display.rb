
def print_info(string)
  puts "hello"
  box = TTY::Box.info("#{string}")
  print box
end