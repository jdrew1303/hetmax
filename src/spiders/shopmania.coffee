async = require 'async'

_ = require 'underscore'
$ = require('./jquery_wd').browser()

@best_price = (product, best) ->
  search product, (e, results) ->
    best _.min results, (x) -> x.price

search = (model, results) ->
  $.init ->
    $.get 'http://www.shopmania.es', ->
      $.elementById 'autocomplete_prod', (e, el) ->
        el.clear ->
          el.type model, ->
            $.first '#top_search_row > button', (e, el) ->
              el.click ->
                $.select 'div.price_row.rowfeat', (e, els) ->
                  $.map els, read_product, results

read_product = (row, product) -> async.series

  shipping: (value) ->
    $.price row, 'p.small.light', /.*: (.*?) /, value

  price: (value) ->
    $.price row, 'span.txt_price', value

  url: (value) ->
    $.first row, 'div.col_img > p > a > img', (e, img) ->
      img.getAttribute 'alt', value

, product
