class CreateProficiencies < ActiveRecord::Migration
  def change
    create_table :proficiencies do |t|
      t.integer :score, { :default => 0 }
      t.references :skill
      t.references :user
      t.timestamps
    end
  end
end
