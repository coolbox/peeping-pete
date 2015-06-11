getLinks = ->
  links = document.querySelectorAll "a.name"
  Array::map.call links, (e) -> e.getAttribute "href"

links = []

casper = require('casper').create
  pageSettings:
    loadImages: false
    loadPlugins: false
    userAgent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_5) AppleWebKit/537.4 (KHTML, like Gecko) Chrome/22.0.1229.94 Safari/537.4'

# print out all the messages in the headless browser context
casper.on 'remote.message', (msg) ->
  @echo "remote message caught: #{msg}"

casper.on 'page.error', (msg, trace) ->
  @echo "Page Error: #{msg}", 'ERROR'

casper.start 'https://www.linkedin.com', ->
  @echo this.getTitle()
  @fill 'form#login',
    session_key: '** YOUR EMAIL **'
    session_password: '** YOUR PASSWORD **'
  , true

casper.then ->
  # Give the page time to load
  @wait 2000, ->
    links = links.concat @evaluate(getLinks)

# Open all the links
casper.then ->
  links.forEach (link) =>
    @thenOpen link, =>
      @echo @getTitle()

casper.run()