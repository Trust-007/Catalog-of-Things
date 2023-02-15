require '../../games_and_authors/game'

describe Game do
    context 'Testing the Book class creation' do
        let(:game1) { Game.new( Date.iso8601('2023-10-01'), 'multiplayer') }

        it 'game1 is an instance of Game class' do
           expect(game1).to be_instance_of(Game)
        end
    end
end
