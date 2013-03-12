async = require 'async'

_ = require 'underscore'
$ = require('./jquery_wd').browser()

@search = (model, results) ->
  google_search model, ->
    find_stores ->
      product_in_stores results

###########################
# Google shopping search  #
###########################

google_search = (model, done) ->
  $.init ->
    $.get 'http://www.google.es/shopping', ->
      $.elementByName 'q', (e, q) ->
        $.type q, model, ->
          $.submit q, done

#################################
# Select lowest price in stores #
#################################

find_stores = (done) ->
  read_products (e, products) ->
    best = best_in_stores products
    $.clickElement best.link, done

read_products = (products) ->
  $.select 'div#search li.g', (e, rows) ->
    $.map rows, read_product, products

read_product = (row, product) -> async.series

  link: (value) -> $.first row, 'h3.r a', value

  price: (value) ->
    $.first row, '.psliprice b', (e, b) ->
      b.text (e, text) ->
        value e, read_price text

  from_store: (value) ->
    $.first row, '.psliprice', (e, div) ->
      div.text (e, text) ->
        value e, text.match(/de.*tiendas/)?

, product

best_in_stores = (products) -> _
  .chain(products)
  .filter((x) -> x.from_store)
  .min((x) -> x.price)
  .value()

######################
#  Read store prices #
######################

product_in_stores = (products) ->
  $.select '.online-sellers-row', (e, rows) ->
    $.map rows, read_product_in_store, products

read_product_in_store = (row, product) -> async.series

  seller: (value) ->
    $.first row, '.seller-name a', (e, a) ->
      a.text value

  price: (value) ->
    $.first row, '.price-col span', (e, span) ->
      span.text (e, text) ->
        value e, read_price text

  total: (value) ->
    $.first row, '.total-col span', (e, span) ->
      span.text (e, text) ->
        value e, read_price text

  url: (value) -> $.first row, 'a[href]', value

, product

read_price = (text) -> Number text.replace(',', '.').split(' ')[0]


@search '3TL941C', (e, results)->
  console.log results