require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe '#valid?' do
    context 'presence' do
    it 'falso quando o nome está vazio' do
      # Arrange
      warehouse = Warehouse.new(name: '', 
                                code: 'RIO', 
                                address: 'Endereço', 
                                cep:'25000-000',
                                city: 'Rio', 
                                area: 1000, 
                                description: 'Descrição do Galpão'
                               )      
      # Action
      result = warehouse.valid?
      # Assert
      expect(result).to eq(false)
      
    end
    it 'falso quando o código está vazio' do
      # Arrange
      warehouse = Warehouse.new(name: 'Rio', 
                                code: ' ', 
                                address: 'Endereço', 
                                cep:'25000-000',
                                city: 'Rio', 
                                area: 1000, 
                                description: 'Descrição do Galpão'
                               )      
      # Action
      result = warehouse.valid?
      # Assert
      expect(result).to eq(false)
    end
    it 'falso quando o endereço está vazio' do
      # Arrange
      warehouse = Warehouse.new(name: 'Rio', 
                                code: 'RIO', 
                                address: ' ', 
                                cep:'25000-000',
                                city: 'Rio', 
                                area: 1000, 
                                description: 'Descrição do Galpão'
                               )      
      # Action
      result = warehouse.valid?
      # Assert
      expect(result).to eq(false)
    end
    it 'falso quando o cep está vazio' do
      # Arrange
      warehouse = Warehouse.new(name: 'Rio', 
                                code: 'RIO', 
                                address: 'Endereço', 
                                cep: '',
                                city: 'Rio', 
                                area: 1000, 
                                description: 'Descrição do Galpão'
                               )      
      # Action
      result = warehouse.valid?
      # Assert
      expect(result).to eq(false)
    end
    it 'falso quando o cidade está vazia' do
      # Arrange
      warehouse = Warehouse.new(name: 'Rio', 
                                code: 'RIO', 
                                address: 'Endereço', 
                                cep: '99999-999',
                                city: '', 
                                area: 1000, 
                                description: 'Descrição do Galpão'
                               )      
      # Action
      result = warehouse.valid?
      # Assert
      expect(result).to eq(false)
    end
    it 'falso quando o area está vazia' do
      # Arrange
      warehouse = Warehouse.new(name: 'Rio', 
                                code: 'RIO', 
                                address: 'Endereço', 
                                cep: '99999-999',
                                city: 'Rio', 
                                area: '', 
                                description: 'Descrição do Galpão'
                               )      
      # Action
      result = warehouse.valid?
      # Assert
      expect(result).to eq(false)
    end
    it 'falso quando o descrição está vazio' do
      # Arrange
      warehouse = Warehouse.new(name: 'Rio', 
                                code: 'RIO', 
                                address: 'Endereço', 
                                cep: '99999-999',
                                city: 'Rio', 
                                area: 1000, 
                                description: '',
                               )      
      # Action
      result = warehouse.valid?
      # Assert
      expect(result).to eq(false)
    end
    end
  end
end
