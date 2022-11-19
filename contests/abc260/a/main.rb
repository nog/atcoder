S = gets.chomp.split('')


hash = {}
S.each do |s|
  hash[s] ||= 0
  hash[s] += 1
end

hash.each do |k, v|
  if v == 1
    puts k
    exit
  end
end

puts -1