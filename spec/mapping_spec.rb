require 'spec_helper'

describe JpSki::Mapping do
  describe '.data' do
    it { expect(described_class.data.count).to eq 558 }
  end
end
