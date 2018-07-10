puts "Cadastrando o user padrão..."

User.create!(
  email: "membro@membro.com",
  password: "123456",
  password_confirmation: "123456",
)

puts "[OK]"