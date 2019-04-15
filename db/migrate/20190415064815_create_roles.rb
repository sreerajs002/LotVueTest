class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name
      t.boolean :hide_status, default: false

      t.timestamps
    end
  end
end
