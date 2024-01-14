T = gets.to_i 

def yes 
  puts 'Yes'
  next
end

T.times do
  n = gets.to_i
  a = gets.split.map(&:to_i)
  b = gets.split.map(&:to_i)

  yes if a == b

  i = 0
  while(i < b.size) do
    if b[i] == b[i-1]
      b.delete_at(i)
    else
      i += 1
    end
  end

  aa = a + a
  N.times do |pos|
    res = true
    b.each do |bb|
      while()
    end
  end

end