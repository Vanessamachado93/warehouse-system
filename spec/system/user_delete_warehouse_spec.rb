require 'rails_helper'

describe 'Usuario remove um galpão' do
  it 'com sucesso' do
    # Arrange
    warehouse = Warehouse.create!(name: 'Cuiaba',
                                  code: 'CWB', 
                                  city: 'Cuiaba',
                                  area: '10_000',
                                  address: 'Avenida das Indústrias, 1000',
                                  cep: '15000-000',
                                  description: 'Galpão no centro do país'
                                 )
    # Action 
    visit root_path
    click_on 'Cuiaba'
    click_on 'Remover'
    # Assert
    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpão removido com sucesso'
    expect(page).not_to have_content 'Cuiaba'
    expect(page).not_to have_content 'CWB'
  end
  
  it 'e não apaga outros galpões' do
    # Arrange
    first_warehouse = Warehouse.create!(name: 'Cuiaba',
                                        code: 'CWB', 
                                        city: 'Cuiaba',
                                        area: '10_000',
                                        address: 'Avenida das Indústrias, 1000',
                                        cep: '15000-000',
                                        description: 'Galpão no centro do país'
                                        )

    second_warehouse = Warehouse.create!(name: 'Belo Horizonte',
                                        code: 'BLH', 
                                        city: 'Belo Horizonte',
                                        area: '18_000',
                                        address: 'Avenida das Indústrias, 3000',
                                        cep: '65000-000',
                                        description: 'Galpão no centro de BH'
                                        )
  # Action
  visit root_path
  click_on 'Cuiaba'
  click_on 'Remover'
  # Assert
  expect(current_path).to eq root_path
  expect(page).to have_content 'Galpão removido com sucesso'
  expect(page).to have_content 'Belo Horizonte'
  expect(page).not_to have_content 'Cuiaba'
  end
end