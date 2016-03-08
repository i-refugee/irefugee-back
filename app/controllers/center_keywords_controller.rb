class CenterKeywordsController < ApplicationController
	before_action :authenticate_with_token!, only: [:destroy,:update,:create]

	before_action only: [:update] do |c|
		c.send(:find_and_authorize_resource, "center_invoked")
	end

	def index
		center_keywords=Center.find_by(id: params[:center_id]).keywords.all
		render json:center_keywords
	end

	def show
		center_keyword=CenterKeyword.find_by(id: params[:id])
		render json: center_keyword
	end

	def create
		keyword=Keyword.find_by(id: params[:data][:relationships][:keyword][:data][:id])
		center=Center.find_by(id: params[:data][:relationships][:center][:data][:id])
		center_keyword = CenterKeyword.new(center_id: center.id, keyword_id: keyword.id)
		if center_keyword.save
       	 	render json: center_keyword, status: 201
      	else
        	render json: center_keyword.errors, status: 422
        end
    end
  

    def destroy
    	a = CenterKeyword.find_by(id: params[:id])
    	authorize(a.center)
    	a.destroy
    	head 204
    end
 	
end
