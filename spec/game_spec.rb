require_relative '../games_and_authors/game'
require 'date'

describe Game do
  context 'Testing the Game class creation' do
    let(:game1) { Game.new(Date.iso8601('2023-10-01'), 'multiplayer', Date.iso8601('2023-01-01')) }
    let(:game2) { Game.new(Date.iso8601('2011-10-01'), 'multiplayer2', Date.iso8601('2020-10-01')) }

    it 'game1 should be an instance of Game class' do
      expect(game1).to be_instance_of(Game)
    end

    it 'game1 can_be_archived method should return false' do
      expect(game1.can_be_archived?).to be(false)
    end

    it 'game2 can_be_archived method should return true' do
      expect(game2.can_be_archived?).to be(true)
    end
  end
end
