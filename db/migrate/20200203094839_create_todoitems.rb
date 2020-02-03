class CreateTodoitems < ActiveRecord::Migration[6.0]
  def change
    create_table :todoitems do |t|
      t.string :todo
      t.boolean :is_completed
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
