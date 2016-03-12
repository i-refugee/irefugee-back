class ApplicationController < ActionController::API
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  include Authenticable
  include Errors
  include Authorizable
  include ActionController::Live
  $event=false
  def stream2
      response.headers['Content-Type'] = 'text/event-stream'
      currentlastid = Newsfeed.last.id
      sse = SSE.new(response.stream, retry: 300, event: "message")

      begin
        loop do       
          if Newsfeed.last.id > currentlastid
            sse.write({ event: 'happened'})
            currentlastid = Newsfeed.last.id
          else
          end
          sleep(3)
        end
      rescue IOError

      ensure
        sse.close
      end
	end

  def stream
    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream, retry: 300, event: "message")
    while 1
      
      if $event
        id=Newsfeed.last.id
        sse.write({ event: id})
      else
      end
      $event=false
      sse.close
      sleep(3)

    end
  
    end
  #end
end
