namespace :dev do
  desc "Setup development"
  task setup: :environment do

    puts "Executando..."

    puts "Apagando o banco... #{%x(rake db:drop)}"
    puts "Criando o banco... #{%x(rake db:create)}"
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake dev:generate_authors)
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
    task generate_authors: :environment do

      puts "Gerando editoras aleatórias"

      10.times do
        Editor.create!(
          name: Faker::Company.name
        )
      end

      puts "[OK]"
    end

    ####################################################################

end
