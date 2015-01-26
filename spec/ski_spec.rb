# encoding: utf-8

require 'spec_helper'

describe JpSki::Ski do
  describe 'with valid initialization' do
    let(:ski) do
      JpSki::Ski.build(:name => 'foo', :pref => 'bar', :area => 'baz',
        :postal_code => 'qux', :address => 'quux', :top => 1000, :bottom => 900,
        :max_slope => 5000, :max_angle => 40)
    end
    subject { ski }

    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:pref) }
    it { is_expected.to respond_to(:area) }
    it { is_expected.to respond_to(:postal_code) }
    it { is_expected.to respond_to(:address) }
    it { is_expected.to respond_to(:top) }
    it { is_expected.to respond_to(:bottom) }
    it { is_expected.to respond_to(:max_slope) }
    it { is_expected.to respond_to(:max_angle) }
    it { expect(ski.name).to eq 'foo' }
    it { expect(ski.pref).to eq 'bar' }
    it { expect(ski.area).to eq 'baz' }
    it { expect(ski.postal_code).to eq 'qux' }
    it { expect(ski.address).to eq 'quux' }
    it { expect(ski.top).to eq 1000 }
    it { expect(ski.bottom).to eq 900 }
    it { expect(ski.max_slope).to eq 5000 }
    it { expect(ski.max_angle).to eq 40 }

    describe '.all' do
      let(:skis) { JpSki::Ski.all }

      it { expect(skis[2]).to be_an_instance_of(JpSki::Ski) }
      it { expect(skis[2].name).to eq 'ダイナスティスキーリゾート' }
      it { expect(skis[2].pref).to eq '北海道' }
      it { expect(skis[2].area).to eq '北海道' }
      it { expect(skis[2].postal_code).to eq '0611267' }
      it { expect(skis[2].address).to eq '北海道北広島市仁別152' }
      it { expect(skis[2].top).to eq 275 }
      it { expect(skis[2].bottom).to eq 185 }
      it { expect(skis[2].max_slope).to eq 670 }
      it { expect(skis[2].max_angle).to eq 19 }
      it { expect(skis.count).to eq 563 }
    end

    describe '.find' do
      describe 'with valid args' do
        describe 'when key is name' do
          describe 'when found some skis' do
            let(:skis) { JpSki::Ski.find(:name => 'm') }

            it { expect(skis.first).to be_an_instance_of(JpSki::Ski) }
            it { expect(skis.first.name).to eq 'manogamiスキー場' }
            it { expect(skis.count).to eq 6 }
          end

          describe 'when found no ski' do
            it { expect(JpSki::Ski.find(:name => 'foo')).to be_nil }
          end
        end

        describe 'when key is pref' do
          describe 'when found some skis' do
            let(:hokkaido_skis) { JpSki::Ski.find(:pref => '北海道') }

            it { expect(hokkaido_skis.first).to be_an_instance_of(JpSki::Ski) }
            it { expect(hokkaido_skis.first.name).to eq '石狩平原スキー場' }
            it { expect(hokkaido_skis.count).to eq 129 }
          end

          describe 'when found no ski' do
            it { expect(JpSki::Ski.find(:pref => 'foo')).to be_nil }
          end
        end
      end

      describe 'with invalid args' do
        describe 'non Hash' do
          it { expect(JpSki::Ski.find(1)).to be_nil }
        end

        describe 'Hash having no keys' do
          it { expect(JpSki::Ski.find({})).to be_nil }
        end

        describe 'Hash having some keys more than one' do
          it { expect(JpSki::Ski.find(:foo => 1, :bar => 2)).to be_nil }
        end
      end
    end

    describe '.find_by_name' do
      it { expect { JpSki::Ski.find_by_name('foo') }.to raise_error(NoMethodError) }
    end

    describe '.find_by_pref' do
      it { expect { JpSki::Ski.find_by_pref('foo') }.to raise_error(NoMethodError) }
    end

    describe '.canonicalize_comparison' do
      describe 'when valid args' do
        describe 'when args is nil' do
          it do
            expect(JpSki::Ski.canonicalize_comparison(nil)).to eq ['>=', 0]
          end
        end

        describe 'when args is \'< 200\'' do
          it { expect(JpSki::Ski.canonicalize_comparison('< 200')).to eq ['<', 200] }
        end

        describe 'when args is \'<= 200\'' do
          it { expect(JpSki::Ski.canonicalize_comparison('<= 200')).to eq ['<=', 200] }
        end

        describe 'when args is \'== 200\'' do
          it { expect(JpSki::Ski.canonicalize_comparison('== 200')).to eq ['==', 200] }
        end

        describe 'when args is \'>= 200\'' do
          it { expect(JpSki::Ski.canonicalize_comparison('>= 200')).to eq ['>=', 200] }
        end

        describe 'when args is \'> 200\'' do
          it { expect(JpSki::Ski.canonicalize_comparison('> 200')).to eq ['>', 200] }
        end
      end

      describe 'when invalid args' do
        it do
          expect { JpSki::Ski.canonicalize_comparison('foo') }.to raise_error(ArgumentError)
          expect { JpSki::Ski.canonicalize_comparison('<< 1') }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
