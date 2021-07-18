N = gets.to_i 
S = gets.chomp.split('')

result = true
S.each do |s|
  if s == "1"
    break
  end
  result = !result
end

puts result ? 'Takahashi' : "Aoki"