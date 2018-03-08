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
    current_slide = Slide.find(id)
    presentation = current_slide.presentation

    slides = presentation.slides.sort_by(&:number)
    slide_index = slides.index(current_slide)
    previous_slide = slide_index.positive? ? slides[slide_index - 1] : nil
    next_slide = slides.length > (slide_index + 1) ? slides[slide_index + 1] : nil

    { current_slide: current_slide, previous_slide: previous_slide, next_slide: next_slide }
  end

  def self.slide_from_presentation(presentation, number)
    presentation.slides.select do |slide|
      slide.number == number
    end
  end
end
