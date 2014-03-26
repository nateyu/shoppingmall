class Homepageloc < ActiveRecord::Base
  self.table_name = 'HOMEPAGELOCS'
  belongs_to :mall, foreign_key: 'mallid'
  
  LOCTYPE = [['商家', 'A'], ['商品', 'B'], ['活动', 'C']]

  LOCATIONS = {
    'A' => [1,2,3,4,5],
    'B' => [0,1,2,3,4,5,6,7],
    'C' => [0,1,2,3,4,5,6,7]
  }

  ITEMS = {
    'A' => 'Customer',
    'B' => 'Good',
    'C' => 'Activity'
  }

  class << self
    def available_locations mallid, item_type
      locs = LOCATIONS[item_type].clone
      where(mallid: mallid, loctype: item_type).each do |i|
        locs.delete(i.location)
      end
      locs
    end

    def available_items mallid, item_type
      invalid_items = where(mallid: mallid, loctype: item_type).map { |e| e.itemid  }
      return [] if invalid_items.size == LOCATIONS[item_type].size
      ITEMS[item_type].constantize
                      .where(mallid: mallid).where.not(id: invalid_items)
                      .map { |e| [e.id, e.name] }
    end
  end

  def item
    ITEMS[self.loctype].constantize.find_by_id self.itemid
  end

  def type_name
    LOCTYPE.rassoc(self.loctype).try(:first)
  end
end
