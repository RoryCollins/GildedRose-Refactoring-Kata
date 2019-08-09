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

class UpdateBehaviour

  attr_accessor :minimum_quality, :maximum_quality

  def initialize
    @minimum_quality = 0
    @maximum_quality = 50
  end

  def update item
    update_sell_in item
    update_quality item
  end

  def update_quality item
    if item.sell_in >= 0
      update_quality_before_sell_date_for item
    end

    if item.sell_in < 0
      update_quality_after_sell_date_for item
    end

    if item.quality < minimum_quality
      item.quality = minimum_quality
    end

    if item.quality > maximum_quality
      item.quality = maximum_quality
    end
  end

  def update_quality_before_sell_date_for item
    item.quality -= 1
  end

  def update_quality_after_sell_date_for item
    item.quality -= 2
  end

  def update_sell_in item
    item.sell_in -= 1
  end
end

class SulfurasBehaviour < UpdateBehaviour
  def update_quality item;  end
  def update_sell_in item;  end
end

class AgedBrieBehaviour < UpdateBehaviour

  def update_quality_before_sell_date_for item
    item.quality+=1
  end

  def update_quality_after_sell_date_for item
    item.quality+=2
  end

end

class BackstagePassBehaviour < UpdateBehaviour
  def update_quality_before_sell_date_for item
    item.quality += 1
    if item.sell_in < 10
      item.quality += 1
    end
    if item.sell_in < 5
      item.quality += 1
    end
  end

  def update_quality_after_sell_date_for item
    item.quality=0
  end
end

class ConjuredItemBehaviour < UpdateBehaviour
  def update_quality_before_sell_date_for item
    item.quality-=2
  end

  def update_quality_after_sell_date_for item
    item.quality-=4
  end
end