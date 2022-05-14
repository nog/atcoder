N = gets.to_i
A = gets.split.map(&:to_i)

flip = false
while(A[0]) do
  if flip
    if A[-1] == 1
      A.pop
      next
    end
  else
    if A[-1] == 0
      A.pop
      next
    end
  end

  if flip
    if A[0] == 1
      A.shift
      flip = false
      next
    end
  else
    if A[0] == 0
      A.shift
      flip = true
      next
    end
  end

  break
end

if A[0]
  puts 'No'
else
  puts 'Yes'
end
exit

def calc flip, list
  # warn "flie:#{flip} list:#{list.inspect}"
  return true if list.size == 0
  if flip
    if list[-1] == 1
      list.pop
      r = calc(true, list)
      return true if r
      list.push(1)
    end
    if list[0] == 1
      list.shift
      r = calc(false, list)
      return true if r
      list.unshift(1)
    end
  else
    if list[-1] == 0
      list.pop
      r = calc(false, list)
      return true if r
      list.push(0)
    end
    if list[0] == 0
      list.shift
      r = calc(true, list)
      return true if r
      list.unshift(0)
    end
  end
  return false
end

puts calc(false, A) ? 'Yes' : 'No'