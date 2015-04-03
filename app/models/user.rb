class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :articles, dependent: :destroy
  has_many :cheers, dependent: :destroy
  has_many :completions, dependent: :destroy
  has_many :comments

  validates :name, length: { maximum: 140 }
  validates :bio, length: { maximum: 200 }
  validates :email, presence: true, uniqueness: { case_sentensive: false }
  validates :password, confirmation: true, length: { in: 4..24}, if: :password
  validates :password_confirmation, presence: true, if: :password
end
