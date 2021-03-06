require 'rails_helper'

describe 'Usuario visita tela inicial' do
  it 'e vê o nome da app' do
    # Arrange
    # Action
    visit root_path
    # Assert
    expect(page).to have_content('Galpões & Estoque')
    expect(page).to have_link('Galpões & Estoque', href: root_path)
  end
  it 'e vê os galpões cadastrados' do
    # Arrange
    Warehouse.create(name: 'Rio', 
                     code: 'SDU', 
                     city: 'Rio de Janeiro', 
                     area: 60_000,
                     address: 'Avenida do Porto, 3000', 
                     cep:'20000-000', 
                     description: 'Galpão no Rio'
                    )
    Warehouse.create(name: 'Maceio', 
                     code: 'MCZ', 
                     city: 'Maceio', 
                     area: 50_000,
                     address: 'Avenida da Luz, 2000', 
                     cep:'50000-000',
                     description: 'Galpão em Maceio'
                    )

    # Action
    visit root_path
    # Assert
    expect(page).not_to have_content('Não existem galpões cadastrados')
    expect(page).to have_content('Rio')
    expect(page).to have_content('Código: SDU')
    expect(page).to have_content('Cidade: Rio de Janeiro')
    expect(page).to have_content('60000 m²')

    expect(page).to have_content('Maceio')
    expect(page).to have_content('Código: MCZ')
    expect(page).to have_content('Cidade: Maceio')
    expect(page).to have_content('50000 m²')
  end
  it 'e não existem galpões cadastrados' do
    # Arrange
    # Action
    visit root_path
    # Assert
    expect(page).to have_content('Não existem galpões cadastrados')
  end
end
