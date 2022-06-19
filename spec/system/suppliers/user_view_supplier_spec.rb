require 'rails_helper'

describe 'Usuário vê fornecedores' do
  it 'a partir do menu'do
    # Arrange
    # Action
    visit root_path
    within('nav') do
      click_on 'Fornecedores'
    end
    # Assert
    expect(current_path).to eq suppliers_path
  end
  it 'com sucesso' do
    # Arrange
    Supplier.create!(corporate_name: 'ACME LTDA',
                     brand_name: 'ACME',
                     registration_number: '90378377000132', 
                     full_address: 'Av das Palmas, 200',
                     city: 'Bauru',
                     state: 'SP',
                     email: 'contato@acme.com',
                     telephone: '51999999999')
                     
    Supplier.create!(corporate_name: 'Expresso LTDA',
                     brand_name: 'EXPRESSO',
                     registration_number: '90378377000150', 
                     full_address: 'Av das Coqueiros, 200',
                     city: 'Canoas',
                     state:'RS',
                     email: 'contato@express.com',
                     telephone: '51999999999')
    # Action
    visit root_path
    click_on 'Fornecedores'

    # Assert
    expect(page).to have_content('Fornecedores')
    expect(page).to have_content('ACME')
    expect(page).to have_content('Bauru - SP')
    expect(page).to have_content('EXPRESSO')
    expect(page).to have_content('Canoas - RS')
    
  end
  it 'e não existem fornecedores cadastrados' do
    # Arrange
    # Action
    visit root_path
    click_on 'Fornecedores'
    # Assert
    expect(page).to have_content 'Não existe fornecedores cadastrados'
  end
end
