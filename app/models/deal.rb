class Deal < ApplicationRecord

  monetize :amount_cents,
    allow_nil: true,
    numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100_000,
  }

  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"

  belongs_to :seller_bank_account, class_name: "BankAccount", optional: true
  belongs_to :seller_address,      class_name: "Address", optional: true
  belongs_to :buyer_bank_account,  class_name: "BankAccount", optional: true
  belongs_to :buyer_address,       class_name: "Address", optional: true

  validates :title,
    presence: true

end
