class Chirp < ApplicationRecord
  belongs_to :user, optional: true
  validates :content, presence: true
end
