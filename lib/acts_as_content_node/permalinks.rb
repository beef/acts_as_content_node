module Beef
  module Permalinks

    def permalink(record, options = {})
      record_method_name = record.class.name.underscore
      method_name = "#{record_method_name}_permalink"

      if respond_to?(method_name)
        send(method_name, record, options)
      elsif record.respond_to?('permalink')
        send("#{record_method_name}_path", record.permalink, options)
      else
        record
      end
    end
  
  end
end