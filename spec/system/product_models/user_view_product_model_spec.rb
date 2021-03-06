require 'rails_helper'

describe 'Usuario vê modelos de produtos' do

  it 'se estiver autenticado' do
    # Arrange
    # Action
  visit root_path
    within ('nav') do
      click_on 'Modelos de Produtos'
    end
    # Assert
    expect(current_path).to eq new_user_session_path
  end

  it 'a partir do menu'  do
  #Arrange
  user = User.create!(name: 'Pedro', email: 'pedro@example.com', password: '123456')
  #Action
  login_as(user)
  visit root_path
  within('nav') do
    click_on 'Modelos de Produtos'
  end

  # Assert
  expect(current_path).to eq product_models_path
 end

 it 'com sucesso' do
  # Arrange
  user = User.create!(name: 'Pedro', email: 'pedro@example.com', password: '123456')

  supplier = Supplier.create!(brand_name: 'Samsung',
                              corporate_name: 'Samsung Eletronicos LTDA',
                              registration_number: '45678789000145',
                              full_address: 'Av das Indústrias, 200',
                              city: 'São Paulo',
                              state: 'SP',
                              email: 'sac@samsung.com',
                              telephone: '5134567890')

  ProductModel.create!(name: 'TV 32',
                       weight: 8000,
                       widht: 70,
                       heigth: 45,
                       depth: 10,
                       sku: 'TV32-SAMSU-XPTO90111',
                       supplier: supplier)
  ProductModel.create!(name: 'TV 55',
                       weight: 9000,
                       widht: 70,
                       heigth: 45,
                       depth: 10,
                       sku: 'TV55-SAMSU-XPTO44111',
                       supplier: supplier)



  # Action
  
  login_as(user)
  visit root_path
  within('nav') do
    click_on 'Modelos de Produtos'
  end
  # Assert
  expect(page).to have_content 'TV 32'
  expect(page).to have_content 'TV32-SAMSU-XPTO90'
  expect(page).to have_content 'Samsung'
  expect(page).to have_content 'TV 55'
  expect(page).to have_content 'TV55-SAMSU-XPTO44'
  expect(page).to have_content 'Samsung'
 end

 it 'e não existe produtos cadastrados' do
  # Arrange
  user = User.create!(name: 'Pedro', email: 'pedro@example.com', password: '123456')
  # Act
  login_as(user)
  visit root_path
  click_on 'Modelos de Produtos'
  # Assert
  expect(page).to have_content 'Nenhum modelo de produto cadastrados'
 end
end