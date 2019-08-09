require File.join(File.dirname(__FILE__), 'item')

class Item

  attr_accessor :update_behaviour

  # def update_item_sell_in
  #   self.sell_in = @sell_in_behaviour.update_sell_in self.sell_in
  # end

  # def update_item_quality
  #   self.quality = @quality_behaviour.update_quality self.quality self.sell_in
  # end

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
    self.quality = update_behaviour.update_quality self.quality, self.sell_in
  end
  def update_sell_in
    self.sell_in = update_behaviour.update_sell_in self.sell_in
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

class UpdateBehaviour
  def update_quality quality, sell_in
    new_quality = quality-1
    if sell_in < 0
      new_quality  -= 1
    end
    if new_quality < 0
      new_quality = 0
    end
    new_quality 
  end
  def update_sell_in sell_in
    sell_in - 1
  end
end

class SulfurasBehaviour < UpdateBehaviour
  def update_quality quality, sell_in
    quality
  end
  def update_sell_in sell_in
    sell_in
  end
end

class AgedBrieBehaviour < UpdateBehaviour
  def update_quality quality, sell_in
    if sell_in < 0
      quality += 1
    end
    quality += 1
    if quality > 50
      quality = 50
    end
    quality
  end
end

class BackstagePassBehaviour < UpdateBehaviour
  def update_quality quality, sell_in
      quality += 1
      if sell_in < 10
        quality += 1
      end
      if sell_in < 5
        quality += 1
      end
      if sell_in < 0
        quality = 0
      end
      if quality > 50
        quality = 50
      end
      quality
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