class CenterKeywordsController < ApplicationController
	before_action :authenticate_with_token!, only: [:destroy,:update,:create]

	before_action only: [:update, :destroy, :create] do |c|
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
		center_keywords=@center.center_keywords.new(id: params[:keyword_id])
		if center_keyword.save
       	 	render_created_resource center_keywords
      	else
      		saving_error center_keywords
        end
    end

    def update
    	keyword=Keyword.find_by(id: params[:id])
    	if @current_center.keywords<<keyword
    		render_updated_resource keyword
    	else
    		saving_error keyword
    	end
    end



  

    def destroy
    
    	@center.center_keywords.find_by(params[:center_keyword_id]).destroy
    	head 204
    end
 	
end
