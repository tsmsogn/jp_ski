require 'spec_helper'

describe JpSki do
  it 'has a version number' do
    expect(JpSki::VERSION).not_to be nil
  end

  describe '.list_ski_resort' do
    it { expect(JpSki.list_ski_resort.count).to eq 558 }
  end
end
