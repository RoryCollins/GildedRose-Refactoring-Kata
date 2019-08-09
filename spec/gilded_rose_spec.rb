require File.join(File.dirname(__FILE__), '../source/gilded_rose')


def an_item(days, quality)
	Item.new("foo", days, quality)
end

def an_aged_brie(days, quality)
	Item.new("Aged Brie", days, quality)
end

def a_sulfuras(days, quality)
	Item.new("Sulfuras, Hand of Ragnaros", days, quality)
end

def a_backstage_pass(days, quality)
	Item.new("Backstage passes to a TAFKAL80ETC concert", days, quality)
end

def a_conjured_item(days, quality)
	Item.new("Conjured Mana Cake", days, quality)
end



describe GildedRose do

  describe "#regular item" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
    it "does not reduce the quality below zero" do
      items = [an_item(0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end
    it "decreases sell_in value by one after one day" do
    	items = [an_item(10, 0)]
    	GildedRose.new(items).update_quality()
    	expect(items[0].sell_in).to eq 9
    end
    it "decreases quality by one after one day when within date" do
    	items = [an_item(10, 10)]
    	GildedRose.new(items).update_quality()
    	expect(items[0].quality).to eq 9
    end
    it "decreases quality by two after one day when not within date" do
    	items = [an_item(0, 10)]
    	GildedRose.new(items).update_quality()
    	expect(items[0].quality).to eq 8
    end
  end

  describe "#aged brie special case" do
  	it "slightly increases quality within sell_in date" do
    	items = [an_aged_brie(1, 10)]
  		GildedRose.new(items).update_quality
  		expect(items[0].quality).to eq 11
  	end
  	it "increases quality by 2 after sell_in date" do
    	items = [an_aged_brie(0, 10)]
  		GildedRose.new(items).update_quality
  		expect(items[0].quality).to eq 12
  	end
  	it "does not increase quality beyond 50" do
    	items = [an_aged_brie(0, 49)]
  		GildedRose.new(items).update_quality
  		expect(items[0].quality).to eq 50
  	end
  end

  describe "#sulfuras special case" do
  	it "does change quality" do
  		items = [a_sulfuras(10, 80)]
  		GildedRose.new(items).update_quality
  		expect(items[0].quality).to eq 80
  	end
  	it "does not expire" do
  		items = [a_sulfuras(10, 80)]
  		GildedRose.new(items).update_quality
  		expect(items[0].sell_in).to eq 10
  	end
  end

  describe "#backstage pass special case" do
  	it "increases quality more than 10 days from sell_in date" do
  		items = [a_backstage_pass(15, 10)]
  		GildedRose.new(items).update_quality
  		expect(items[0].quality).to eq 11
  	end
  	it "increases quality by 2 when there are 10 days or less" do
  		items = [a_backstage_pass(10, 10)]
  		GildedRose.new(items).update_quality
  		expect(items[0].quality).to eq 12
  	end
  	it "increases quality by 3 when there are 5 days or less" do
  		items = [a_backstage_pass(5, 10)]
  		GildedRose.new(items).update_quality
  		expect(items[0].quality).to eq 13
  	end
  	it "drops quality to zero after the concert" do
  		items = [a_backstage_pass(0, 10)]
  		GildedRose.new(items).update_quality
  		expect(items[0].quality).to eq 0
  	end
  	it "does not increase quality beyond 50" do
    	items = [a_backstage_pass(3, 49)]
  		GildedRose.new(items).update_quality
  		expect(items[0].quality).to eq 50
  	end
  end

  describe "#conjured item special case" do
  	it "degrades twice as fast as regular item within sell date" do
  		items = [a_conjured_item(1, 10)]
  		GildedRose.new(items).update_quality
  		expect(items[0].quality).to eq 8
  	end
  	it "degrades twice as fast as regular item after sell date" do
  		items = [a_conjured_item(0, 10)]
  		GildedRose.new(items).update_quality
  		expect(items[0].quality).to eq 6
  	end
  	it "does not degrade below zero quality" do
  		items = [a_conjured_item(0, 2)]
  		GildedRose.new(items).update_quality
  		expect(items[0].quality).to eq 0
  	end
  end



end
