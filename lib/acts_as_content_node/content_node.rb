module Beef
  module Acts
    module ContentNode
      module ClassMethods
        def acts_as_content_node

          belongs_to :updated_by, :class_name => 'User'
          belongs_to :created_by, :class_name => 'User'
          
          named_scope :authored_by, lambda { |user|
            return {} if user.nil?
            user = User.find(user) unless user.is_a? ::User
            { :conditions => { :created_by_id => user.id }  }
          }

          before_save :set_url

          validates_presence_of :title
          validates_uniqueness_of :title, :message => 'has been used before'
          validates_uniqueness_of :permalink, :message => 'has been used before', :if => :permalink_written
          
          attr_reader :permalink_written

          def find_by_permalink(permalink)
            content_node = find(:first, :conditions => ['permalink = ?', permalink])
            raise ActiveRecord::RecordNotFound, "Couldn't find #{name} with permalink #{permalink}" if content_node.nil?
            content_node
          end
          acts_as_publishable

          send :include, InstanceMethods
        end
      end

      module InstanceMethods
        
        def permalink=(permalink)
          unless permalink.blank?
            write_attribute :permalink, permalink.parameterize
            @permalink_written = true
          end
        end
      
        def editor
          updated_by.nil? ? 'Anon' : updated_by.read_attribute(:name)
        end
      
        def author
          created_by.nil? ? 'Anon' : created_by.read_attribute(:name)
        end
      
        def short_desc
          unless description.nil?
            description.split('.').first
          else
            ''
          end
        end
        
      private

        def set_url
          write_attribute :permalink, title.parameterize unless permalink_written or !title_changed?
        end

      end

      def self.included(base)
        base.extend ClassMethods
      end
    end
  end  
end
