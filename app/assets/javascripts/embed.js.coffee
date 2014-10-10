$ ->
  registerProxy = undefined
  eventProxy = undefined
  registerProxy = new Porthole.WindowProxy()
  eventProxy = new Porthole.WindowProxy()

  # Register an event handler to receive messages;
  #TODO need to have first event send over the parent so events can be sent back
  registerProxy.addEventListener (event) ->
    proxyEvent(event)

  eventProxy.addEventListener (event) ->
    proxyEvent(event)

  proxyEvent = (event) ->
    console.log('have event')

  $('#add-sticker').click ->
    console.log 'addsticker'
