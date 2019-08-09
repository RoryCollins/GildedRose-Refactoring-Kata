require File.join(File.dirname(__FILE__), 'item')
require File.join(File.dirname(__FILE__), 'gilded_rose_behaviour')

class Item

  attr_accessor :update_behaviour

  def choose_behaviour
    if self.is_sulfuras?
      self.update_behaviour = SulfurasBehaviour.new
    elsif self.is_aged_brie?
      self.update_behaviour = AgedBrieBehaviour.new    
    elsif self.is_backstage_pass?
      self.update_behaviour = BackstagePassBehaviour.new
    else
      self.update_behaviour = UpdateBehaviour.new
    end
  end

  def update_quality
    update_behaviour.update_quality self
  end
  def update_sell_in
    update_behaviour.update_sell_in self
  end

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
        item.choose_behaviour
        item.update_sell_in
        item.update_quality
    end
  end
end