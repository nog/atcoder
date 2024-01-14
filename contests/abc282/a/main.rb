# 英大文字 A の ASCII コード
A = 65

# 入力を受け取る
k = gets.to_i

# 英大文字を A から昇順に K 個繋げる
puts (A...A+k).map(&:chr).join