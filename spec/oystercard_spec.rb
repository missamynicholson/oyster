load "oystercard.rb"

describe Oystercard do
	it "shows the balance" do
  expect(subject.balance).to eq 0
	end
end