class Need < ActiveRecord::Base
	after_save :inform_newsfeed
	has_many :center_needs
	has_many :centers, through: :center_needs
	has_many :keywords
	def inform_newsfeed
		Newsfeed.create(content: "A new need named "+self.name+" has just been added to our database")
	end
end
