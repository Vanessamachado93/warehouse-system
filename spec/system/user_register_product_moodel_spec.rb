require 'rails_helper'

describe 'Usuario cadastra um modelo de produto' do
   it 'com sucesso' do 
    # Arrange
    supplier = Supplier.create!(brand_name: 'Samsung',
                                email: 'samsung@example.com', 
                                corporate_name: 'Samsung Eletronicos LTDA',
                                registration_number: '45678789000145',
                                full_address: 'Av das Indústrias, 200',
                                city: 'São Paulo',
                                state: 'SP',
                                email: 'sac@samsung.com',
                                telephone: '5134567890')

    #Action
    visit root_path
    click_on 'Modelos de Produtos'
    click_on 'Cadastrar novo'
    fill_in 'Nome', with: 'TV 40 polegadas'
    fill_in 'SKU', with: 'TV40-SAMSU-XDF09'
    fill_in 'Peso', with: '8000'
    fill_in 'Altura', with: '60'
    fill_in 'Largura' , with: '90'
    fill_in 'Profundidade', with: '10'
    select 'Samsung', from:'Fornecedor'
    click_on 'Salvar'

    # Assert
    expect(page).to have_content('Modelo de produto cadastrado com sucesso')
    expect(page).to have_content('TV 40 polegadas')
    expect(page).to have_content('SKU: TV40-SAMSU-XDF09')
    expect(page).to have_content('Dimensão: 60cm x 90cm x 10cm')
    expect(page).to have_content('Peso: 8000g')
    expect(page).to have_content('Fornecedor: Samsung')
  end
end