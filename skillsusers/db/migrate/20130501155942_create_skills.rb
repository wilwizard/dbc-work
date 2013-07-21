class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.string :context
      t.references :proficiency
      t.timestamps
    end
  end
end
