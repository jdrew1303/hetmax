@index = (req, res) ->
  res.render 'index'

@partials = (req, res) ->
  name = req.params.name
  res.render 'partials/' + name

@search = (req, res) ->
  spider = "../../spiders/#{req.params.spider}"

  require(spider).best_price(
    req.params.product
    (price) -> res.json price
  )