class Cheer < ActiveRecord::Base
  belongs_to :articles
  belongs_to :users
end
