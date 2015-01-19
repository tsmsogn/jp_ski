module JpSki
  # Ski
  class Ski
    attr_accessor :name, :pref, :area

    def self.build(name, pref, area)
      ski = new
      ski.name = name
      ski.pref = pref
      ski.area = area
      ski
    end

    def self.all
      Mapping.data.map do |ski|
        build(ski[:name], ski[:pref], ski[:area])
      end
    end
  end
end
