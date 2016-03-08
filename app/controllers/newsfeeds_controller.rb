class NewsfeedsController < ApplicationController
	def index
		newsfeed=Newsfeed.all.order(id: :desc)
		render json:newsfeed
	end
end
