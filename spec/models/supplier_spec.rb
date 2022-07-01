require 'rails_helper'

RSpec.describe Supplier, type: :model do
    context 'presence' do
    it 'falso quando o Razão Social está vazio' do
      # Arrange
      supplier = Supplier.new(corporate_name: ' ',
                             brand_name: 'ACME',
                             registration_number: '90378377000132', 
                             full_address: 'Av das Palmas, 200',
                             city: 'Bauru',
                             state: 'SP',
                             email: 'contato@acme.com',
                             telephone: '51999999999')
                               
      # Action
      result = supplier.valid?
      # Assert
      expect(result).to eq(false)   
    end
  end
    context 'presence' do
    it 'falso quando o Nome Fantasia está vazio' do
      # Arrange
      supplier = Supplier.new(corporate_name: 'ACME LTDA',
                             brand_name: '',
                             registration_number: '90378377000132', 
                             full_address: 'Av das Palmas, 200',
                             city: 'Bauru',
                             state: 'SP',
                             email: 'contato@acme.com',
                             telephone: '51999999999')
                               
      # Action
      result = supplier.valid?
      # Assert
      expect(result).to eq(false)   
    end
  end
    context 'presence' do
    it 'falso quando o CNPJ está vazio' do
      # Arrange
      supplier = Supplier.new(corporate_name: 'ACME LTDA',
                             brand_name: 'ACME',
                             registration_number: '', 
                             full_address: 'Av das Palmas, 200',
                             city: 'Bauru',
                             state: 'SP',
                             email: 'contato@acme.com',
                             telephone: '51999999999')
                               
      # Action
      result = supplier.valid?
      # Assert
      expect(result).to eq(false)   
    end
  end
    context 'presence' do
    it 'falso quando o e-mail está vazio' do
      # Arrange
      supplier = Supplier.new(corporate_name: 'ACME LTDA',
                             brand_name: 'ACME',
                             registration_number: '90378377000132', 
                             full_address: 'Av das Palmas, 200',
                             city: 'Bauru',
                             state: 'SP',
                             email: '',
                             telephone: '51999999999')
                               
      # Action
      result = supplier.valid?
      # Assert
      expect(result).to eq(false)   
    end
  end
    context 'presence' do
    it 'falso quando o Telefone está vazio' do
      # Arrange
      supplier = Supplier.new(corporate_name: 'ACME LTDA',
                             brand_name: 'ACME',
                             registration_number: '90378377000132', 
                             full_address: 'Av das Palmas, 200',
                             city: 'Bauru',
                             state: 'SP',
                             email: 'contato@acme.com',
                             telephone: '')
                               
      # Action
      result = supplier.valid?
      # Assert
      expect(result).to eq(false)   
    end
  end
    context 'presence' do
    it 'falso quando o Telefone está vazio' do
      # Arrange
      supplier = Supplier.new(corporate_name: 'ACME LTDA',
                             brand_name: 'ACME',
                             registration_number: '90378377000132', 
                             full_address: 'Av das Palmas, 200',
                             city: 'Bauru',
                             state: 'SP',
                             email: 'contato@acme.com',
                             telephone: '')
                               
      # Action
      result = supplier.valid?
      # Assert
      expect(result).to eq(false)   
    end
  end
    context 'presence' do
    it 'falso quando o Cidade está vazio' do
      # Arrange
      supplier = Supplier.new(corporate_name: 'ACME LTDA',
                             brand_name: 'ACME',
                             registration_number: '90378377000132', 
                             full_address: 'Av das Palmas, 200',
                             city: '',
                             state: 'SP',
                             email: 'contato@acme.com',
                             telephone: '')
                               
      # Action
      result = supplier.valid?
      # Assert
      expect(result).to eq(false)   
    end
  end
    context 'presence' do
    it 'falso quando o Estado está vazio' do
      # Arrange
      supplier = Supplier.new(corporate_name: 'ACME LTDA',
                             brand_name: 'ACME',
                             registration_number: '90378377000132', 
                             full_address: 'Av das Palmas, 200',
                             city: 'Bauru',
                             state: ' ',
                             email: 'contato@acme.com',
                             telephone: '')
                               
      # Action
      result = supplier.valid?
      # Assert
      expect(result).to eq(false)   
    end
  end
end