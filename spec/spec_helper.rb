deps = []
deps.push(*Dir.glob('./spec/support/**/*.rb'))
deps.push(*Dir.glob('./lib/**/*.rb'))
deps.each { |file| require file }

RSpec.configure do |config|
  config.order = :random
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
