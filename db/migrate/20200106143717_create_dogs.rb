class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :description
      t.integer :user_id
      t.integer :breed_id
      t.timestamps
    end
  end
end
