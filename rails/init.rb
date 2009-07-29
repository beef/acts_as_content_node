require "acts_as_content_node/content_node"
require "acts_as_content_node/publishable"

config.to_prepare do
  ApplicationController.helper(ContentNodesHelper)
end
 
ActiveRecord::Base.send :include, Beef::Acts::ContentNode
ActiveRecord::Base.send :include, Beef::Acts::Publishable
