class CreateBreeds < ActiveRecord::Migration[6.0]
  def change
    create_table :breeds do |t|
      t.string :name
      t.string :female_height
      t.string :male_height
      t.string :female_weight
      t.string :male_weight
      t.string :description
    end
  end
end
