namespace :dev do
  desc "Setup development"
  task setup: :environment do

    images_path = Rails.root.join('public','system')

    puts "Executando..."

    puts "Apagando o banco... #{%x(rake db:drop)}"
    puts "Criando o banco... #{%x(rake db:create)}"
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake dev:generate_authors)
    puts %x(rake dev:generate_editors)
    puts %x(rake dev:generate_books)
    puts %x(rake dev:generate_images)
    puts %x(rake dev:generate_lists)
    puts "[OK]"
  end

  ####################################################################

  desc "TODO"
  task generate_authors: :environment do

    puts "Gerando autores aleatórios"

    10.times do
      Author.create!(
        name: Faker::Name.name
        )
    end

    puts "[OK]"
  end

  ####################################################################

  desc "TODO"
  task generate_editors: :environment do

    puts "Gerando editoras aleatórias"

    10.times do
      Editor.create!(
        name: Faker::Company.name
        )
    end

    puts "[OK]"
  end

  ####################################################################

  desc "TODO"
  task generate_books: :environment do

    puts "Gerando livros aleatórios"

    100.times do
      book = Book.create!(
        isbn: 13.times.map{rand(10)}.join,
        title: Faker::Book.title,
        subtitle: Faker::Book.title,
        year: Random.rand(1500..2017),
        pages: Random.rand(50..1000),
        edition: Random.rand(1..5),
        language: Faker::Book.genre,
        status: Random.rand(1..3),
        shelf: Random.rand(1..3),
        editor: Editor.all.sample,
        author: Author.all.sample,
        user: User.first
        )
      book.image.attach(
        File.open(Rails.root.join('public', 'templates', 'images', "#{Random.rand(9)}.jpg"), 'r')
      )
    end
    puts "[OK]"
  end

  ####################################################################

  desc "TODO"
  task generate_images: :environment do

    puts "Gerando livros aleatórios"

    books = Book.all
    books.each do |book|
      book.image.attach(
        File.open(Rails.root.join('public', 'templates', 'images', "#{Random.rand(9)}.jpg"), 'r')
      )
    end

    puts "[OK]"
  end


  ####################################################################

  desc "TODO"
  task generate_lists: :environment do

    puts "Gerando listas aleatórias"

    50.times do
      List.create!(
        year: Random.rand(2008..2017),
        book: Book.all.sample
        )
    end

    puts "[OK]"
  end

  ####################################################################

  end
