class Visible < ActiveRecord::Base
	def inform_newsfeed(model_name)
		Newsfeed.create(content: "content", model: model_name)
	end
end
