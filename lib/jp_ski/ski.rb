module JpSki
  # Ski
  class Ski
    attr_accessor :name, :pref, :area

    def self.build(args)
      ski = new
      args.each do |k, v|
        ski.instance_variable_set("@#{k}", v) unless v.nil?
      end
      ski
    end

    def self.all
      Mapping.data.map do |ski|
        build(:name => ski[:name], :pref => ski[:pref],
          :area => ski[:area])
      end
    end
  end
end
