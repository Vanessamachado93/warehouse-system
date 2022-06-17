#Galpões cadastrados.
Warehouse.create!(name: 'Aeroporto SP',
                  code: 'GRU', 
                  city: 'Guarulhos',
                  area: '100_000',
                  address: 'Avenida do Aeroporto, 1000',
                  cep: '15000-000',
                  description: 'Galpão destinado para cargas internacionais'
                  )

Warehouse.create(name: 'Rio', 
                 code: 'SDU', 
                 city: 'Rio de Janeiro', 
                 area: 60_000,
                 address: 'Avenida do Porto, 3000', 
                 cep:'2000-000', 
                 description: 'Galpão no Rio'
                )

Warehouse.create(name: 'Maceio', 
                 code: 'MCZ', 
                 city: 'Maceio', 
                 area: 50_000,
                 address: 'Avenida da Luz, 2000', 
                 cep:'5000-000',
                 description: 'Galpão em Maceio'
                )