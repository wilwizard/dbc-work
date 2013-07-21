class CreateSkillsUsers < ActiveRecord::Migration
  def change
    create_table :skills_users do |t|
      t.integer :proficiency, { :default => 0 }
      t.references :skill
      t.references :user
      t.timestamps
    end
  end
end
