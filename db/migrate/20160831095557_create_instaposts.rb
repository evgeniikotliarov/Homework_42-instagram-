class CreateInstaposts < ActiveRecord::Migration[5.0]
  def change
    create_table :instaposts do |t|
      t.string :user_id
      t.text :content

      t.timestamps
    end
    add_index :instaposts, [:user_id, :created_at]
  end
end
