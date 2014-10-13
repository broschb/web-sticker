$ ->
  registerProxy = undefined
  eventProxy = undefined
  registerProxy = new Porthole.WindowProxy()
  baseUrl = undefined

  # Register an event handler to receive messages;
  registerProxy.addEventListener (event) ->
    proxyEvent(event)

  proxyEvent = (event) ->
    action = event.data.action
    switch action
      when "initialize"
        baseUrl = event.data.url
        initializeProxy(baseUrl)
      when 'create'
        text = event.data.text
        console.log('proxy event with text' + text)

  initializeProxy = (url) ->
    eventProxy = new Porthole.WindowProxy(url)
    eventProxy.addEventListener (event) ->
      proxyEvent(event)


  $('#add-sticker').click ->
    eventProxy.post
      action: "add-sticker"
