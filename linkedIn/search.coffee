getLinks = ->
  links = document.querySelectorAll "a.title"
  Array::map.call links, (e) -> e.getAttribute "href"

getPaginationLinks = ->
  paginationLinks = document.querySelectorAll "ul.pagination a.page-link"
  Array::map.call paginationLinks, (e) -> e.getAttribute "href"

searchTerms = [
  "javascript"
  "ruby on rails"
  "coffeescript"
  "startup investor"
  "strava"
  "Data Visualization"
  "runkeeper"
  "front end developer"
  "backend developer"
  "web developer"
]

links = []
paginationLinks = []
root_url = "https://www.linkedin.com"

numberTimes = searchTerms.length
count = 1

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
  @echo this.getTitle()
  @fill 'form#login',
    session_key: '** YOUR EMAIL **'
    session_password: '**YOUR PASSWORD**'
  , true

# Visit advanced search
casper.repeat numberTimes, ->
  searchTerm = searchTerms[count-1]
  @echo "Keyword: #{searchTerm}"

  # Wait for page to load
  @wait 5000, =>
    @thenClick "a.advanced-search", =>

      # Fill in the search form
      @fill 'form#peopleSearchForm',
        keywords: searchTerm
      , true

      # 2nd connection input button
      @thenClick "input#S-N-ffs", =>
        # Collect pagination links
        @wait 2000, =>
          paginationLinks = @evaluate(getPaginationLinks)
          paginationLinks.forEach (pageLink) =>
            @echo "PAGE: #{pageLink}"
            baseUrl = @getGlobal('location').origin
            absolutePageLink = helpers.absoluteUri(baseUrl, pageLink)

            # Open the page
            # Open all the profile links
            @thenOpen absolutePageLink, =>
              links = []
              links = links.concat @evaluate(getLinks)
              @echo "#{@getTitle()} - Links: #{links.length}"
              links.forEach (link) =>
                # Lets wait a little so as not to upset LinkedIn
                @wait 5000, =>
                  @thenOpen link, =>
                    @echo @getTitle()

  # Increment count
  count += 1

casper.run()