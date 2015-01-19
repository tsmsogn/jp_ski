require 'yaml'

module JpSki
  # Mapping
  module Mapping
    filepath = File.join(File.dirname(__FILE__), '../../yml/ski.yml')
    @data = YAML.load_file(filepath)

    def self.data
      @data
    end
  end
end
