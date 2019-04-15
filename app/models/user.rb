class User < ApplicationRecord
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, uniqueness: true, presence: true

	serialize :role_ids, Array
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
  paginates_per 2
  has_many :user_meta
  accepts_nested_attributes_for :user_meta
  def role_names
  	Role.where(id: self.role_ids).pluck(:name).join(", ")	
  end
end
