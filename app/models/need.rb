class Need < ActiveRecord::Base
	after_save :inform_newsfeed
	has_many :center_needs
	has_many :centers, through: :center_needs
	has_many :keywords
	def inform_newsfeed
		Newsfeed.create(content: "Ένα νέο πεδίο αναγκών με όνομα "+self.name+" μόλις προστέθηκε στη βάση μας")
	end
end
