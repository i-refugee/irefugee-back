class CenterKeywordController < ApplicationController
	before_action :authenticate_with_token!, only: [:destroy,:update,:create]

	before_action only: [:update, :destroy, :create] do |c|
		c.send(:find_and_authorize_resource, "center_invoked")
	end

	def index
		center_keywords=Center.find_by(id: params[:center_id].keywords.all
		render json:center_keywords
	end

	def show
		center_keyword=Center.find_by(id: params[:center_id].keywords.find_by(id: params[:keyword_id])
		render json:center_keyword
	end

	def create
		center_keywords=@center.center_keywords.new(_id: params[:keyword_id])
		if center_keyword.save
       	 	render json: center_keyword, status: 201
      	else
        	render json: center_keyword.errors, status: 422
        end
    end

  

    def destroy
    
    	@center.center_keywords.find_by(params[:center_keyword_id]).destroy
    	head 204
    end
 	
end
