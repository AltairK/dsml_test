class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.references :user, index: true
      t.integer :task_type, default: 0
      t.text :content, null: false
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
