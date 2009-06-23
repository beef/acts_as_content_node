require "acts_as_content_node/content_node"
require "acts_as_content_node/publishable"
require "acts_as_content_node/permalinks"

config.to_prepare do
  ApplicationController.helper(ContentNodesHelper)
  ApplicationController.helper(Beef::Permalinks)
end
 
ActiveRecord::Base.send :include, Beef::Acts::ContentNode
ActiveRecord::Base.send :include, Beef::Acts::Publishable
ActionController::Base.send :include, Beef::Permalinks
