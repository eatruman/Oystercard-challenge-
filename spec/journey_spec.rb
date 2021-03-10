require "journey"
require "station"
require "oystercard"
describe Journey do
  let(:station) { Station.new }
  let(:card) { Oystercard.new }
 describe "#start_journey" do
     it "returns the entry station" do
     expect(subject.start_journey(station)).to eq(station)
   end
 end
 describe '#entry_station' do
   it 'checks the entry station of the card' do
     expect(subject.start_journey(station)).to eq(station)
   end
 end
 describe '#end_journey' do
   it 'returns the exit station' do
     expect(subject.end_journey(station)).to eq(station)
   end
 end
 describe '#in_journey?' do
   it 'states if you are in a journey or not' do
     expect(subject.in_journey?).to eq(false)
   end
 end
end
