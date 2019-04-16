require 'date'
class MenuController < ApplicationController
  @@errorMessage = 1
  def new
    @menu = Menu.select('fid','fpic','fname','fprice','salecount','fctime')
    @errors = @@errorMessage
  end

  def change

  end

  def create
    @create = params.require(:menu).permit(:fid)
    if(Menu.find_by(fid: @create[:fid]))
      @@errorMessage = 0
    else
      @tmp1 = params.require(:menu).permit(:fctime)
      @tmp1 = @tmp1.to_s.to_time.to_i
      @tmp = Menu.new(params.require(:menu).permit(:fid,:fpic,:fctime,:fprice,:fname))
      @tmp.fctime = @tmp1
      Menu.create(fid:@tmp.fid,fpic:@tmp.fpic,fctime:@tmp.fctime,fprice:@tmp.fprice,fname:@tmp.fname)
    end


    redirect_to menu_path
  end

  def update
    @menus = Menu.new(params.require(:menu).permit(:fid,:fpic,:fctime,:fprice,:fname))
    @tmp1 = params.require(:menu).permit(:fctime)
    @tmp1 = @tmp1.to_s.to_time.to_i
    @de = params.permit(:commit)
    if(@de[:commit] == "Delete it")
      @tmpde = Menu.find_by(fid: @menus.fid)
      @tmpde.destroy
    else
      @change = Menu.find_by(fid: @menus.fid)
      @change.fpic = @menus.fpic
      @change.fctime = @tmp1
      @change.fprice = @menus.fprice
      @change.fname = @menus.fname
      @change.save()
    end

    redirect_to menu_path
  end
end
