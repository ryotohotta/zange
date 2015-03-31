class Article < ActiveRecord::Base
  belongs_to :user
  has_many :cheers
  has_many :completions
  has_many :comments

  def cheered_by?(user)
    cheers.where(user_id: user.id).exists?
  end
  def completed_by?(user)
    completions.where(user_id: user.id).exists?
  end
  default_scope -> { order(created_at: :desc)}
end
