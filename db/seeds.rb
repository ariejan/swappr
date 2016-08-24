User.transaction do
  User.delete_all
  BankAccount.delete_all
  Address.delete_all
  Deal.delete_all

  u = User.create!({
    email: "ariejan@devroom.io",
    full_name: "Ariejan de Vroom",
    password: "tester123",
    password_confirmation: "tester123"
  })
  u.confirm

  Address.create({
    user: u,
    address: "Sint Catharinastraat 9",
    postcode: "5694 AJ",
    city: "Breugel",
    country: "Nederland",
    default: true
  })

  Address.create({
    user: u,
    address: "Dommelshei 11",
    postcode: "5508ve",
    city: "Veldhoven",
    country: "Nederland",
    default: false
  })

  BankAccount.create({
    user: u,
    name: "ACJHN de Vroom",
    bank_name: "Rabobank",
    iban: "NL61RABO0183632567",
    bic: "RABONL2U",
    default: true
  })
end
