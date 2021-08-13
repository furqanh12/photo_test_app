class Picture < ApplicationRecord
	belongs_to :album, optional: true
	has_one_attached :avatar
	validates_associated :album
end
