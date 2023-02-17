require 'date'
require('./book')

describe Book do
  context 'Testing the Book class creation' do
    let(:book1) { Book.new(Date.iso8601('2023-10-01'), 'New York Times', 'Bad') }
    let(:book2) { Book.new(Date.iso8601('2022-10-04'), 'Nairobi Book club', 'Good') }

    it 'Returns publisher' do
      expect(book1.publisher).to eq('New York Times')
      expect(book2.publisher).to eq('Nairobi Book club')
    end

    it 'Returns cover state' do
      expect(book1.cover_state).to eq('Bad')
      expect(book2.cover_state).to eq('Good')
    end

    it 'Returns published date' do
      expect(book1.publish_date).to eq(Date.iso8601('2023-10-01'))
      expect(book2.publish_date).to eq(Date.iso8601('2022-10-04'))
    end
  end

  context "Testing the 'can_be_archived_method' " do
    it 'Returns true' do
      book = Book.new(Date.iso8601('2023-10-01'), 'Nrb Publishers', 'Bad')
      expect(book.can_be_archived?).to eq(true)
    end

    it 'Returns false' do
      book = Book.new(Date.iso8601('2023-10-01'), 'Nairobi Publishers', 'Good')
      expect(book.can_be_archived?).to eq(false)
    end
  end
end
