N, L = gets.split.map(&:to_i)

s = ("2" + "0" * (L-1)).to_i(3)
e = s + N - 1

s.upto(e) do |i|
  x = i.to_s(3)
  puts x
  puts x.gsub(/[012]/, { "2" => "0", "1" => "2", "0" => "1" })
  puts x.gsub(/[012]/, { "2" => "1", "1" => "0", "0" => "2" })
end