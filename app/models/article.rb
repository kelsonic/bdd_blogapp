class Article < ActiveRecord::Base
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :body, presence: true, length: { minimum: 10, maximum: 500 }
  
  default_scope { order(created_at: :desc) }
  
end