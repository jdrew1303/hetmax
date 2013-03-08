@index = (req, res) ->
  res.render 'index'

@partials = (req, res) ->
  name = req.params.name
  res.render 'partials/' + name

@search = (req, res) ->
  spider = '../../spiders/spider'

  require(spider).search(
    req.params.spider
    req.params.product
    (price) -> res.json price
  )