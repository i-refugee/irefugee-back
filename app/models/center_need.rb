class CenterNeed < ActiveRecord::Base
	after_save :inform_newsfeed
	belongs_to :need
	belongs_to :center
	def inform_newsfeed
		Newsfeed.create(center_id: self.center_id,content: "Η ομάδα "+ self.center.name+" μόλις ενημέρωσε τις ανάγκες της στο πεδίο αναγκών:  "+self.need.name)
	end
end
