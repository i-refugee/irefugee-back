class Status < ActiveRecord::Base
	after_save :inform_newsfeed
	belongs_to :center
	def inform_newsfeed
    	Newsfeed.create(center_id: self.center_id,content: "Η ομάδα "+ Center.find_by(id: self.center_id).name+" μόλις ενημέρωσε το status της\n"+self.context[0..40])
    end

end
