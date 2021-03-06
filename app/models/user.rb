class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  has_many :addresses, -> { extending DefaultRecord },
    dependent: :destroy

  has_many :bank_accounts, -> { extending DefaultRecord },
    dependent: :destroy

  validates :full_name,
    presence: true

end
