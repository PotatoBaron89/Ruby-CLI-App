def create_cache
  Dir.mkdir('../../cache') unless Dir.exists?('../../cache')
  File.new('../../cache/session.txt', 'w') unless File.exists?('../../cache/session.txt')
end