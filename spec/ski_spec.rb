# encoding: utf-8

require 'spec_helper'

describe JpSki::Ski do
  let(:ski) { JpSki::Ski.build('foo', 'bar', 'baz') }
  subject { ski }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:pref) }
  it { is_expected.to respond_to(:area) }
  it { expect(ski.name).to eq 'foo' }
  it { expect(ski.pref).to eq 'bar' }
  it { expect(ski.area).to eq 'baz' }

  describe '.all' do
    let(:skis) { JpSki::Ski.all }

    it { expect(skis.first).to be_an_instance_of(JpSki::Ski) }
    it { expect(skis.first.name).to eq '石狩平原スキー場' }
    it { expect(skis.first.pref).to eq '北海道' }
    it { expect(skis.first.area).to eq '北海道' }
    it { expect(skis.count).to eq 563 }
  end
end
