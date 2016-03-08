class CenterKeyword < ActiveRecord::Base
	after_save :inform_newsfeed
	belongs_to :center
	belongs_to :keyword

	def inform_newsfeed
    	Newsfeed.create(center_id: self.center_id,content: "Η ομάδα "+Center.find_by(id: self.center_id).name+" μόλις πρόσθεσε το keyword "+ Keyword.find_by(id: self.keyword_id).keyword+" στις άμεσες ανάγκες της")
    end

end
