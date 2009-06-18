config.to_prepare do
  ApplicationController.helper(ContentNodesHelper)
end

require "acts_as_content_node/content_node"
require "acts_as_content_node/publishable"
 
ActiveRecord::Base.send :include, Beef::Acts::ContentNode
ActiveRecord::Base.send :include, Beef::Acts::Publishable
