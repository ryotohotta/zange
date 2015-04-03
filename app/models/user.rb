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

  def self.create_with_omniauth auth
    create! do |user|
      user.provider    = auth["provider"]
      user.uid            = auth["uid"]
      user.token        = auth['credentials']['token']
      user.secret        = auth['credentials']['secret']
    end
  end

  def client
    Twitter::Client.new(oauth_token: token, oauth_token_secret: secret)
  end
end
