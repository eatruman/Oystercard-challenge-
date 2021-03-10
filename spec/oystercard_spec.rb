require 'oystercard'
require 'station'
require 'journey'
# challenge 3: I want to my card to have a balance
describe Oystercard do
  # card = Oystercard.new
  let(:card) { Oystercard.new(5) }
  let(:station) { double :station }
  it 'creates a new card with a balance of 0' do
    expect(subject.balance).to eq(0)
  end
  describe '#top_up' do
    context 'before reaching card limit' do
    # challenge 5: I want to top up my card
      it 'tops up the balance of the card' do
        # allow(card).to receive(:balance) { 0 }
        expect(card.top_up(5)).to eq(10)
      end
    end
    context 'going over card limit' do
    # challenge 6: I want a maximum amount
      it 'raises an error' do
        expect { card.top_up(91) }.to raise_error 'Maximum balance reached'
      end
    end
  end

  #challenge 8
  # describe '#in_journey?' do
  #   it 'return false when not in journey' do
  #     expect(card.in_journey?).to eq(false)
  #   end
  # end

describe '#touch_in' do
    context 'when equal to or above minimum balance' do
      # it 'set in_journey? to true' do
      #
      #   card.touch_in(station)
      #   expect(card.in_journey?).to eq(true)
      # end
      it 'return touch-in confirmation' do

        expect(card.touch_in(station)).to eq("Touched in successfully")
      end
    end

    #Challenge 9
    context 'when below the minimum balance' do
      it "raises an error when you touch in" do
        expect { subject.touch_in(station) }.to raise_error "Balance below minimum."
      end
    end
end

  describe '#touch_out' do
    before(:all) do
        card.touch_in(station)
      it 'sets in_journey? to false' do
        card.touch_out
        expect(card.in_journey?).to eq(false)
      end
      it 'returns touch-out confirmation' do
        expect(card.touch_out).to eq("Touched out successfully")
      end
       it "deducts fare from balance" do
         expect { card.touch_out }.to change { card.balance }.by(-1)
       end
       it "sets entry station to nil" do
         card.touch_out
         expect(card.entry_station).to eq(nil)
       end
    end
  end
  # Challenge 11
  # describe '#entry_station' do
  #   it 'checks the entry station of the card' do
  #     card.touch_in("Victoria")
  #     expect(card.entry_station).to eq("Victoria")
  #   end
  # end
  # Challenge 12
  describe "#trip_history" do
    let(:journey) { { entry_station: "Victoria", exit_station: "King's Cross"} }

    it "had an empty list by default" do
      expect(card.trip_history).to be_empty
    end

    it 'lists the past trips' do
      card.touch_in("Victoria")
      card.touch_out("King's Cross")
      expect(card.trip_history).to eq([journey])
    end
  end
end
