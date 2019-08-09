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