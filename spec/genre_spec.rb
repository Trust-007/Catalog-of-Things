require_relative '../music/genre'

describe Genre do
  before(:each) do
    @genre = Genre.new('Ada')
  end
  it 'should be an instance of Genre class' do
    expect(@genre).to be_instance_of(Genre)
  end
end
