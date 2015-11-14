require "rspec"
require "pry"

PROJECT_ROOT = File.expand_path("../..", __FILE__)

$LOAD_PATH << File.join(PROJECT_ROOT, "lib", "*.rb")

RSpec.configure do |config|
  config.color = true
end
