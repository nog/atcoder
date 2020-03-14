S = gets.chomp.split('')
Q = gets.to_i

t1 = false
Q.times do
  q = gets.split
  if q[0] == "1"
    t1 = !t1
    next
  end

  if q[1] == "1"
    if t1
      S.push(q[2])
    else
      S.unshift(q[2])
    end
  else
    if t1
      S.unshift(q[2])
    else
      S.push(q[2])
    end
  end
end

if t1
  puts S.reverse.join
else
  puts S.join
end