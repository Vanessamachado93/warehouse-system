require 'rails_helper'

describe 'Usuario visita tela inicial' do
  it 'e vê o nome da app' do
    # Arrange
    # Action
    visit('/')
    # Assert
    expect(page).to have_content('Galpões & Estoque')
  end
end
