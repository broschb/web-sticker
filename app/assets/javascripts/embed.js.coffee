$ ->
  registerProxy = undefined
  eventProxy = undefined
  registerProxy = new Porthole.WindowProxy()
  baseUrl = undefined
  pageTitle = undefined

  # Register an event handler to receive messages;
  registerProxy.addEventListener (event) ->
    proxyEvent(event)

  proxyEvent = (event) ->
    console.log(event)
    action = event.data.action
    switch action
      when "initialize"
        baseUrl = event.data.url
        pageTitle = event.data.pageTitle
        initializeProxy(baseUrl)
      when 'create'
        text = event.data.text
        pageUrl = event.data.pageUrl
        createSticker(text, pageUrl)

  createSticker = (text, pageUrl) ->
    $.post("/embed",
      baseUrl: baseUrl
      text: text
      pageTitle: pageTitle
      pageUrl: pageUrl
    ).done (data) ->
      eventProxy.post
        action: "success"
      return


  initializeProxy = (url) ->
    eventProxy = new Porthole.WindowProxy(url)
    eventProxy.addEventListener (event) ->
      proxyEvent(event)
    registerProxy.removeEventListener(proxyEvent)


  $('#add-sticker').click ->
    eventProxy.post
      action: "add-sticker"

  $('#login-sticker').click ->
    window.open('/');
