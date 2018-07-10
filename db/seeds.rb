user = User.find(2)

Book.create!(
  isbn: '9788535907025',
  title: 'A Gruta Gorgônea',
  subtitle: 'Desventuras em Série 11',
  year: 2014,
  published: 2004,
  pages: 288,
  edition: 1,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
Book.create!(
  isbn: '9788562936524',
  title: 'A Guerra dos Tronos',
  subtitle: 'As Crônicas de Gelo e Fogo',
  year: 2010,
  pages: 592,
  edition: 1,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
Book.create!(
  isbn: '9788532504319',
  title: 'A História do Ladrão de Corpos',
  subtitle: 'As Crônicas Vampirescas',
  year: 2009,
  pages: 464,
  edition: 1,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
Book.create!(
  isbn: '9788532504852',
  title: 'A Hora das Bruxas I',
  subtitle: 'As Bruxas Mayfair',
  year: 1994,
  pages: 490,
  edition: 1,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
Book.create!(
  isbn: '9788532504869',
  title: 'A Hora das Bruxas II',
  subtitle: 'As Bruxas Mayfair',
  year: 1994,
  pages: 486,
  edition: 1,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
Book.create!(
  title: 'A Ilha do Tesouro',
  year: 2001,
  pages: 56,
  edition: 1,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
Book.create!(
  isbn: '9788532519993',
  title: 'A Ira de Mulgarath',
  subtitle: 'As Crônicas de Spiderwick V',
  year: 2004,
  pages: 146,
  edition: 1,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
Book.create!(
  isbn: '9788573028416',
  title: 'A Luneta Âmbar',
  subtitle: 'Fronteiras do Universo II',
  year: 2007,
  pages: 526,
  edition: 1,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
Book.create!(
  isbn: '9788598078588',
  title: 'A Maldição do Titã',
  subtitle: 'Percy Jackson & os Olimpianos',
  year: 2009,
  pages: 336,
  edition: 1,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
Book.create!(
  isbn: '9788538003519',
  title: 'A Mão e a Luva',
  year: 2008,
  pages: 128,
  edition: 2,
  language: 'Português',
  status: 3,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
Book.create!(
  isbn: '9788532517715',
  title: 'A Pedra da Visão',
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
  title: 'A Portrait of the Artist as a Young Man',
  edition: 1,
  language: 'Inglês',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
Book.create!(
  isbn: '9788532500311',
  title: 'A Rainha dos Condenados',
  year: 1990,
  pages: 588,
  edition: 1,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
Book.create!(
  isbn: '9788535909555',
  title: 'A Revolução dos Bichos',
  year: 2007,
  pages: 148,
  edition: 1,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )
Book.create!(
  isbn: '9788535901436',
  title: 'A Sala dos Répteis',
  subtitle: 'Desventuras em Série',
  year: 2014,
  pages: 182,
  edition: 1,
  language: 'Português',
  status: 1,
  shelf: 1,
  editor: Editor.all.sample,
  author: Author.all.sample,
  user: user
  )

 puts "[OK]"