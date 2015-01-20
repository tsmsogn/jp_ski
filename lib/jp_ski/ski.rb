module JpSki
  # Ski
  class Ski
    attr_accessor :name,
                  :pref,
                  :area,
                  :postal_code,
                  :address,
                  :top,
                  :bottom,
                  :max_slope,
                  :max_angle

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
          :area => ski[:area], :postal_code => ski[:postal_code],
          :address => ski[:address], :top => ski[:top], :bottom => ski[:bottom],
          :max_slope => ski[:max_slope], :max_angle => ski[:max_angle])
      end
    end
  end
end
