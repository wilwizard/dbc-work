class CreateCommentvotes < ActiveRecord::Migration
  def change
    create_table :commentvotes do |t|
      t.references :user
      t.references :comment
      t.boolean :is_up
      t.timestamps
    end
  end
end
