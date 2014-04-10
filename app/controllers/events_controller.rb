class EventsController < ApplicationController
  include ActionController::Live

  # GET /events
  def index
    response.headers['Content-Type'] = 'text/event-stream'

    Redis.new.subscribe('events-channel') do |on|
      on.message do |channel, message|
        response.stream.write(sse(channel, message))
      end
    end
  rescue IOError
    # This is never executed because SSE connection is never closed
  ensure
    # This is never executed because SSE connection is never closed
    response.stream.close
  end

  private

  def sse(event, data)
    "event: #{event}\ndata: #{data}\n\n"
  end
end
