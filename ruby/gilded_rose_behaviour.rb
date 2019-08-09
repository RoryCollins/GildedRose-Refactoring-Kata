class UpdateBehaviour
  def update_quality item
    item.quality-=1
    if item.sell_in < 0
      item.quality  -= 1
    end
    if item.quality < 0
      item.quality = 0
    end
  end
  def update_sell_in item
    item.sell_in -= 1
  end
end

class SulfurasBehaviour < UpdateBehaviour
  def update_quality item
  end
  def update_sell_in item
  end
end

class AgedBrieBehaviour < UpdateBehaviour
  def update_quality item
    if item.sell_in < 0
      item.quality += 1
    end
    item.quality += 1
    if item.quality > 50
      item.quality = 50
    end
  end
end

class BackstagePassBehaviour < UpdateBehaviour
  def update_quality item
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
  end
end

class ConjuredItemBehaviour < UpdateBehaviour
  def update_quality item
    item.quality -= 2
    if item.sell_in < 0
      item.quality  -= 2
    end
    if item.quality < 0
      item.quality = 0
    end
  end
end