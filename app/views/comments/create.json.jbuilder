json.id @comment.id
json.rate @comment.rate
json.text @comment.text
json.user_name @comment.user.name
json.created_at @comment.created_at.strftime("%B %d, %Y")