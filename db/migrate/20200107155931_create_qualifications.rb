class CreateQualifications < ActiveRecord::Migration[6.0]
  def change
    create_table :qualifications do |t|
      t.string :profession
      t.integer :user_id
      t.timestamps
    end
  end
end
