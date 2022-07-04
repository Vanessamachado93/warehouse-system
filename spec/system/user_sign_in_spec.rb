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
    expect(page).to have_button 'Sair'
    expect(page).to have_content 'email@example.com'
    end
  end
  it 'e faz logout' do
    # Arrange
    User.create!(email: 'email@example.com', password: '123456')
    # Action
    visit root_path
    click_on 'Acessar'
    fill_in 'e-mail', with: 'email@example.com'
    fill_in 'Senha', with: '123456'
    click_on 'Acessar'
    click_on 'Sair'
    # Assert
    save_page
    expect(page).to have_content 'Logout efetuado com sucesso.'
    expect(page).to have_link 'Acessar'
    expect(page).not_to have_button 'Sair'
    expect(page).not_to have_content 'email@example.com'
  end
end