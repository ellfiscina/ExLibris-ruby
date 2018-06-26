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
        name: Faker::Book.author
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
        name: Faker::Book.publisher
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
        isbn: Faker::Code.isbn,
        title: Faker::Book.title,
        subtitle: Faker::Book.title,
        year: Faker::Number.between(1500,2018),
        pages: Faker::Number.between(50,1000),
        edition: Faker::Number.number(1),
        language: Faker::Book.genre,
        status: Faker::Number.between(1,3),
        shelf: Faker::Number.between(1,3),
        editor: Editor.all.sample,
        author: Author.all.sample,
        user: User.first
        )
    end

    puts "[OK]"
  end

  ####################################################################
  desc "TODO"
  task generate_images: :environment do


    puts "Gerando images aleatórias"

    books = Book.all
    books.each do |book|
      n = Random.rand(9)
      book.image.attach(
        io: File.open("/home/ellen/projects/Ex-libris-ruby/public/templates/images/#{n}.jpg"),
        filename: "#{n}.jpg"
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
        year: Faker::Number.between(2008,2018),
        book: Book.all.sample
        )
    end

    puts "[OK]"
  end

  ####################################################################

  end
