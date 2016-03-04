module Errors

	def not_authenticated
		render json: { error: "An authentication token is required to request this resource." }, status: :unauthorized
	end

	def render_not_authorized
		render json: { error: "The authentication token is not allowed to access this resource." }, status: :unauthorized
	end

	def resource_does_not_exist
		render json: { error: "The requested resource was not found."}, status: 404
	end

	def saving_error resource
		render json: {error: resource.errors}, status: 422
	end

	def render_updated_resource resource
		render json: resource, status: 201
	end

	def render_created_resource resource
		render json: resource, status: 200
	end

	def resource_not_found resource
		render json: {error: "The requested " + resource + " was not found."}, status: 404
	end

	def render_boolean_response response
		render json: {response: response}
	end

	def render_successful_post
		head 204
	end

	def render_server_internal
		render json: { error: "An error occured. Please try again." }, status: 500
	end

	def render_successful_destroy
		head 204
	end

	def render_successful_update
		head 204
	end
end