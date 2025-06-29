class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title #255文字まで
      t.text :body #長文投稿OK
      t.integer :user_id #受渡し1n関係でUser<book

      t.timestamps
    end
  end
end
