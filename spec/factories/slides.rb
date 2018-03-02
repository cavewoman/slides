# == Schema Information
#
# Table name: slides
#
#  body            :string
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

FactoryBot.define do
  factory :slide do
    title "MyString"
    header "MyString"
    number 1
    body "MyString"
  end
end
