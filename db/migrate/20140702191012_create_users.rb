class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :rank
      t.text :bio

      t.timestamps
    end
  end
end
