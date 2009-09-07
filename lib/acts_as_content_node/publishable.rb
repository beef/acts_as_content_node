module Beef
  module Acts
    module Publishable
      module ClassMethods
        def acts_as_publishable
          send :include, InstanceMethods

          named_scope :published, lambda { { :conditions => ["(published_at IS NOT NULL AND published_at != '') AND published_at < ? AND (published_to > ? OR published_to IS NULL OR published_to = '')", Time.now, Time.now] } }
          named_scope :draft, :conditions => { :published_at => nil }

          before_save :set_published

          attr_accessor :publish, :hide
        end
      end

      module InstanceMethods

        def published?
          return false if published_at.nil?
          @published ||= published_at < Time.zone.now
        end

      private

        def set_published
          write_attribute :published_at, Time.zone.now if @publish and published_at.nil?
          if @hide    
            write_attribute :published_at, nil 
            write_attribute :published_to, nil 
          end
        end
      end

      def self.included(base)
        base.extend ClassMethods
      end
    end
  end  
end
