async = require 'async'
wd = require 'wd'
browser = wd.remote 'phantom-webdriver-001.herokuapp.com', 8910

@best_price = (model, products) ->
  browser.init ->
    browser.get "http://www.shopmania.es", ->
      browser.elementById 'autocomplete_prod', (err, el)->
        browser.clear el, (err)->
          browser.type el, model, (err)->
            browser.elementByCssSelector '#top_search_row > button', (err, el)->
              browser.clickElement el, (err)->
                browser.takeScreenshot (err, img)->
                  require("fs").writeFile "out.png", img, 'base64', (err)->
                    browser.elementsByCssSelector 'div.price_row.rowfeat', (err, els)->
                      async.map els, read_product, products

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