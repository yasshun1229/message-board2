# テストデータの生成

# レコードを3件表示する
# Message.create(title: "test title 1 ", content: "test content1")
# Message.create(title: "test title 2 ", content: "test content2")
# Message.create(title: "test title 3 ", content: "test content3")

# レコードを100件表示する
(1..100).each do |number|
  Message.create(title: "test title" + number.to_s, content: "test content" + number.to_s )
end

# rails db:seed