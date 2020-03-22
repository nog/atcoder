H, W = gets.split.map(&:to_i)

S = Array.new(H+2)
S[0] = Array.new(H+2, '$')
H.times do |i|
  S[i+1] = ['$', *gets.chomp.split(''), '$']
end
S[H+1] = Array.new(H+2, '$')
S[0][1] = '.'

result = 0
steps = Array.new(H+2){ Array.new(W+2)}
steps[0][1] = 0
1.upto(H) do |y|
  if S[y][1] == '#' && S[y-1][1] != S[y][1]
    steps[y][1] = steps[y-1][1] + 1
  else  
    steps[y][1] = steps[y-1][1]
  end
  2.upto(W) do |x|
    step = nil
    if S[y][x] == '#' && S[y][x-1] != S[y][x]
      step = steps[y][x-1] + 1
    else
      step = steps[y][x-1]
    end
    unless y == 1
      ystep = nil
      if S[y][x] == '#' && S[y][x] != S[y-1][x]
        ystep = steps[y-1][x] + 1
      else
        ystep = steps[y-1][x]
      end
      step = ystep if ystep < step
    end
    steps[y][x] = step
  end
end

# require 'pp'
# pp steps
puts steps[H][W]