require 'rails_helper'

describe 'Usuario cadastra um fornecedor' do
    it 'a partir do menu' do 
     # Arrange
     # Action
     visit root_path
     click_on 'Fornecedores'
     click_on 'Cadastrar novo fornecedor'
     # Assert

     expect(page).to have_content 'Nome Fantasia'
     expect(page).to have_content 'Razão Social'
     expect(page).to have_content 'Telefone'
     expect(page).to have_content 'CNPJ'    
     expect(page).to have_content 'Endereço'
     expect(page).to have_content 'Cidade'
     expect(page).to have_content 'Estado'
     expect(page).to have_content 'e-mail'
    end

    it 'com sucesso' do
        # Arrange

        # Action
        visit root_path
        click_on 'Fornecedores'
        click_on 'Cadastrar novo fornecedor'
        fill_in 'Nome Fantasia' , with: 'ACME'
        fill_in 'Razão Social' , with: 'ACME LTDA'
        fill_in 'Telefone' , with: '05136510000'
        fill_in 'CNPJ', with: '90376377000132'
        fill_in 'Endereço' , with: 'Rua do comercio, 1000'
        fill_in 'Estado' , with: 'RS'
        fill_in 'Cidade' , with: 'Porto Alegre'
        fill_in 'e-mail' , with: 'contato@acme.com'
        click_on 'Salvar'

        #Assert
        expect(page).to have_content 'ACME LTDA'
        expect(page).to have_content 'CNPJ: 90376377000132'
        expect(page).to have_content 'Endereço: Rua do comercio, 1000'
        expect(page).to have_content 'e-mail: contato@acme.com'
        expect(page).to have_content 'Fornecedor cadastrado com sucesso'
    end

    it 'com dados incompletos' do
        # Arrange
        # Action
        visit root_path
        click_on 'Fornecedor'
        click_on 'Cadastrar novo fornecedor'
        fill_in 'Nome Fantasia', with: ' '
        fill_in 'Razão Social' , with: ' '
        fill_in 'CNPJ' , with: ' '
        fill_in 'e-mail', with: ''
        click_on 'Salvar'
        # Assert
        expect(page).to have_content 'Nome Fantasia não pode ficar em branco'
        expect(page).to have_content 'Razão Social não pode ficar em branco'
        expect(page).to have_content 'CNPJ não pode ficar em branco'
        expect(page).to have_content 'e-mail não pode ficar em branco'
    end
end