K = gets.to_i

result = K # BC=1パターンを先に列挙
1.upto(K/2) do |a|
    bc_max = K / a
    result += bc_max - 1 # C=1パターン
    1.upto(bc_max/2) do |b|
        c_max = bc_max / b
        result += c_max - 1
    end
end

puts result