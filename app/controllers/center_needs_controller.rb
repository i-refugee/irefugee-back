class center_needsNeedsController < ApplicationController
	before_action :authenticate_with_token!, only: [:destroy,:update,:create]

	before_action only: [:update, :destroy, :create] do |c|
		c.send(:find_and_authorize_resource, "center_invoked")
	end

	def index
		center_needs=Center.find_by(id: params[:center_id].center_needs.all
		render json:center_needs
	end

	def show
		center_needs=Center.find_by(id: params[:center_id].center_needs.find_by(id: params[:center_need_id])
		render json:center_needs
	end

	def create
		center_needs=@center.center_needs.new(need_id: params[:need_id],description: params[:description], importance: params[:importance])
		if center_needs.save
       	 	render json: center_needs, status: 201
      	else
        	render json: center_needs.errors, status: 422
        end
    end

    def update
		if @center.center_needs.find_by(id: params [:center_need_id]).update(center_needs_params)
			render_updated_resource @center.center_needs.find_by(id: params[:center_need_id])
		else
			saving_error @center.center_needs
		end
    end

    def destroy
    
    	@center.center_needs.find_by(params[:center_need_id]).destroy
    	head 204
    end
 	def center_needs_params
		params.require(:center_need).permit(description:, importance:)
	end
end
