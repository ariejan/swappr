User.transaction do
  User.delete_all

  u = User.create({
    email: "ariejan@devroom.io",
    password: "tester123",
    password_confirmation: "tester123"
  })
  u.confirm

  p = u.profile

  Address.create({
    profile: p,
    address: "Sint Catharinastraat 9",
    postcode: "5694AJ",
    city: "Breugel",
    country: "Nederland",
    default: true
  })

  Address.create({
    profile: p,
    address: "Dommelshei 11",
    postcode: "5508VE",
    city: "Veldhoven",
    country: "Nederland",
    default: false
  })

  BankAccount.create({
    profile: p,
    name: "ACJHN de Vroom",
    bank_name: "Rabobank",
    iban: "NL61RABO0183632567",
    bic: "RABONL2U",
    default: true
  })
end
