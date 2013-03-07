async = require 'async'
Spider = require("./spider").Spider

class Shopmania extends Spider

  search_product: (model, products) ->
    @$.init =>
      @$.get 'http://www.shopmania.es', =>
        @$.elementById 'autocomplete_prod', (e, el) =>
          el.clear =>
            el.type model, =>
              @$.elementByCssSelector '#top_search_row > button', (e, el)=>
                el.click =>
                  @$.elementsByCssSelector 'div.price_row.rowfeat', (e, els)=>
                    async.map els, @_get_product_from_list, products

  _get_product_from_list: (row, callback) -> async.series

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

exports.Shopmania = Shopmania