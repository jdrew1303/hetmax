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

  $
