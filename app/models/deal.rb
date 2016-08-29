class Deal < ApplicationRecord

  attr_accessor :party_b_email, :share, :request

  monetize :amount_cents,
    allow_nil: true,
    numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100_000,
  }

  belongs_to :party_a, class_name: "User"
  belongs_to :party_b, class_name: "User"

  belongs_to :party_a_bank_account, class_name: "BankAccount", optional: true
  belongs_to :party_a_address,      class_name: "Address", optional: true
  belongs_to :party_b_bank_account, class_name: "BankAccount", optional: true
  belongs_to :party_b_address,      class_name: "Address", optional: true

  validates :title,
    presence: true

  scope :for_party_a, -> (id) { where(party_a_id: id) }
  scope :for_party_b, -> (id) { where(party_b_id: id) }

  scope :for_user, -> (user) { for_seller(user.id).or(for_buyer(user.id)) }

end
