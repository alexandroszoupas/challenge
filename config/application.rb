require 'active_record'
require 'sqlite3'
require 'yaml'

config_path = File.join(File.dirname(__FILE__), "database.yml")
ActiveRecord::Base.configurations = YAML.load_file(config_path)
ActiveRecord::Base.establish_connection(:development)

logger = Logger.new($stdout)
logger.formatter = proc do |_severity, _datetime, _progname, msg|
  "#{msg}\n"
end
ActiveRecord::Base.logger = logger

Dir["#{__dir__}/../app/models/*.rb"].sort.each { |file| require_relative file }
