require 'time'

def get_date
  "#{Time.new.year}-#{Time.new.month}-#{Time.new.day}"
end

def get_time
  "H:#{Time.new.hour}M:#{Time.new.min}:#{Time.new.sec}S"
end
