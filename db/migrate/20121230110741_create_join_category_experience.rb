class CreateJoinCategoryExperience < ActiveRecord::Migration
  def change
    create_table :categories_experiences do |t|
    	t.integer :category_id
      t.integer :experience_id

      t.timestamps
    end
  end
end
