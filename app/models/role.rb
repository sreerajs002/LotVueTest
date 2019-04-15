class Role < ApplicationRecord
	validates :name, uniqueness: true, presence: true
	scope :hidden, -> { where(hide_status: true)}
	scope :nonhidden, -> { where(hide_status: [nil,false])}
end
