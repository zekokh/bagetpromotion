class CreatePromocods < ActiveRecord::Migration[5.0]
  def change
    create_table :promocods do |t|
      t.integer :code
      t.boolean :used, default: false

      t.timestamps
    end
  end
end
