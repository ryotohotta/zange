class User < ActiveRecord::Base
  # attr_accessible :email, :password, :password_confirmation, :authentications_attributes
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications

  has_many :articles, dependent: :destroy
  has_many :cheers, dependent: :destroy
  has_many :completions, dependent: :destroy
  has_many :comments

  validates :name, length: { maximum: 140 }
  validates :bio, length: { maximum: 200 }
  validates :email, presence: true, uniqueness: { case_sentensive: false }
  validates :password, confirmation: true, length: { in: 4..24}, if: :password
  validates :password_confirmation, presence: true, if: :password

  rand_password=('0'..'z').to_a.shuffle.first(8).join

  def self.create_with_omniauth auth
    create! do |user|
      user.provider = auth["provider"]
      user.id = auth["uid"]
      user.name = auth["info"]["nickname"]
      user.token = auth["credentials"]['token']
      user.secret = auth['credentials']['secret']
      user.password = rand_password
    end
  end

  def client
    Twitter::Client.new(oauth_token: token, oauth_token_secret: secret)
  end

end
