# in spec/oystercard_spec.rb
require 'oystercard'

describe Oystercard do
	subject(:oystercard) {described_class.new}
	let(:minimum_fare) {Oystercard::MINIMUM_FARE}
	it 'has a balance of zero' do
    	expect(oystercard.balance).to eq(0)
  	end

	describe '#top_up' do

  		it 'can top up the balance' do
    		expect{ oystercard.top_up 1 }.to change{ oystercard.balance }.by 1
    	end
    	it 'raises an error if the maximum balance is exceeded' do
  			oystercard.top_up Oystercard::MAXIMUM_BALANCE
  			expect{ oystercard.top_up 1 }.to raise_error "Maximum balance of #{Oystercard::MAXIMUM_BALANCE} exceeded"
		end
  	end

  	context 'touch_in/touch_out' do
  		describe '#touch_in' do
  			it "can touch in" do
  				oystercard.top_up(minimum_fare)
  				oystercard.touch_in
  				expect(oystercard).to be_in_journey
			end
    		it 'raises an error if the £1 not on card' do
  				oystercard.top_up(minimum_fare-1)
  				expect{ oystercard.touch_in}.to raise_error "Need one £1 on card" 
			end
  		end
  		it 'is initially not in a journey' do
  			expect(oystercard).not_to be_in_journey
		end
		context '#touch_out' do
			it "can touch out" do
				oystercard.top_up(minimum_fare)
  				oystercard.touch_in
  				oystercard.touch_out
  				expect(oystercard).not_to be_in_journey
			end
			it 'raises an error if the £1 not on card' do
				oystercard.top_up(minimum_fare)
  				expect{ oystercard.touch_out}.to change{ oystercard.balance }.by -minimum_fare
			end
		end
  	end
end
