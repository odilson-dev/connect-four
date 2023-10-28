require_relative '../lib/board'
require_relative '../lib/player'
describe Board do
    describe '#drop_token' do
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
    
    describe '#check_winner' do
        subject(:board_test2) { described_class.new }
        let(:peter_player) { Player.new("Tom", "X") }

        context "When a row of four of the exact same piece is aligned horizontaly" do
            before do
                4.times do | count |
                    # This code will add the same piece to the bottom of the four fisrt colums
                    board_test2.drop_token(count + 1, peter_player)
                end
            end
                
            it "returns true" do
                    expect(board_test2.check_winner).to be true
            end
        end
    end
end