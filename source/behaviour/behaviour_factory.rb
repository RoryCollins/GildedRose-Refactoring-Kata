require File.join(File.dirname(__FILE__), 'gilded_rose_behaviour')
require File.join(File.dirname(__FILE__), 'aged_brie_behaviour')
require File.join(File.dirname(__FILE__), 'sulfuras_behaviour')
require File.join(File.dirname(__FILE__), 'conjured_item_behaviour')
require File.join(File.dirname(__FILE__), 'backstage_pass_behaviour')

class BehaviourFactory
  def get_behaviour item
    if item.is_sulfuras?
      SulfurasBehaviour.new
    elsif item.is_aged_brie?
      AgedBrieBehaviour.new
    elsif item.is_backstage_pass?
      BackstagePassBehaviour.new
    elsif item.is_conjured_item?
      ConjuredItemBehaviour.new
    else
       UpdateBehaviour.new
    end
  end
end
