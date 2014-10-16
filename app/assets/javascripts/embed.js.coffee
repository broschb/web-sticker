$ ->
  registerProxy = undefined
  eventProxy = undefined
  registerProxy = new Porthole.WindowProxy()
  baseUrl = undefined
  pageTitle = undefined
  pageUrl = undefined

  # Register an event handler to receive messages;
  registerProxy.addEventListener (event) ->
    proxyEvent(event)

  proxyEvent = (event) ->
    action = event.data.action
    switch action
      when "initialize"
        baseUrl = event.data.url
        pageTitle = event.data.pageTitle
        pageUrl = event.data.pageUrl
        initializeProxy(baseUrl)
      when 'create'
        text = event.data.text
        serializeRange = event.data.serializeRange
        createSticker(text, serializeRange)

  createSticker = (text, serializeRange) ->
    $.post("/embed",
      baseUrl: baseUrl
      text: text
      pageTitle: pageTitle
      serializeRange: serializeRange
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
    loadScriplets()

  loadScriplets = ->
    $.get("/embed/scripplets",
      baseUrl: baseUrl
      pageUrl: pageUrl
    ).done (data) ->
      eventProxy.post
        action: "loadScripplets"
        scripplets: data
      return

  $('#add-sticker').click ->
    eventProxy.post
      action: "add-sticker"

  $('#login-sticker').click ->
    window.open('/');
