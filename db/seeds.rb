user = User.find(2)

Book.create!(
  title: 'A Árvore de Ferro',
  subtitle: 'As Crônicas de Spiderwick',
  year: 2004,
  pages: 114,
  edition: 1,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
 Book.create!(
  title: 'A Batalha do Apocalipse',
  subtitle: 'Da Queda dos Anjos ao Crepúsculo do Mundo',
  year: 2007,
  pages: 504,
  edition: 0,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
 Book.create!(
  isbn: '9788576861041',
  title: 'A Batalha do Apocalipse',
  subtitle: 'Da Queda dos Anjos ao Crepúsculo do Mundo',
  year: 2010,
  pages: 648,
  edition: 1,
  language: 'Português',
  status: 3,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
 Book.create!(
  isbn: '9788598078700',
  title: 'A Batalha do Labirinto',
  subtitle: 'Percy Jackson & os Olimpianos',
  year: 2010,
  pages: 392,
  edition: 1,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
 Book.create!(
  isbn: '9788576652175',
  title: 'A Bruxa de Portobello',
  year: 2006,
  pages: 294,
  edition: 1,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
 Book.create!(
  isbn: '9788573028423',
  title: 'A Bússola de Ouro',
  subtitle: 'Fronteiras do Universo',
  year: 2007,
  pages: 365,
  edition: 1,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
Book.create!(
  isbn: '9788535903928',
  title: 'A Cidade Sinistra dos Corvos',
  subtitle: 'Desventuras em Série',
  year: 2014,
  pages: 232,
  edition: 1,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
Book.create!(
  isbn: '9788501099211',
  title: 'A Companhia Negra',
  year: 2013,
  pages: 306,
  edition: 3,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
Book.create!(
  isbn: '9788572327558',
  title: 'A Dama das Camélias',
  year: 2008,
  pages: 212,
  edition: 1,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
Book.create!(
  isbn: '9788579800863',
  title: 'A Esperança',
  year: 2011,
  pages: 335,
  edition: 1,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
Book.create!(
  isbn: '9788573028430',
  title: 'A Faca Sutil',
  subtitle: 'Fronteiras do Universo',
  year: 2007,
  pages: 300,
  edition: 1,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
Book.create!(
  isbn: '9788580440270',
  title: 'A Fúria dos Reis',
  subtitle: 'As Crônicas de Gelo e Fogo',
  year: 2011,
  pages: 656,
  edition: 1
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
Book.create!(
  isbn: '8571231311',
  title: 'A Grande Jogada',
  year: 1988,
  pages: 412,
  edition: 2,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
Book.create!(
  isbn: '9788531210389',
  title: 'A Grande Rainha',
  subtitle: 'As Brumas de Avalon',
  year: 2008,
  pages: 232,
  edition: 1,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )

 puts "[OK]"