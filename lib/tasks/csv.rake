require 'csv'

namespace :csv do
  desc "TODO"
  task import: :environment do
    user = User.find(2)

    CSV.foreach('lib/tasks/books.csv', col_sep: ',').with_index do |row, index|
      unless (index == 0)
        Book.create!(
          title: row[0],
          subtitle: row[1],
          edition: row[2],
          year: row[3],
          pages: row[4],
          isbn: row[5],
          language: row[6],
          status: row[7],
          shelf: row[8],
          published: row[9],
          editor: Editor.find(row[10]),
          author: Author.find(row[11]),
          user: user
        )
      end
    end


  end

end
