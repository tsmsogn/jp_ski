require "jp_ski/version"
require "jp_ski/mapping"
require "jp_ski/ski_resort"

module JpSki
  def self.list_ski_resort
    Mapping.data.map do |ski|
      JpSki::SkiResort.new ski
    end
  end
end
