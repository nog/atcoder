N = gets.to_i
S = gets.chomp.split('')
T = gets.chomp.split('')

if S.sort != T.sort 
  puts -1 
  exit
end

point = N-1
while(S.size > 0 && point >= 0) do
  s = S.pop
  while(T[point] != s) do 
    if point == 0
      S.push(s)
      break
    else
      point -= 1
    end
  end
  point -= 1
end

puts S.size