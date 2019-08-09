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