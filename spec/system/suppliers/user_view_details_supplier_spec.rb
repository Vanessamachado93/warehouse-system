require 'rails_helper'

describe 'Usuario vê detalhes do fornecedor' do
    it 'a partir da tela inicial' do
        # Arrange
        Supplier.create!(corporate_name: 'ACME LTDA',
                        brand_name: 'ACME',
                        registration_number: '90378377000132', 
                        full_address: 'Av das Palmas, 200',
                        city: 'Bauru',
                        state: 'SP',
                        email: 'contato@acme.com',
                        telephone: '51999999999')
        # Action
        visit root_path
        click_on 'Fornecedores'
        click_on 'ACME'

        # Assert
        expect(page).to have_content('ACME LTDA')
        expect(page).to have_content('CNPJ: 90378377000132')
        expect(page).to have_content('Endereço: Av das Palmas, 200')
        expect(page).to have_content('e-mail: contato@acme.com')
    end

    it 'e volta para a tela inicial' do
        # Arrange
        Supplier.create!(corporate_name: 'ACME LTDA',
                        brand_name: 'ACME',
                        registration_number: '90378377000132', 
                        full_address: 'Av das Palmas, 200',
                        city: 'Bauru',
                        state: 'SP',
                        email: 'contato@acme.com',
                        telephone: '51999999999')
        
    # Action
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Voltar'
    end
end