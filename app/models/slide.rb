# == Schema Information
#
# Table name: slides
#
#  body            :text
#  created_at      :datetime         not null
#  header          :string
#  id              :integer          not null, primary key
#  number          :integer
#  presentation_id :integer
#  title           :string
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_slides_on_presentation_id  (presentation_id)
#

class Slide < ApplicationRecord
  belongs_to :presentation
end
