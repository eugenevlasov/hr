class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name, null: false, lenght: 256
      t.timestamps null: false
    end
  end
end
