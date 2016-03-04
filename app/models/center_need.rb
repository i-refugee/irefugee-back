class CenterNeed < ActiveRecord::Base
	after_save :inform_newsfeed
	belongs_to :need
	belongs_to :center
	def inform_newsfeed
		Newsfeed.create(center_id: self.center_id,content: "Group "+ self.center.name+" has added need "+ self.need.name+" to each needs")
	end
end
