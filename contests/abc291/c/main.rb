N = gets.to_i
S = gets.chomp.split('')

x = 0
y = 0

hash = {}
hash[0] ||= {}
hash[0][0] = true

S.each do |ar|
  if ar == "L"
    x -= 1
  elsif ar == "R"
    x += 1
  elsif ar == "U"
    y += 1
  elsif ar == "D"
    y -= 1
  end


  if hash[x]
    if hash[x][y]
      puts 'Yes'
      exit
    else
      hash[x][y] = true
    end
  else
    hash[x] ||= {}
    hash[x][y] = true
  end
end

puts 'No'