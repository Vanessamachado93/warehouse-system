require 'rails_helper'

describe 'Usuario se autentica' do
  it 'com sucesso' do
    # Arrange
    # Action
    visit root_path
    click_on 'Acessar'
    click_on 'Criar Conta'
    fill_in 'Nome', with: 'Maria'
    fill_in 'E-mail', with: 'maria@email.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirme sua senha', with: '123456'
    click_on 'Criar conta'
    
    # Assert
    expect(page).to have_content 'maria@email.com'
    expect(page).to have_button 'Sair'
    expect(page).to have_content 'Bem vindo! Você realizou seu registro com sucesso.'
    user = User.last
    expect(user.name).to eq 'Maria'
  end
end