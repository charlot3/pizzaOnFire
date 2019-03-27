class MenuController < ApplicationController
  def new
    @menu = Menu.select('fid','fpic','fname','fprice','salecount')
  end

  def change

  end
end
