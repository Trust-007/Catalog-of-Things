require_relative '../games_and_authors/author'
require './item'
require 'date'

describe Author do
  context 'Testing the Author class creation' do
    let(:author1) { Author.new('Trust', 'Simeon') }
    let(:item1) { Item.new('05/03/2033') }

    it 'author1 should an instance of Author class' do
      expect(author1).to be_instance_of(Author)
    end

    it 'item1 should be in author1 items array' do
      author1.add_item(item1)
      expect(author1.items[0]).to be(item1)
    end

    it 'item1.author should be equal to author1' do
      author1.add_item(item1)
      expect(item1.author).to eq(author1)
    end
  end
end
