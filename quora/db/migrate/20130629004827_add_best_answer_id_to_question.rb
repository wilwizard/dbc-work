class AddBestAnswerIdToQuestion < ActiveRecord::Migration
  def change
    change_table :questions do |t|
      t.references :answer
    end
  end
end
