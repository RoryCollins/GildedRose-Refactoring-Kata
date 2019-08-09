require File.join(File.dirname(__FILE__), 'item')

class Item
  def is_aged_brie?
    self.name == "Aged Brie"
  end

  def is_sulfuras?
    self.name == "Sulfuras, Hand of Ragnaros"
  end

  def is_backstage_pass?
    self.name == "Backstage passes to a TAFKAL80ETC concert"
  end
end


class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.is_aged_brie?
        item.sell_in -= 1
        if item.sell_in < 0
          item.quality += 1
        end
        item.quality += 1
        if item.quality > 50
          item.quality = 50
        end

      elsif item.is_sulfuras?

      elsif item.is_backstage_pass?
        item.sell_in -= 1
        item.quality += 1
        if item.sell_in < 10
          item.quality += 1
        end
        if item.sell_in < 5
          item.quality += 1
        end
        if item.sell_in < 0
          item.quality = 0
        end
        if item.quality > 50
          item.quality = 50
        end
      else
        if item.quality > 0
          item.quality = item.quality - 1
        end

        item.sell_in = item.sell_in - 1

        if item.sell_in < 0
          if item.quality > 0
            item.quality = item.quality - 1
          end
        end

      end

      
    end
  end
end