class KeywordsController < ApplicationController
	before_action :authenticate_with_token_admin!, only: [:create, :destroy]
	


	def index
		keywords=Keyword.all
		render json:keywords
	end

	def show
		keyword=Keyword.find_by(id: params[:id])
		render json:keyword
	end

	def create
		keyword=Keyword.new(keyword: params[:keyword],need_id: params[:need_id])
		if keyword.save
       	 	render json: keyword, status: 201
      	else
        	render json: keyword.errors, status: 422
        end
    end

   

    def destroy
    	keyword=Keyword.find_by(id: params[:keyword_id])
    	keyword.destroy
    	head 204
    end
end
