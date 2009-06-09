require 'rubygems'
require 'test/unit'
require 'active_record'
require 'shoulda/rails'
require 'factory_girl'
require 'faker'

# Setting this makes parameterize work
$KCODE = 'UTF8'

# Makes TimeZone work
Time.zone = 'UTC'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

RAILS_DEFAULT_LOGGER = Logger.new(File.join(File.dirname(__FILE__), "debug.log"))

require File.join(File.dirname(__FILE__), '..', 'init')

ActiveRecord::Base.configurations = YAML::load(IO.read(File.dirname(__FILE__) + "/database.yml"))
ActiveRecord::Base.establish_connection(ENV["DB"] || "sqlite3mem")
ActiveRecord::Migration.verbose = false
load(File.join(File.dirname(__FILE__), "schema.rb"))

class ContentNode < ActiveRecord::Base
  acts_as_content_node
end

Factory.define(:content_node) do |content_node|
  content_node.title               {Faker::Lorem.words(5).join(' ')}
  content_node.description         {Faker::Lorem.sentence}
  content_node.body                {Faker::Lorem.paragraphs.join}
end 

