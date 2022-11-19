N, X = gets.split.map(&:to_i)

minus = (1..(X-1)).to_a
plus = (X+1..N).to_a

result = [X]

if (minus.size - plus.size).abs <= 1
  if plus.size >= minus.size
    while(plus.size > 0) do
      result.push(plus.shift)
      result.push(minus.pop) if minus.size > 0
    end
  else
    while(minus.size > 0) do
      result.push(minus.pop) if minus.size > 0
      result.push(plus.shift) if plus.size > 0
    end
  end
  puts result.join(' ')
  exit
end

list = minus + plus

# warn list.inspect
size = list.size
left = nil
right = nil
if list.size.odd?
  result.push(list[size/2])
  left = list[0..(size/2 - 1)]
  right = list[(size / 2 + 1)..-1]
else
  left = list[0..(size/2 - 1)]
  right = list[(size / 2 )..-1]
end


# warn left.inspect
# warn right.inspect
while(left.size > 0) do
  result.push(left.pop)
  result.push(right.shift)
end

puts result.join(' ')