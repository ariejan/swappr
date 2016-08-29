class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  has_many :addresses, -> { extending DefaultRecord },
    dependent: :destroy

  has_many :bank_accounts, -> { extending DefaultRecord },
    dependent: :destroy


  def deals
    Deal.for_user(self)
  end

end
