require 'spec_helper'

describe JpSki::Mapping do
  describe '.data' do
    it 'return all ski areas loaded from YAML' do
      expect(described_class.data.count).to eq 563
    end
  end
end
