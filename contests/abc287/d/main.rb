S = gets.chomp.split('')
T = gets.chomp.split('')

zenhan = 0
1.upto(T.size) do |x|
  if S[x-1] == "?"
    zenhan += 1
    next
  elsif T[x-1] == "?"
    zenhan += 1
    next
  elsif S[x-1] == T[x-1]
    zenhan += 1
    next
  else
    break
  end
end

kouhan = 0
1.upto(T.size) do |x|
  if S[-x] == "?"
    kouhan += 1
    next 
  elsif T[-x] == "?"
    kouhan += 1
    next
  elsif S[-x] == T[-x]
    kouhan += 1
    next
  else
    break
  end
end

(T.size+1).times do |i|
  if i > zenhan
    puts "No"
    next
  end

  if i < T.size - kouhan
    puts "No"
    next
  end

  puts "Yes"
end