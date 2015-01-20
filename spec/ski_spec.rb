# encoding: utf-8

require 'spec_helper'

describe JpSki::Ski do
  describe 'with valid initialization' do
    let(:ski) do
      JpSki::Ski.build(:name => 'foo', :pref => 'bar', :area => 'baz', :top => 1000, :bottom => 900)
    end
    subject { ski }

    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:pref) }
    it { is_expected.to respond_to(:area) }
    it { is_expected.to respond_to(:top) }
    it { is_expected.to respond_to(:bottom) }
    it { expect(ski.name).to eq 'foo' }
    it { expect(ski.pref).to eq 'bar' }
    it { expect(ski.area).to eq 'baz' }

    describe '.all' do
      let(:skis) { JpSki::Ski.all }

      it { expect(skis[2]).to be_an_instance_of(JpSki::Ski) }
      it { expect(skis[2].name).to eq 'ダイナスティスキーリゾート' }
      it { expect(skis[2].pref).to eq '北海道' }
      it { expect(skis[2].area).to eq '北海道' }
      it { expect(skis[2].top).to eq 275 }
      it { expect(skis[2].bottom).to eq 185 }
      it { expect(skis.count).to eq 563 }
    end
  end
end
