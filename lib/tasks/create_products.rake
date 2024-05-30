namespace :cad do
  desc 'Criação de produtos no banco de dados'
  task product: :environment do
    puts 'Cadastrando produtos ...'

    Category.create(
      description: 'Laticineos'
    )

    10.times do
      Product.create(
        description: Faker::Commerce.product_name,
        price: Faker::Commerce.price(range: 10.0..100.0),
        category_id: 1
      )
    end
    puts 'Produto cadastrado com sucesso!!!'
  end
end
