class Profile < ApplicationRecord

  belongs_to :user

  has_many :addresses, -> { extending DefaultRecord },
    dependent: :destroy

  has_many :bank_accounts, -> { extending DefaultRecord },
    dependent: :destroy

end
