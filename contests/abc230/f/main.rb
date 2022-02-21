N = gets.to_i
A = gets.split.map(&:to_i)
done = {}

result = 1
done[A] = true
queue = [A]

while(a = queue.shift) do 
  (a.size - 1).times do
end