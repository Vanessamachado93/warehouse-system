class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      redirect_to @supplier, notice: 'Fornecedor cadastrado com sucesso'
  else
    flash.now[:notice] = 'Forncedor não cadastrado'
    render 'new'
  end 
  end

  def edit
    set_supplier
  end

  def update
    set_supplier
    if @supplier.update(supplier_params)
      redirect_to suppliers_path(@supplier.id), notice: 'Fornecedor atualizado com sucesso'
    else
      flash.now[:notice] = 'Não foi possível atualizar o fornecedor'
      render 'edit'
    end
  end

  private

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  def supplier_params
    params.require(:supplier).permit(:corporate_name,
                                     :brand_name,
                                     :registration_number, 
                                     :full_address, 
                                     :city, 
                                     :state, 
                                     :email,
                                     :telephone,
                                     )
  end 
end