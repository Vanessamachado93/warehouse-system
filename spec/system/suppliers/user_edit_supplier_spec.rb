require 'rails_helper'

describe 'Usuario pode editar dados do fornecedor' do
  it 'a partir da página de detalhes' do
    # Arrange
    Supplier.create!(corporate_name: 'ACME LTDA',
                     brand_name: 'ACME',
                     registration_number: '90378377000132', 
                     full_address: 'Av das Palmas, 200',
                     city: 'Bauru',
                     state: 'SP',
                     email: 'contato@acme.com',
                     telephone: '51999999999')
    #Action
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME' 
    click_on 'Editar'

    #Assert
    expect(page).to have_content 'Editar Fornecedor'
    expect(page).to have_field('Nome Fantasia', with: 'ACME')
    expect(page).to have_field('Razão Social', with: 'ACME LTDA')
    expect(page).to have_field('CNPJ', with: '90378377000132')
    expect(page).to have_field('Endereço', with: 'Av das Palmas, 200')
    expect(page).to have_field('Cidade', with: 'Bauru')
    expect(page).to have_field('Estado', with: 'SP')
    expect(page).to have_field('e-mail', with: 'contato@acme.com')
    expect(page).to have_field('Telefone', with: '51999999999')
    end

    it 'Com sucesso' do
    # Arrange
    Supplier.create!(corporate_name: 'ACME LTDA',
                     brand_name: 'ACME',
                     registration_number: '90378377000132', 
                     full_address: 'Av das Palmas, 200',
                     city: 'Bauru',
                     state: 'SP',
                     email: 'contato@acme.com',
                     telephone: '51999999999'
                    )     
    # Action
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME' 
    click_on 'Editar Fornecedor'
    fill_in 'Nome', with: 'ACME E CIA'
    click_on 'Salvar'
    # Assert

    expect(page).to have_content 'Nome'
    expect(page).to have_content 'ACME E CIA'
    expect(page).to have_content 'Fornecedor atualizado com sucesso'
     end
    it 'e mantém os campos obrigatórios' do
      Supplier.create!(corporate_name: 'ACME LTDA',
                       brand_name: 'ACME',
                       registration_number: '90378377000132', 
                       full_address: 'Av das Palmas, 200',
                       city: 'Bauru',
                       state: 'SP',
                       email: 'contato@acme.com',
                       telephone: '51999999999'
                      ) 
     # Action
     visit root_path
     click_on 'Fornecedores'
     save_page
     click_on 'ACME'
     click_on 'Editar Fornecedor'
     fill_in 'Nome', with: ''
     fill_in 'CNPJ', with: ''
     fill_in 'Endereço', with: ''
     click_on 'Salvar'

    # Assert
    
    expect(page).to have_content 'Não foi possível atualizar o fornecedor'

    end
end