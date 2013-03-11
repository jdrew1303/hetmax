@index = (req, res) ->
  res.render 'index'

@partials = (req, res) ->
  name = req.params.name
  res.render 'partials/' + name

@search = (req, res) ->
  { best_price } = require '../../domain/product'

  best_price(
    req.params.spider
    req.params.product
    (price) -> res.json price
  )