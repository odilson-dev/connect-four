require_relative '../lib/board'
require_relative '../lib/player'
describe Board do
    subject(:board_test) { described_class.new }
    let(:tom_player) { Player.new("Tom", "X") }

    context "When a column is not full, it checks the column from bottom to top and add the token to the first empty case" do
            
        it "returns true when the column is not empty so it can add the token" do
                expect(board_test.drop_token(5 ,tom_player)).to be true
        end
    end

    context "When a column oris full with tokens for exemple 'X', the method #drop_token returns false which means it can't add token anymore" do
        before do
            
            7.times do
                board_test.drop_token(5, tom_player)
            end
        end
            
        it "returns false because the column 5 is full and can't no longer receive tokens" do
                expect(board_test.drop_token(5 ,tom_player)).to be false
        end
    end
end