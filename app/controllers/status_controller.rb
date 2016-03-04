class StatusController < ApplicationController
	before_action :authenticate_with_token!, only: [:destroy,:update,:create]

	before_action :authenticate_with_token!, only: [:destroy,:update,:create]

	before_action only: [:update, :destroy, :create] do |c|
		c.send(:find_and_authorize_resource, "center_invoked")
	end

	def show
		statuses=center.find_by(id:params[:center_id]).statuses.all
		render json:statuses
	end

    def create
		status=@current_center.statuses.new(context: params[:context])
		if status.save
       	 	render json: status, status: 201
      	else
        	render json: status.errors, status: 422
        end
    end

   def update
   		status=@current_center.statuses.find_by(id: params[:status_id]).update(context: params[:context])
   		render_updated_resource status
		else
			saving_error @status
		end


    def destroy
    	status=@current_center.statuses.find_by(id: params[:status_id])
    	status.destroy
    	head 204
    end



end
