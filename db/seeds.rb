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

  a1 = Address.create!({
    user: u,
    name: "Ariejan de Vroom",
    address: "Sint Catharinastraat 9",
    postcode: "5694 AJ",
    city: "Breugel",
    country: "nl",
    default: true
  })

  a2 = Address.create!({
    user: u,
    name: "Ariejan de Vroom",
    address: "Dommelshei 11",
    postcode: "5508ve",
    city: "Veldhoven",
    country: "nl",
    default: false
  })

  b1 = BankAccount.create!({
    user: u,
    name: "ACJHN de Vroom",
    bank_name: "Rabobank",
    iban: "NL61RABO0183632567",
    bic: "RABONL2U",
    default: true
  })

  u2 = User.create!({
    email: "john.doe@example.com",
    full_name: "John Doe",
    password: "tester123",
    password_confirmation: "tester123"
  })
  u2.confirm

  a3 = Address.create!({
    user: u2,
    name: "John & Jane Doe",
    address: "Kerkstraat 1",
    postcode: "6608DE",
    city: "Weert",
    country: "nl",
    default: true
  })

  d = Deal.create!({
    seller: u,
    buyer: u2,
    seller_bank_account: b1,
    buyer_address: a3,
    amount: 29.95,
    title: 'Shiny Gadget',
    description: 'Shiny Gadget, as seen on Marktplaats'
  })
end
