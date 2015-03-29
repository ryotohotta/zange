class Article < ActiveRecord::Base
  belongs_to :user
  has_many :cheers

  def cheered_by?(user)
    cheers.where(user_id: user.id).exists?
    
  end
  default_scope -> { order(created_at: :desc)}
end
