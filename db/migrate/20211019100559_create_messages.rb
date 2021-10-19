class CreateMessages < ActiveRecord::Migration[6.1]
  def change # テーブル操作
    create_table :messages do |t| # messagesというテーブルを作成する【テーブル名は、モデル名の小文字かつ複数形！】
      t.string :content # content カラムが文字列型で追加

      t.timestamps # created_at と updated_at カラムが追加
    end
  end
end
