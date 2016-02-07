class Comment < ActiveRecord::Base
  
  belongs_to :article
  belongs_to :user
  
  validates :body, presence: true, length: { minimum: 1, maximum: 500 }
  
  def self.persisted
    where.not(id: nil)
  end
  
end
