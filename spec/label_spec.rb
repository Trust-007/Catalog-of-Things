require('./label/label')

describe Label do
  context 'When testing the Label class' do
    label = Label.new('string', 'yellow')
    it 'Test Object creation' do
      expect(label.title).to eq('string')
      expect(label.color).to eq('yellow')
    end

    it 'initializes an empty array' do
      expect(label.items).to eq([])
    end
  end

  describe '#add_item' do
    let(:label) { Label.new('Label 1', 'red') }
    let(:item) { double('item').as_null_object }
    it "sets the item's label to the current label" do
      allow(item).to receive(:label=)
      label.add_item(item)
      expect(item).to have_received(:label=).with(label)
    end
  end
end
