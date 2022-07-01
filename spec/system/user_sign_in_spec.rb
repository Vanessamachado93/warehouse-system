require 'rails_helper'

describe 'Usuario se autentica' do
  it 'com sucesso' do
    # Arrange
    User.create!(email: 'email@example.com', password: '123456')

    # Action
    visit root_path
    click_on 'Acessar'
    fill_in 'e-mail', with: 'email@example.com'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'

    # Assert
    expect(page).to have_content 'Login efetuado com sucesso.' 
    within ('nav') do
    expect(page).not_to have_link 'Entrar'
    expect(page).to have_link 'Sair'
    expect(page).to have_content 'email@example.com'
    end
  end
end