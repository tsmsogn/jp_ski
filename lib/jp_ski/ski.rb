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

    def self.find(args)
      return nil unless args.class == Hash

      key = args.keys[0]
      val = args[key]

      case key
      when :name
        return find_by_name(val)
      when :pref
        return find_by_pref(val)
      when :top
        return find_by_top(canonicalize_comparison(val))
      when :bottom
        return find_by_bottom(canonicalize_comparison(val))
      end
      nil
    end

    def self.find_by_name(name)
      data = all.reject do |ski|
        ski.name.downcase !~ /#{name.downcase}/
      end

      return data unless data.empty?
      nil
    end

    def self.find_by_pref(pref)
      data = all.reject do |ski|
        ski.pref != pref
      end

      return data unless data.empty?
      nil
    end

    def self.find_by_top(comparison)
      comparable = comparison[0]
      value = comparison[1]

      data = all.reject do |ski|
        if ski.top.nil?
          true
        else
          !ski.top.public_send comparable, value
        end
      end

      return data unless data.empty?
      nil
    end

    def self.find_by_bottom(comparison)
      comparable = comparison[0]
      value = comparison[1]

      data = all.reject do |ski|
        if ski.bottom.nil?
          true
        else
          !ski.bottom.public_send comparable, value
        end
      end

      return data unless data.empty?
      nil
    end

    def self.canonicalize_comparison(operator)
      return ['>=', 0] if operator.nil?
      fail ArgumentError unless operator =~ /^(<(?:=)?|==|>(?:=)?)\s+(\d+)$/
      comparable, value = Regexp.last_match[1], Regexp.last_match[2]
      [comparable, value.to_i]
    end

    private_class_method :find_by_name, :find_by_pref, :find_by_top, :find_by_bottom
  end
end
