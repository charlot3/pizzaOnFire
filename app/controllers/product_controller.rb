class ProductController < ApplicationController
  def new
    @product = Product.select('id','name','from','barcode')
  end
end
