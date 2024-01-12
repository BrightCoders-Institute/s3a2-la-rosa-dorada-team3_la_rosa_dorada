# frozen_string_literal: false

require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'fixme'
    end
  end
end

describe Item do
  describe '#initialize' do
    it 'sets the instance variables correctly' do
      name = 'Sample'
      sell_in = 7
      quality = 5

      item = Item.new(name, sell_in, quality)

      expect(item.instance_variable_get(:@name)).to eq(name)
      expect(item.instance_variable_get(:@sell_in)).to eq(sell_in)
      expect(item.instance_variable_get(:@quality)).to eq(quality)
    end
  end
  describe '#to_s' do
    it 'return the correct string' do
      name = 'Sample'
      sell_in = 7
      quality = 5

      item = Item.new(name, sell_in, quality)

      expect(item.to_s).to eq(name)
      expect(item.to_s).to eq(sell_in)
      expect(item.to_s).to eq(quality)
    end
  end
end
