json.partial! "memos/memo", memo: @memo
json.content @memo.content
json.title @memo.title
json.created_at @message.created_at.to_s
json.id @message.id