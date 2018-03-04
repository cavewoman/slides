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

  def self.slide_data(id)
    slide_data = {}
    current_slide = Slide.find(id)
    current_slide_number = current_slide.number
    presentation = current_slide.presentation

    slide_data[:current_slide] = current_slide

    if current_slide_number > 1
      previous_slide = slide_from_presentation(presentation, current_slide_number - 1)
      slide_data[:previous_slide] = previous_slide[0] unless previous_slide.empty?
    end

    next_slide = slide_from_presentation(presentation, current_slide_number + 1)
    slide_data[:next_slide] = next_slide[0] unless next_slide.empty?

    slide_data
  end

  def self.slide_from_presentation(presentation, number)
    presentation.slides.select do |slide|
      slide.number == number
    end
  end
end
