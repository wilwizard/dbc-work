class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user
      t.string :votable_type
      t.integer :votable_id
      t.integer :value, default: 0
    end
  end
end
