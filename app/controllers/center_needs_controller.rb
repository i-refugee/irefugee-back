class CenterNeedsController < ApplicationController
	before_action :authenticate_with_token!, only: [:destroy,:update,:create]

	before_action only: [:destroy, :create] do |c|
		c.send(:find_and_authorize_resource, "center_invoked")
	end

	def index
#		center_needs = Center.find_by(id: params[:center_id].center_needs.all
#		render json: center_needs
	end

	def show
		center_needs = CenterNeed.find_by(id: params[:id])
		unless center_needs
			head 404
		else
			render json:center_needs
		end
	end

	def create
		center_needs=@center.center_needs.new(center_need_params)
		if center_needs.save
       	 	render json: center_needs, status: 201
      	else
        	render json: center_needs.errors, status: 422
        end
    end

    def update
    	center_need = CenterNeed.find_by(id: params[:id])
		if center_need.update(center_needs_params)
			render_updated_resource center_need
		else
			saving_error center_need
		end
    end

    def destroy
    	@center.center_needs.find_by(params[:center_need_id]).destroy
    	head 204
    end

    def center_needs_params
		params.require(:data).require(:attributes).permit(:description, :importance)
	end

end
