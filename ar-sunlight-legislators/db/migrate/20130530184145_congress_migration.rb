class CreateCongressMember < ActiveRecord::Migration
  def change
     create_table :congress_members do |t|
       t.string :title
       t.string :first_name
       t.string :last_name
       t.string :name_suffix
       t.string :party
       t.string :state
       t.string :gender
       t.string :phone
       t.string :fax
       t.string :website
       t.string :twitter_id
       t.string :birthdate
     end
  end
