require File.join(File.dirname(__FILE__), 'item')
require File.join(File.dirname(__FILE__), 'item_extension')
require File.join(File.dirname(__FILE__), 'gilded_rose_behaviour')

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each {|item| item.update}
  end
end