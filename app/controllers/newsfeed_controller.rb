class NewsfeedController < ApplicationController
	def index
		newsfeed=Newsfeed.all
		render json:newsfeed
	end
end
