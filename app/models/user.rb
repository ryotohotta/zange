class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :name, length: { maximum: 140 }
  validates :bio, length: { maximum: 200 }
  validates :email, presence: true, uniqueness: { case_sentensive: false }
  validates :password, confirmation: true, length: { in: 4..24}, if: :password
  validates :password_confirmation, presence: true, if: :password
end
