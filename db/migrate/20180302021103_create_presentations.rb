class CreatePresentations < ActiveRecord::Migration[5.2]
  def change
    create_table :presentations do |t|
      t.string :title
      t.string :presenter
      t.string :theme

      t.timestamps
    end
  end
end
