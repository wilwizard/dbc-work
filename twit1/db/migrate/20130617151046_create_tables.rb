class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :handle
      t.timestamps
    end

    create_table :tweets do |t|
      t.references :user
      t.string  :text
      t.datetime :tweeted_at
      t.timestamps
    end

    create_table :followers do |t|
      t.references :user
      t.string  :name
      t.timestamps
    end
    
  end
end
