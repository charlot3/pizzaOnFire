class ManageController < ApplicationController
  @@errorMessage = 1
  def new
    @manage = Manage.select('id','name','fid','fname','fhas')
    @errors = @@errorMessage
  end

  def create
    @create = params.require(:manage).permit(:id)
    if(Manage.find_by(id: @create[:id]))
      @@errorMessage = 0
    else
      Manage.create!(params.require(:manage).permit(:id,:name,:fid,:fhas,:fname))
    end

    redirect_to manage_new_path
  end

  def update
    @manages = Manage.new(params.require(:manage).permit(:id,:name,:fid,:fhas,:fname))

    @de = params.permit(:commit)
    if(@de[:commit] == "删除库存")
      @tmpde = Manage.find_by(id: @manages.id)
      @tmpde.destroy
    elsif(@de[:commit] == "修改库存")
      @change = Manage.find_by(id: @manages.id)
      @change.id = @manages.id
      @change.name = @manages.name
      @change.fid = @manages.fid
      @change.fname = @manages.fname
      @change.fhas = @manages.fhas
      @change.save()
    else
      @change = Manage.find_by(id: @manages.id)
      @change.id = @manages.id
      @change.name = @manages.name
      @change.fid = @manages.fid
      @change.fname = @manages.fname
      @change.fhas = 999
      @change.save()
    end

    redirect_to manage_new_path
  end
end
