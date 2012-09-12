window.Moviez = class Moviez extends Batman.App

  Batman.ViewStore.prefix = 'assets/views'

  @navLinks: [
    {href: '/#!/movies/', controller: 'movies', text: 'Moviezzzz'},
    {href: '/#!/about', controller: 'about', text: 'About'},
  ]

  @resources 'movies'
  @root 'movies'

  @on 'run', ->
    console?.log 'Running ....'

  @on 'ready', ->
    console?.log 'Moviez ready for use.'

  @flash: Batman()
  @flash.accessor
    get: (key) -> @[key]
    set: (key, value) ->
      @[key] = value
      if value isnt ''
        setTimeout =>
          @set(key, '')
        , 2000
      value

  @flashSuccess: (message) -> @set 'flash.success', message
  @flashError: (message) ->  @set 'flash.error', message
