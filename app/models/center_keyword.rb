class CenterKeyword < ActiveRecord::Base
	after_save :inform_newsfeed
	belongs_to :center
	belongs_to :keyword

	def inform_newsfeed
    	Newsfeed.create(center_id: self.center_id,content: "Η ομάδα "+self.center.name+" μόλις πρόσθεσε το keyword "+ self.keyword.keyword+" στις άμεσες ανάγκες της")
    end

end
