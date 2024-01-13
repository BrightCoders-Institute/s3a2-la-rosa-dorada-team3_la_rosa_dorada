# frozen_string_literal: false

# class Gilded
class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      case item.name
      when 'Aged Brie'
        update_aged_brie(item)
      when 'Backstage passes to a TAFKAL80ETC concert'
        update_backstage_passes(item)
      when 'Conjured Mana Cake'
        update_mana_cake(item)
      when 'Sulfuras, Hand of Ragnaros'
        next
      else
        update_regular_item(item)
      end
    end
  end

  def update_mana_cake(item)
    item.quality -= 1 if item.sell_in.positive?
    item.quality -= 2 if item.sell_in <= 0
    item.sell_in -= 1
    item.quality = 0 if item.quality.negative?
  end

  def update_aged_brie(item)
    item.quality += 1 if item.quality < 50
    item.sell_in -= 1
    item.quality += 1 if item.sell_in.negative? && item.quality < 50
  end

  def update_backstage_passes(item)
    item.quality += 2 if item.sell_in < 11 && item.sell_in > 5
    item.quality += 3 if item.sell_in < 6
    item.quality += 1 if item.quality < 50 && item.sell_in > 10
    item.sell_in -= 1
    item.quality = 0 if item.sell_in.negative?
    item.quality = 50 if item.quality > 50
  end

  def update_regular_item(item)
    item.quality -= 1 if item.quality.positive? && item.name != 'Sulfuras, Hand of Ragnaros'
    item.sell_in -= 1
    item.quality -= 1 if item.sell_in.negative? && item.quality.positive? && item.name != 'Aged Brie'
  end
end

# class for item
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
