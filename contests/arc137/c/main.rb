N = gets.to_i 
A = gets.split.map(&:to_i)

player = true # true Alice, false Bob

while(a = A.pop) do
  max = A[-1]
  max = N - 2 if max == 0
  sec = A[-2]
  sec = N - 3 if sec == 0
  if N > a
    puts player ? 'Bob' : 'Alice'
    exit
  end
  if max < N
    puts player ? 'Alice' : 'Bob'
    exit
  end

  if sec && sec != N-3
    A.unshift(0)
  elsif max < a-1
    A.push(max+1)
  else
    A.unshift(0)
  end
  player = !player
end