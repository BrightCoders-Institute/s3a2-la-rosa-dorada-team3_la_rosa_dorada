# frozen_string_literal: false

# GildedRose
class GildedRose
  def initialize(items)
    @items = items
  end

  # def names(_name, _quality, _sell)
  #   _name = item.name
  #   _quality = item.quality
  #   _sell = item.sell_in
  # end

  def update_quality
    @items.each do |item|
      name = item.name
      quality = item.quality
      sell = item.sell_in

      if name != 'Aged Brie' && name != 'Backstage passes to a TAFKAL80ETC concert'
        quality -= 1 if quality > 0 && (name != 'Sulfuras, Hand of Ragnaros')

      elsif quality < 50
        quality += 1
      end

      if name == 'Backstage passes to a TAFKAL80ETC concert'
        quality += 1 if sell < 11 && (quality < 50)
        quality += 1 if sell < 6 && (quality < 50)
      end

      sell -= 1 if name != 'Sulfuras, Hand of Ragnaros'

      # if sell < 0
      #   if name != 'Aged Brie' && name != 'Backstage passes to a TAFKAL80ETC concert'
      #     # if name != 'Backstage passes to a TAFKAL80ETC concert'
      #     quality -= quality > 0 && (name != 'Sulfuras, Hand of Ragnaros') ? 1 : quality

      #   elsif quality < 50
      #     quality += 1

      #     # else
      #     #   quality -= quality
      #   end
      # end
    end
  end
end

# item
class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
