class Newsfeed < ActiveRecord::Base
	before_create :limit_it
	belongs_to :center
	def limit_it
		Newsfeed.first.destroy if Newsfeed.count > 200
	end
end
