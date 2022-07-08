require 'rails_helper'

describe 'Usuario cadastra um pedido' do
  it 'e deve estar autenticado' do
    # Arrange
    # Action
    visit root_path
    click_on 'Registrar Pedido'
    # Assert
    expect(current_path).to eq new_user_session_path

  end
  it 'com sucesso' do
    # Arrange
    user = User.create!(name: 'Carlos', email: 'carlos@email.com', password: '123456')
    
    Warehouse.create!(name: 'Rio de Janeiro',
                     description: 'Galpão próximo ao Pão de açucar', 
                     code: 'RIO', 
                     city: 'Rio Janeiro',
                     area: '20_000',
                     address: 'Avenida de Copacabana, 1000',
                     cep: '25000-000')
    warehouse = Warehouse.create!(name: 'Aeroporto SP',
                                  code: 'GRU', 
                                  city: 'Guarulhos',
                                  area: '100_000',
                                  address: 'Avenida do Aeroporto, 1000',
                                  cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')


    Supplier.create!(corporate_name: 'ACME LTDA',
                     brand_name: 'ACME',
                     registration_number: '90378377000132', 
                     full_address: 'Av das Palmas, 200',
                     city: 'Bauru',
                     state: 'SP',
                     email: 'contato@acme.com',
                     telephone: '51999999999')

    supplier = Supplier.create!(corporate_name: 'ACER LTDA', 
                                     brand_name: 'ACER',
                                     registration_number: '90378377000100', 
                                     full_address: 'Av das Casas, 200',
                                     city: 'Canoas',
                                     state: 'RS',
                                     email: 'contato@acer.com',
                                     telephone: '51999999988'
                                     )
    # Action
    login_as(user)
    visit root_path
    click_on 'Registrar Pedido'
    select warehouse.name, from: 'Galpão Destino'
    select supplier.corporate_name, from: 'Fornecedor'
    fill_in 'Data Prevista' , with: '20/07/2022'
    click_on 'Gravar'
    # Assert
    
    expect(page).to have_content 'Pedido cadastrado com sucesso'
    expect(page).to have_content 'Galpão Destino: Aeroporto SP'
    expect(page).to have_content 'Fornecedor: ACER LTDA'
    expect(page).to have_content 'Data Prevista de Entrega: 20/07/2022'
    expect(page).to have_content 'Usuário responśavel: Carlos carlos@email.com'
  end
end