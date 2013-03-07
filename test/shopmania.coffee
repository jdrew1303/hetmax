Shopmania = require("../src/spiders/shopmania").Shopmania
$ = require('../src/spiders/jquery_wd').browser()

describe 'Shopmania Spider', ->

  shopMania = new Shopmania($)

  it 'should fetch me stuff', (done) ->

    shopMania.search_product '3TL941C', (e, results) ->
      console.log results
      [1,2,3].indexOf(0).should.equal(-1);
      done()
