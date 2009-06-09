require 'acts_as_content_node'
 
ActiveRecord::Base.send :include, ActiveRecord::Acts::ContentNode
ActiveRecord::Base.send :include, ActiveRecord::Acts::Publishable
 
RAILS_DEFAULT_LOGGER.info "** acts_as_content_node: initialized properly."