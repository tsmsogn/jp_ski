require 'attr_required'
require 'attr_optional'

module JpSki
  # SkiResort
  class SkiResort
    include AttrRequired, AttrOptional

    attr_required :name,
                  :pref,
                  :postal_code,
                  :address

    def initialize(attributes = {})
      if attributes.is_a?(Hash)
        (required_attributes + optional_attributes).each do |key|
          value = attributes[key]
          self.send "#{key}=", value
        end
      end
      attr_missing!
    end
  end
end
