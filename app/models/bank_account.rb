class BankAccount < ApplicationRecord

  BIC_REGEXP = /\A([a-zA-Z]){4}([a-zA-Z]){2}([0-9a-zA-Z]){2}([0-9a-zA-Z]{3})?\z/

  before_validation do
    self.iban = iban.gsub(/\s/, '').upcase
    self.bic  = bic.gsub(/\s/, '').upcase
  end

  belongs_to :user

  validates :name,
    presence: true

  validates :bank_name,
    presence: true

  validates :iban,
    presence: true,
    iban: true

  validates :bic,
    presence: true,
    format: { with: BIC_REGEXP }

  def pretty_iban
    IBANTools::IBAN.new(iban).prettify
  end

  def iban_country_code
    IBANTools::IBAN.new(iban).country_code
  end
end
