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
		unless center_keyword
            head 404
        else 
            render json: center_keyword
        end	
    end

	def create
		keyword=Keyword.find_by(id: params[:data][:relationships][:keyword][:data][:id])
		center=Center.find_by(id: params[:data][:relationships][:center][:data][:id])
		center_keyword = CenterKeyword.new(center_id: center.id, keyword_id: keyword.id)
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
    	a = CenterKeyword.find_by(id: params[:id])
    	authorize(a.center)
    	a.destroy
    	head 204
    end
 	
end
