class Keyword < ActiveRecord::Base
	after_save :inform_newsfeed
	has_many :center_keywords
	has_many :centers, through: :center_keywords
	belongs_to :need
	def inform_newsfeed
		Newsfeed.create(content: "Ένα keyword με όνομα "+self.keyword+" μόλις προστέθηκε στη βάση μας")
	end
end
