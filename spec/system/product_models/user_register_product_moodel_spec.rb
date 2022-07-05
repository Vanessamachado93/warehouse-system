require 'rails_helper'

describe 'Usuario cadastra um modelo de produto' do
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

    outher_supplier = Supplier.create!(brand_name: 'LG',
                                      email: 'sac@lg.com', 
                                      corporate_name: 'LG do Brasil LTDA',
                                      registration_number: '90678789000145',
                                      full_address: 'Av Ferrari, 300',
                                      city: 'São Paulo',
                                      state: 'SP',
                                      telephone: '5134567840')

    #Action
    login_as(user)
    visit root_path
    click_on 'Modelos de Produtos'
    click_on 'Cadastrar novo'
    fill_in 'Nome', with: 'TV 40 polegadas'
    fill_in 'SKU', with: 'TV40-SAMSU-XDF099999'
    fill_in 'Peso', with: '8000'
    fill_in 'Altura', with: '60'
    fill_in 'Largura' , with: '90'
    fill_in 'Profundidade', with: '10'
    select supplier.brand_name, from:'Fornecedor'
    click_on 'Salvar'

    # Assert
    expect(page).to have_content('Modelo de produto cadastrado com sucesso')
    expect(page).to have_content('TV 40 polegadas')
    expect(page).to have_content('SKU: TV40-SAMSU-XDF099999')
    expect(page).to have_content('Dimensão: 60cm x 90cm x 10cm')
    expect(page).to have_content('Peso: 8000g')
    expect(page).to have_content "Fornecedor: #{supplier.brand_name}"
  end
    it 'deve preencher todos os campos' do
      user = User.create!(name: 'Pedro', email: 'pedro@example.com', password: '123456')
      supplier = Supplier.create!(brand_name: 'Samsung',
                                  corporate_name: 'Samsung Eletronicos LTDA',
                                  registration_number: '45678789000145',
                                  full_address: 'Av das Indústrias, 200',
                                  city: 'São Paulo',
                                  state: 'SP',
                                  email: 'sac@samsung.com',
                                  telephone: '5134567890')

    #Action
    login_as(user)
    visit root_path
    click_on 'Modelos de Produtos'
    click_on 'Cadastrar novo'
    fill_in 'Nome', with: ' '
    fill_in 'SKU', with: ' '
    click_on 'Salvar'
    # Assert
    expect(page).to have_content('Não foi possível cadastrar o modelo de produto')

    end
end