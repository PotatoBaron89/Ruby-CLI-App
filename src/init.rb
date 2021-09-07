require './init'
require './session/init_session'
require './util/lookup_word'
require './util/commands'
require './util/display'
require 'tty-spinner'

def init_waste_time
  spinner = TTY::Spinner.new("[:spinner] Initialising . . .", format: :arrow_pulse)
  spinner.auto_spin
  sleep(0.3)
  spinner.success("(successful)")

  spinner = TTY::Spinner.new("[:spinner] Connecting to API . . .", format: :arrow_pulse)
  spinner.auto_spin
  sleep(Random.rand(1.1))
  spinner.success("(successful)")

  spinner = TTY::Spinner.new("[:spinner] Dictionary . . .", format: :arrow_pulse)
  spinner.auto_spin
  sleep(Random.rand(0.4))
  spinner.success("(successful)")

  spinner = TTY::Spinner.new("[:spinner] Utilities . . .", format: :arrow_pulse)
  spinner.auto_spin
  sleep(Random.rand(0.3))
  spinner.success("(successful)")

  spinner = TTY::Spinner.new("[:spinner] Translator . . .", format: :arrow_pulse)
  spinner.auto_spin
  sleep(Random.rand(0.6))
  spinner.success("(successful)")
end