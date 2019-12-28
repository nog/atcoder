n,a,b,c,d = gets.chomp.split(' ').map(&:to_i)
s = gets.chomp

# 連続岩 = false
追い抜く必要性 = c > d
# 追い抜ける = false
連続岩 = s[(a-1)..(([c,d].max)-1)].include?('##')
if 追い抜く必要性
  追い抜ける = s[(b-2)..d].include?('...')
end
# s.split('').each_with_index do |char, i|
#   x = i + 1
#   if x > a && (x < c || x < d)
#     if char == '#' && s[i-1] == '#'
#       連続岩 = true
#       break
#     end
#   end
# 
#   if 追い抜く必要性 && x > b && x <= d
#     if char == '.' && s[i-1] == '.' && s[i-2] == '.'
#       追い抜ける = true
#     end
#   end
# end

if 連続岩
  puts 'No'
  exit
end

if 追い抜く必要性
  unless 追い抜ける
    puts 'No'
    exit
  end
end

puts 'Yes'