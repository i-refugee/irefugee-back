class CenterKeyword < ActiveRecord::Base
	after_save :inform_newsfeed
	belongs_to :center
	belongs_to :keyword

	def inform_newsfeed
    	Newsfeed.create(center_id: self.center_id,content: "Group "+Center.find_by(id: self.center_id).name+" has added keyword "+ Keyword.find_by(id: self.keyword_id).keyword+" to each keywords")
    end

end
