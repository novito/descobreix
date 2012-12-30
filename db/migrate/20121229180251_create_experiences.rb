class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :city_id

      t.timestamps
    end
  end
end
