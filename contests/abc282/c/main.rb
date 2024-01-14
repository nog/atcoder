# 入力を受け取る
n = gets.to_i
s = gets.chomp

s.gsub!(",", ".")

# 括られた文字を検出する正規表現
pattern = /".*?"/

# 括られた文字を検出し、置換する
result = s.gsub(pattern) do |match|
  match.gsub(".", ",")
end

# 結果を出力する
puts result