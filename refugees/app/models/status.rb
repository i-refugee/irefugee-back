class Status < ActiveRecord::Base
	after_save :inform_newsfeed
	belongs_to :center
	def inform_newsfeed
    	Newsfeed.create(center_id: self.center_id,content: "Group"+ Center.find_by(id: self.center_id).name+" has updated theis status")
    end

end
