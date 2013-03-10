require '../utils/mongoose'

@Product = mongoose.model 'Product', new mongoose.Schema
  spider: String
  model: String
  seller: String
  price: Number
  total: Number
  shipping: Number
  url: String