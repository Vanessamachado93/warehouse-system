class WarehousesController < ApplicationController
  def show
    set_warehouse
  end

  def new
    @warehouse = Warehouse.new()
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save()
      redirect_to root_path, notice: 'Galpão cadastrado com sucesso'
    else
      flash.now[:notice] = 'Galpão não cadastrado'
      render 'new'
    end
  end

  def edit
    set_warehouse
  end

  def update
    set_warehouse
    if @warehouse.update(warehouse_params)
    redirect_to warehouse_path(@warehouse.id), notice: 'Galpão atualizado com sucesso'
    else
      flash.now[:notice] = 'Não foi possível atualizar o galpão'
      render 'edit'
    end                                                 
  end

  def destroy
    set_warehouse
    @warehouse.destroy
    redirect_to root_path, notice:'Galpão removido com sucesso'
  end

  private
  
  def set_warehouse
    @warehouse = Warehouse.find(params[:id])
  end

  def warehouse_params
    params.require(:warehouse).permit(:name,
                                      :code,
                                      :city, 
                                      :description, 
                                      :address, 
                                      :cep, 
                                      :area
                                      )
  end 
end 