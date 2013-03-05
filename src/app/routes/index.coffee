@index = (req, res) ->
  res.render 'index'

@partials = (req, res) ->
  name = req.params.name
  res.render 'partials/' + name

@getProductBPI = (req, res) ->
  op = req.params.op
  model = req.params.pid
  shopmania = require '../../spiders/shopmania'
  _ = require('underscore')
  shopmania.best_price model, (err, fetchedInfo) ->
    minPriceInfo =
      ok: false
      info:[]
    fetchedInfo = _.filter fetchedInfo, (item) ->
      item.itemPrice && item.shippingPrice
    if fetchedInfo.length > 0
      _.map fetchedInfo, (item)->
        match = String(item.itemPrice).match(/\d+,*\d+/)
        item.itemPrice = parseFloat(match[0].replace(',', '.')) if match
        match = String(item.shippingPrice).match(/\d+,*\d+/)
        item.shippingPrice = parseFloat(match[0].replace(',', '.')) if match
        item.source = 'ShopMania.es'
      minPriceInfo.info.push _.min fetchedInfo, (item) ->
        item.itemPrice + item.shippingPrice
      minPriceInfo.ok = true
    res.json minPriceInfo