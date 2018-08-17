puts "Cadastrando o user padrão..."

User.create!(
  name: "Membro",
  email: "membro@membro.com",
  password: "123456",
  password_confirmation: "123456",
)

puts "[OK]"

puts "Cadastrando o admin padrão..."

Admin.create!(
  email: "admin@admin.com",
  password: "123456",
  password_confirmation: "123456",
)

puts "[OK]"
