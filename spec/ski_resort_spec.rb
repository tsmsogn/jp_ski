require 'spec_helper'

describe JpSki::SkiResort do
  let(:skip_resort) { described_class }

  describe '.new' do
    describe 'dosen\'t work without param' do
      it { expect { skip_resort.new }.to raise_error }
    end

    describe 'works with params' do
      subject { skip_resort.new :name => '八甲田スキー場', :pref => '青森県',
        :postal_code => '〒030-0188', :address => '青森県青森市荒川寒水沢１−１２' }

      it { is_expected.to be_a JpSki::SkiResort }
      it { is_expected.to respond_to(:name) }
      it { is_expected.to respond_to(:pref) }
      it { is_expected.to respond_to(:postal_code) }
      it { is_expected.to respond_to(:address) }
      it { is_expected.to have_attributes(name: '八甲田スキー場') }
      it { is_expected.to have_attributes(pref: '青森県') }
      it { is_expected.to have_attributes(postal_code: '〒030-0188') }
      it { is_expected.to have_attributes(address: '青森県青森市荒川寒水沢１−１２') }
    end
  end
end
