class CreateSlides < ActiveRecord::Migration[5.2]
  def change
    create_table :slides do |t|
      t.belongs_to :presentation, index: true
      t.string :title
      t.string :header
      t.integer :number
      t.string :body

      t.timestamps
    end
  end
end
