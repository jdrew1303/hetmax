async = require 'async'
wd = require 'wd'

@browser = ->

  $ = wd.remote 'localhost', 8910

  $.select = (el, selector, callback) ->
    if callback?
    then el.elementsByCssSelector selector, callback
    else $.elementsByCssSelector el, selector

  $.first = (el, selector, callback) ->
    if callback?
    then el.elementByCssSelector selector, callback
    else $.elementByCssSelector el, selector

  $.map = (arr, iterator, callback) ->
    async.mapSeries arr, iterator, callback

  $.content = (el, selector, text) ->
    $.first el, selector, (e, el) ->
      el.text text

  $.price = (el, selector, matcher, price) ->
    [price, matcher] = [matcher, /(.*?) /] unless price?

    $.content el, selector, (e, text) ->
      price e, Number text.replace(',', '.').match(matcher)[1]

  $