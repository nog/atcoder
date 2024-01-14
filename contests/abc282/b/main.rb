# 入力を受け取る
n, m = gets.split.map(&:to_i)

# 参加者の情報を受け取る
participants = n.times.map { gets.chomp }

# 各参加者が解ける問題の番号を保存する配列を生成する
solved = participants.map do |p|
  # o の位置を配列にする
  p.chars.each_index.select { |i| p[i] == "o" }
end

# ペアを組んで全ての問題を解ける参加者の組の数を数える
count = 0
solved.combination(2).each do |pair|
  count += 1 if (pair[0] | pair[1]).size == m
end

# 結果を出力する
puts count