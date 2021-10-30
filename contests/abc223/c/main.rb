N = gets.to_i
ab = []
N.times do |i|
  x = (gets.split.map(&:to_i))
  x.push(x[0])
  ab.push(x)
end

result = 0.0
result2 = 0.0
left = ab.shift
right = ab.pop

while(true) do
  unless right
    puts result + result2 + (left[0].to_f / 2)
    exit
  end

  unless left
    puts result + result2 + (right[0].to_f / 2)
    exit
  end
  lt = left[0].to_f / left[1]
  rt = right[0].to_f / right[1]
  if lt > rt
    x  = left[1] * rt
    result2 += x
    right = ab.pop
    left[0] -= x
  elsif lt < rt
    result += left[2]
    result2 = 0
    left = ab.shift
    right[0] -= right[1] * lt
  else
    l = ab.shift
    if !l
      puts result + result2 + left[0]
      exit
    end
    result += left[2]
    result2 = 0
    left = l
    right = ab.pop
  end
end