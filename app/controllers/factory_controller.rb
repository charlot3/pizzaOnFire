class FactoryController < ApplicationController
  @@errorMessage = 1
  def new
    @factory = Factory.select('id','name','address','transman','shoptel')
    @errors = @@errorMessage
  end

  def change
 ##he
  end

  def create

    @create = params.require(:factory).permit(:id)
    if(Factory.find_by(id: @create[:id]))
      @@errorMessage = 0
    else
      Factory.create!(params.require(:factory).permit(:id,:name,:address,:transman,:shoptel))
    end


    redirect_to factory_new_path
  end

  def update
    @factorys = Factory.new(params.require(:factory).permit(:id,:name,:address,:transman,:shoptel))

    @de = params.permit(:commit)
    if(@de[:commit] == "Delete it")
      @tmpde = Factory.find_by(id: @factorys.id)
      @tmpde.destroy
    else
      @change = Factory.find_by(id: @factorys.id)
      @change.id = @factorys.id
      @change.name = @factorys.name
      @change.address = @factorys.address
      @change.transman = @factorys.transman
      @change.shoptel = @factorys.shoptel
      @change.save()
    end

    redirect_to factory_new_path
  end

end
