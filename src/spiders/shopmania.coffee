async = require 'async'
$ = require('./jquery_wd').browser()

@search = (model, products) ->
  $.init ->
    $.get 'http://www.shopmania.es', ->
      $.first 'autocomplete_prod', (e, el)->
        $.clear el, ->
          $.type el, model, ->
#            $.submit el, ->
#              $.select '.price_row.rowfeat', products
            $.first '#top_search_row', (e, el) ->
              $.submit el, ->
                  $.elementsByCssSelector 'div.price_row.rowfeat', products
#                    $.map els, read_product, products

read_product = (row, callback) -> async.series

  shippingPrice: (callback) ->
      row.elementByCssSelector 'p.small.light',
      (err, el) -> if not err and el then el.text callback else callback null

  itemPrice: (callback) ->
      row.elementByCssSelector 'span.txt_price',
      (err, el) -> if not err and el then el.text callback else callback null

  urlV: (callback) ->
      row.elementByCssSelector 'div.col_img > p > a > img',
      (err, el)-> if not err and el then el.getAttribute('alt', callback) else callback null

, callback