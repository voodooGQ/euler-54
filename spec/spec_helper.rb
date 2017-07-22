require 'byebug'

Dir[File.join(File.dirname(__FILE__), "..", "lib" , "**.rb")].each do |file|
  require file
end

RSpec.configure do |config|
  config.order = :random
end
