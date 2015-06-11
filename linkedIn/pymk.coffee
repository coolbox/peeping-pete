getNames = ->
  people = document.querySelectorAll "a.title"
  Array::map.call people, (e) -> e.getAttribute "title"

clickNames = ->
  connectButtons = document.querySelectorAll "button.bt-request-buffed[data-act=request]"
  $(button).click() for button in connectButtons

people = []
root_url = "https://www.linkedin.com"
results_url = "https://www.linkedin.com/people/pymk"

numberTimes = 200

casper = require('casper').create
  pageSettings:
    loadImages: false
    loadPlugins: false
    userAgent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_5) AppleWebKit/537.4 (KHTML, like Gecko) Chrome/22.0.1229.94 Safari/537.4'

helpers = require('helpers')

# print out all the messages in the headless browser context
# casper.on 'remote.message', (msg) ->
#   @echo "remote message caught: #{msg}"

casper.on 'page.error', (msg, trace) ->
  @echo "Page Error: #{msg}", 'ERROR'

casper.start root_url, ->
  @echo "Start: #{@getTitle()}"
  @fill 'form#login',
    session_key: '** YOUR EMAIL **'
    session_password: '** YOUR PASSWORD **'
  , true

# Visit advanced search
casper.wait 3000, ->
  @thenOpen results_url, =>
    @echo "PYMK: #{@getTitle()}"

    count = 1
    @repeat numberTimes, =>
      # Scroll to bottom
      # load some people
      @wait 2000, =>
        @echo "Scroll to bottom: #{count}"
        @scrollToBottom()
        @echo "Scroll to top: #{count}"
        @scrollTo(0, 0)

        @wait 2000, =>
          # Increment count
          count += 1

casper.then ->
  @wait 2000, =>
    # Show us some names!
    people = @evaluate(getNames)
    @echo("Person: #{person}") for person in people

    @evaluate(clickNames)

casper.run()