class CreateChatMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :chat_messages do |t|
      t.text :body
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
