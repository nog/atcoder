N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

if K == 1
  puts (1..N).to_a.reverse.join(' ')
  exit
end

result = []
used = {}
A.each do |a|
  used[a] = true
end
kouho = []
1.upto(N) do |n|
  unless used[n]
    kouho.push(n)
  end
end

first_list = [A.shift]
last_list = [A.pop]
while(A[0] && kouho[0] && A[0] < kouho[0]) do
  first_list.push(kouho.shift)
  first_list.push(A.shift)
end
while(A[-1] && kouho[-1] && A[-1] > kouho[-1]) do
  last_list.push(kouho.pop)
  last_list.push(A.pop)
end

warn A.inspect
warn kouho.inspect
puts (first_list + kouho.reverse + A + last_list.reverse).join(' ')
