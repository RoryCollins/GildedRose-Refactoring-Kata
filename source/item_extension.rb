require File.join(File.dirname(__FILE__), 'behaviour/behaviour_factory')

class Item
  attr_accessor :update_behaviour

  def is_aged_brie?
    self.name == "Aged Brie"
  end

  def is_sulfuras?
    self.name == "Sulfuras, Hand of Ragnaros"
  end

  def is_backstage_pass?
    self.name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def is_conjured_item?
    self.name == "Conjured Mana Cake"
  end

  def update
    update_behaviour = BehaviourFactory.new.get_behaviour self
    update_behaviour.update self
  end
end