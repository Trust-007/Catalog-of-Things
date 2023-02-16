require 'date'
require_relative '../music/music_album'

describe MusicAlbum do
  let(:id) { 1 }
  let(:publish_date) { Date.new(2022, 1, 1) }

  describe '#initialize' do
    it 'sets the on_spotify, id, and publish_date attributes' do
      album = MusicAlbum.new(true, id, publish_date)
      expect(album.on_spotify).to eq(true)
      expect(album.id).to eq(id)
      expect(album.publish_date).to eq(publish_date)
    end
  end

  describe '#can_be_archived?' do
    context "when the item can't be archived" do
      it 'returns false' do
        album = MusicAlbum.new(true, id, publish_date)
        allow(album).to receive(:super).and_return(false)
        expect(album.can_be_archived?).to eq(false)
      end
    end

    context 'when the item is not on Spotify' do
      it 'returns false' do
        album = MusicAlbum.new(false, id, publish_date)
        allow(album).to receive(:super).and_return(true)
        expect(album.can_be_archived?).to eq(false)
      end
    end
  end
end
