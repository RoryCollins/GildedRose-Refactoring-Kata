require File.join(File.dirname(__FILE__), 'item')
require File.join(File.dirname(__FILE__), 'item_extension')

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each {|item| item.update}
  end
end