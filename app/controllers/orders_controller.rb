class OrdersController < ApplicationController
  @@orderParam = nil
  def new
    @order = @@orderParam
    @factory = Factory.select('id','address','name','transman','shoptel')
  end

  def create

  end

  def update
    @oid = params.require(:factoryChoose).permit(:id,:factory)
    @selectFactory = Factory.where("address = '#{@oid[:factory]}'")


    @checkStatus = params.permit(:commit)
    if(@checkStatus[:commit] == "进行配送")
      Order.update(@oid[:id], :shopname=>@oid[:factory], :orderstatus=>3)
      for tmp in @selectFactory
        ActiveRecord::Base.connection.exec_query("update sn_foodorder set shoptel = #{tmp[:shoptel]}  where oid = #{@oid[:id]}")
        ActiveRecord::Base.connection.exec_query("update factories set transman = #{tmp[:transman]-1}  where id = #{tmp[:id]}")
      end

    elsif(@checkStatus[:commit] == "取消配送")
      Order.update(@oid[:id], :orderstatus=>6)
    elsif(@checkStatus[:commit] == "配送完成")
      for tmp in @selectFactory
        ActiveRecord::Base.connection.exec_query("update factories set transman = #{tmp[:transman]+1}  where id = #{tmp[:id]}")
      end
      Order.update(@oid[:id], :orderstatus=>4)
      Order.update(@oid[:id], :order_endtime=>Time.now)
    elsif(@checkStatus[:commit] == "退货")
      Order.update(@oid[:id], :shopname=>@oid[:factory], :orderstatus=>5)
    end

    redirect_to orders_new_path
  end

  def check
    @order = params.require(:param).permit(:date, :money_less, :money_more, :product)
    @sql = ''
    if(@order[:date] == '')

    else
      @order[:date] = DateTime.parse(@order[:date]).to_i
      @sql = @sql +"order_ctime >= "+ @order[:date].to_s;
    end

    if(@order[:money_less] == '')
      @order[:money_less] = 0
    end

    if(@order[:money_more] == '')
      @order[:money_more] = 99999
    end

    if(@sql == '')
      @sql = @sql+" orderprice >= "+@order[:money_less].to_s+" and orderprice <= "+@order[:money_more].to_s;
    else
      @sql = @sql+" and orderprice >= "+@order[:money_less].to_s+" and orderprice <= "+@order[:money_more].to_s;
    end

    if(@order[:product] == '')

    else
      @sql = @sql+" and oid = '"+@order[:product].to_s+"'"
    end

    @@orderParam = Order.where(@sql)
    @@orderParam = @@orderParam.order(order_ctime: :desc)

    redirect_to orders_new_path
  end
end
