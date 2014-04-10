# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# This do nothing, only to check that connection is never closed
# on Rails

source = new EventSource('/events')

source.addEventListener('open', ->
  console.log('Opening connection')
)

source.addEventListener('error', ->
  console.log('Closing connection')
)

source.addEventListener('events-channel', (e) ->
  console.log(e.data)
)

console.log('♥ Server Events listener initialized')
