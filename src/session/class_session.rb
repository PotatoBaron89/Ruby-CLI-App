require 'securerandom'
load 'time.rb'

class Sessions
  def initialize
    @_session_id = 1234       # uuid
    @_session_started = 0     # Current time
    @_user_prefs = {}         # Load User Prefs as Hash
    @_user_log = {}           # Store User Actions to log: When they signed in / out, session length etc
    @_user_data = []          # Array of objects on learning material
  end
  attr_accessor :_session_id
  attr_accessor :_session_started
  attr_accessor :_user_prefs
  attr_accessor :_user_log
  attr_accessor :_user_data
end

test = Sessions .new
p test._session_id

