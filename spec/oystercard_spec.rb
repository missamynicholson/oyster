load "oystercard.rb"

describe Oystercard do
	it "shows the balance" do
  expect(subject.balance).to eq 0
	end

  it "tops up the balance" do
    expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
  end


end