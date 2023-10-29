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
        let(:peter_player) { Player.new("Peter", "X") }

        context "When a row of four of the exact same piece is aligned horizontaly" do
            before do
                4.times do | count |
                    # This code will add the same piece to the bottom of the four fisrt colums
                    board_test2.drop_token(count + 1, peter_player)
                end
            end
                
            it "returns true when a row of four of the exact same piece is aligned horizontaly" do
                expect(board_test2.check_winner(peter_player)).to be true
            end
        end

        context "When a row of four of the exact same piece is aligned vertically" do
            subject(:board_test3) { described_class.new }
            before do
                4.times do 
                    # This code will add the same piece vertically to the third column
                    board_test3.drop_token(3, peter_player)
                end
            end
                
            it "returns true when a row of four of the exact same piece is aligned vertically" do
                expect(board_test3.check_winner(peter_player)).to be true
            end
        end

        context "When a row of four of the exact same piece is aligned diagonally sfrom BOTTOM to TOP -> '/'" do
            subject(:board_test4) { described_class.new }
            let(:peter_player) { Player.new("Peter", "X") }
            let(:tom_player) { Player.new("Tom", "O") }
            before do
                # This code will add the same piece vertically to the third column
                board_test4.drop_token(1, peter_player)

                board_test4.drop_token(2, tom_player)
                board_test4.drop_token(2, peter_player)

                board_test4.drop_token(3, tom_player)
                board_test4.drop_token(3, tom_player)
                board_test4.drop_token(3, peter_player)

                board_test4.drop_token(4, tom_player)
                board_test4.drop_token(4, tom_player)
                board_test4.drop_token(4, tom_player)
                board_test4.drop_token(4, peter_player)
            end
                
            it "returns true when a row of four of the exact same piece is aligned diagonally from BOTTOM to TOP -> '/'" do
                expect(board_test4.check_winner(peter_player)).to be true
            end
        end

        context "When a row of four of the exact same piece is aligned diagonally from TOP to BOTTOM -> ( \ ) " do
            subject(:board_test5) { described_class.new }
            let(:peter_player) { Player.new("Peter", "X") }
            let(:tom_player) { Player.new("Tom", "O") }
            before do
                # This code will add the same piece vertically to the third column
                board_test5.drop_token(1, tom_player)
                board_test5.drop_token(1, tom_player)
                board_test5.drop_token(1, tom_player)
                board_test5.drop_token(1, peter_player)

                board_test5.drop_token(2, tom_player)
                board_test5.drop_token(2, tom_player)
                board_test5.drop_token(2, peter_player)

                board_test5.drop_token(3, tom_player)
                board_test5.drop_token(3, peter_player)

                board_test5.drop_token(4, peter_player)    
            end
                
            it "returns true when a row of four of the exact same piece is aligned diagonally from TOP to BOTTOM -> ( \ ) " do
                expect(board_test5.check_winner(peter_player)).to be true
            end
        end
    end
    
    describe "#full?" do
        let(:peter_player) { Player.new("Peter", "X") }
        context "When the board is full" do
            subject(:board_test6) { described_class.new }
            before do
                6.times do 
                    7.times do | count |
                        board_test6.drop_token(count + 1, peter_player)
                    end
                end
            end
            it "returns true" do
                expect(board_test6).to be_full
            end
        end

        context "When the board is not full yet" do
            subject(:board_test7) { described_class.new }
            before do
                5.times do 
                    7.times do | count |
                        board_test7.drop_token(count + 1, peter_player)
                    end
                end
            end
            it "returns false" do
                expect(board_test7).to_not be_full
            end
        end
    end
end