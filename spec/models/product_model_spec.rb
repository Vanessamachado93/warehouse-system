require 'rails_helper'

RSpec.describe ProductModel, type: :model do
    describe '#valid?' do
        it 'name is mandatory' do
        # Arrange
        supplier = Supplier.create!(brand_name: 'Samsung',
                                   corporate_name: 'Samsung Eletronicos LTDA',
                                   registration_number: '45678789000145',
                                   full_address: 'Av das Indústrias, 200',
                                   city: 'São Paulo',
                                   state: 'SP',
                                   email: 'sac@samsung.com',
                                   telephone: '5134567890')
        product = ProductModel.new(name:'',
                                   weight: 8000,
                                   widht: 70,
                                   heigth: 45,
                                   depth: 10,
                                   sku: 'TV32-SAMSU-XPTO90',
                                   supplier: supplier)
        # Action
        result = product.valid?
        # Assert
        expect(result).to eq false
        end
        it 'sku is mandatory' do
        # Arrange
        supplier = Supplier.create!(brand_name: 'Samsung',
                                   corporate_name: 'Samsung Eletronicos LTDA',
                                   registration_number: '45678789000145',
                                   full_address: 'Av das Indústrias, 200',
                                   city: 'São Paulo',
                                   state: 'SP',
                                   email: 'sac@samsung.com',
                                   telephone: '5134567890')
        product = ProductModel.new(name:'TV 32',
                                   weight: 8000,
                                   widht: 70,
                                   heigth: 45,
                                   depth: 10,
                                   sku: ' ',
                                   supplier: supplier)
        # Action
        result = product.valid?
        # Assert
        expect(result).to eq false
   end
        it 'weight is mandatory' do
        # Arrange
        supplier = Supplier.create!(brand_name: 'Samsung',
                                   corporate_name: 'Samsung Eletronicos LTDA',
                                   registration_number: '45678789000145',
                                   full_address: 'Av das Indústrias, 200',
                                   city: 'São Paulo',
                                   state: 'SP',
                                   email: 'sac@samsung.com',
                                   telephone: '5134567890')
        product = ProductModel.new(name:'TV 32',
                                   weight: '',
                                   widht: 70,
                                   heigth: 45,
                                   depth: 10,
                                   sku: 'TV32-SAMSU-XPTO90 ',
                                   supplier: supplier)
        # Action
        result = product.valid?
        # Assert
        expect(result).to eq false
   end
 end
        it 'widht is mandatory' do
        # Arrange
        supplier = Supplier.create!(brand_name: 'Samsung',
                                   corporate_name: 'Samsung Eletronicos LTDA',
                                   registration_number: '45678789000145',
                                   full_address: 'Av das Indústrias, 200',
                                   city: 'São Paulo',
                                   state: 'SP',
                                   email: 'sac@samsung.com',
                                   telephone: '5134567890')
        product = ProductModel.new(name:'TV 32',
                                   weight: 8000,
                                   widht: '',
                                   heigth: 45,
                                   depth: 10,
                                   sku: 'TV32-SAMSU-XPTO90 ',
                                   supplier: supplier)
        # Action
        result = product.valid?
        # Assert
        expect(result).to eq false
   
 end
        it 'heigth is mandatory' do
        # Arrange
        supplier = Supplier.create!(brand_name: 'Samsung',
                                   corporate_name: 'Samsung Eletronicos LTDA',
                                   registration_number: '45678789000145',
                                   full_address: 'Av das Indústrias, 200',
                                   city: 'São Paulo',
                                   state: 'SP',
                                   email: 'sac@samsung.com',
                                   telephone: '5134567890')
        product = ProductModel.new(name:'TV 32',
                                   weight: 8000,
                                   widht: 70,
                                   heigth: '',
                                   depth: 10,
                                   sku: 'TV32-SAMSU-XPTO90 ',
                                   supplier: supplier)
        # Action
        result = product.valid?
        # Assert
        expect(result).to eq false
   
 end
        it 'depth is mandatory' do
        # Arrange
        supplier = Supplier.create!(brand_name: 'Samsung',
                                   corporate_name: 'Samsung Eletronicos LTDA',
                                   registration_number: '45678789000145',
                                   full_address: 'Av das Indústrias, 200',
                                   city: 'São Paulo',
                                   state: 'SP',
                                   email: 'sac@samsung.com',
                                   telephone: '5134567890')
        product = ProductModel.new(name:'TV 32',
                                   weight: 8000,
                                   widht: 70,
                                   heigth: 45,
                                   depth: '',
                                   sku: 'TV32-SAMSU-XPTO90 ',
                                   supplier: supplier)
        # Action
        result = product.valid?
        # Assert
        expect(result).to eq false
   
 end
end
