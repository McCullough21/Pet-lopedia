class CreateBreeds < ActiveRecord::Migration[6.0]
  def change
    create_table :breeds do |t|
      t.string :name
      t.string :height
      t.string :weight
      t.string :description
    end
  end
end
