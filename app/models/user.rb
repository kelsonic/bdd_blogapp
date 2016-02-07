class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # First Name Validations
  validates :first_name, presence: true, length: { minimum: 2, maximum: 20 }
  validates_format_of :first_name, :with => /\A[A-Za-z]+\Z/, message: "can only contain letters."
  
  # Last Name Validations
  validates :last_name, presence: true, length: { minimum: 2, maximum: 20 }
  validates_format_of :last_name, :with => /\A[A-Za-z]+\Z/, message: "can only contain letters."
         
  has_many :articles
  
end
