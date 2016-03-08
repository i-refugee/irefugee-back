class CenterKeyword < ActiveRecord::Base
	after_save :inform_newsfeed
	belongs_to :center
	belongs_to :keyword

	def inform_newsfeed
    	Newsfeed.create(center_id: self.center_id,content: "Group "+self.center.name+" has added keyword "+ self.keyword.keyword+" to each keywords")
    end

end
