class ApplicationController < ActionController::API
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  include Authenticable
  include Errors
  include Authorizable
  include ActionController::Live

  def stream 
  	response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream, retry: 300, event: "event-name")
    sse.write({ event: 'happened'})
	ensure
		sse.closed
	end
end
