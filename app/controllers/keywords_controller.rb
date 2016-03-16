class KeywordsController < ApplicationController
	before_action :authenticate_with_token_admin!, only: [:create, :destroy]
	


	def index
		unless params[:center_id]
			keywords=Keyword.all
			render json:keywords
		else
			render json: Center.find_by(id: params[:center_id]).keywords.all
		end
	end

	def show
		keyword=Keyword.find_by(id: params[:id])
		unless keyword
			head 404
		else 
			render json:keyword	
		end
		
	end

	def create
		keyword=Keyword.new(keyword: params[:keyword],need_id: params[:need_id])
		if keyword.save
       	 	render_created_resource keyword
      	else
        	saving_error keyword
        end
    end

   

    def destroy
    	keyword=Keyword.find_by(id: params[:keyword_id])
    	keyword.destroy
    	render_successful_destroy
    end
end
