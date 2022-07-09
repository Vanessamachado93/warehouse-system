require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#description' do
    it 'exibe o nome e o email' do
      # Arrange
      user = User.new(name: 'James', email: 'james@email.com')
      # Action
      result = user.description()
      # Assert
      expect(result).to eq('James - james@email.com')
    
    end
  end
end
