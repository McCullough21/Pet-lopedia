# frozen_string_literal: true

class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :description
      t.integer :user_id
      t.integer :breed_id
    end
  end
end
