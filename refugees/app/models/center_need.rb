class CenterNeed < ActiveRecord::Base
	after_save :inform_newsfeed
	belongs_to :need
	belongs_to :center
	def inform_newsfeed
		Newsfeed.create(center_id: self.center_id,content: "Group "+ Center.find_by(id: self.center_id).name+" has added need "+ Need.find_by(id: self.need_id).name+" to each needs")
	end
end
