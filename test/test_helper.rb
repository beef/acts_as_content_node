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

RAILS_DEFAULT_LOGGER = Logger.new(File.join(File.dirname(__FILE__), "debug.log"))
ActiveRecord::Base.logger = RAILS_DEFAULT_LOGGER

require "acts_as_content_node/content_node"
require "acts_as_content_node/publishable"
require "acts_as_content_node/permalinks"

ActiveRecord::Base.send :include, Beef::Acts::ContentNode
ActiveRecord::Base.send :include, Beef::Acts::Publishable

ActiveRecord::Base.configurations = YAML::load(IO.read(File.dirname(__FILE__) + "/database.yml"))
ActiveRecord::Base.establish_connection(ENV["DB"] || "sqlite3mem")
ActiveRecord::Migration.verbose = false
load("schema.rb")

class ContentNode < ActiveRecord::Base
  acts_as_content_node
end

class User < ActiveRecord::Base
  before_save :set_permalink
  
  def set_permalink
    self.permalink = name.parameterize
  end
end

Factory.define(:content_node) do |content_node|
  content_node.title               {Faker::Lorem.words(5).join(' ')}
  content_node.description         {Faker::Lorem.sentence}
  content_node.body                {Faker::Lorem.paragraphs.join}
  content_node.association :created_by, :factory => :user
end

Factory.define :user do |user|
  user.name                  { Faker::Name.name }
end 

