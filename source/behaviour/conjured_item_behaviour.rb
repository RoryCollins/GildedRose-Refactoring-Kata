class ConjuredItemBehaviour < UpdateBehaviour
  def update_quality_before_sell_date_for item
    item.quality-=2
  end

  def update_quality_after_sell_date_for item
    item.quality-=4
  end
end