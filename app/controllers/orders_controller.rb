class OrdersController < ApplicationController
  def new
    @order = Order.new
    @warehouses = Warehouse.all
    @suppliers = Supplier.all
  end

  def create
    @order = Order.new

    order_params = params.require(:order).permit(:warehouse_id, :supplier_id, :estimated_delivery_date)
    @order = Order.new(order_params)
    @order.user = current_user
    @order.save
    redirect_to @order, notice: 'Pedido cadastrado com sucesso'
  end

  def show
  end
end