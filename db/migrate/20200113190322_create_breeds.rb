# frozen_string_literal: true

class CreateBreeds < ActiveRecord::Migration[6.0]
  def change
    create_table :breeds do |t|
      t.string :name
      t.string :female_height_min
      t.string :female_height_max
      t.string :male_height_min
      t.string :male_height_max
      t.string :female_weight_min
      t.string :female_weight_max
      t.string :male_weight_min
      t.string :male_weight_max
      t.string :description
    end
  end
end
