async = require 'async'
_ = require 'underscore'

$ = require('../utils/jquery_wd').browser()

@search = (product, results) ->
  google_search product, ->
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

  link: (value) ->
    $.first row, 'h3.r a', value

  price: (value) ->
    $.price row, '.psliprice b', value

  from_store: (value) ->
    $.content row, '.psliprice', (e, text) ->
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
    $.content row, '.seller-name a', value

  price: (value) ->
    $.price row, '.price-col span', value

  total: (value) ->
    $.price row, '.total-col span', value

  url: (value) ->
    $.first row, 'a[href]', (e, a) ->
      a.getAttribute 'href', (e, href) ->
        value e, href.match(/url\?q=(.*)/)?[1]

, product


