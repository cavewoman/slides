class Presentation < ApplicationRecord
  has_many :slides, dependent: :destroy
end
