module ApplicationHelper
	def inform_newsfeed
		Newsfeed.create(content: "aaaa")

	end
end
