class User < ApplicationRecord

	#for comments 
	 has_many :comments, dependent: :destroy

	validates :user_name, presence: true, length: { minimum: 4, maximum: 16 } ,  uniqueness: true

	#for posts 
	has_many :posts, dependent: :destroy

  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable

has_attached_file :avatar, styles: { medium: '152x152#' }
validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end
