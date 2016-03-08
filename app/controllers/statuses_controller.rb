class StatusesController < ApplicationController
	before_action :authenticate_with_token!, only: [:destroy,:update,:create]

	before_action :authenticate_with_token!, only: [:destroy,:update,:create]

	before_action only: [:update] do |c|
		c.send(:find_and_authorize_resource, "center_invoked")
	end

	def show
		render json: Status.find_by(id: params[:id])
	end

	def index
		statuses=center.find_by(id:params[:center_id]).statuses.all
		render json:statuses
	end

    def create
    	center = Center.find_by(id: params[:data][:relationships][:center][:data][:id])
    	authorize(center)
		status=Status.new(center_id: center.id, context: params[:data][:attributes][:context])
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
    	status=Status.find_by(id: params[:id])
    	authorize(status.center)
    	status.destroy
    	head 204
    end



end
