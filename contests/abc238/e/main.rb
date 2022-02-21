N, Q = gets.split.map(&:to_i)
hash = {}
Q.times do
  l,r = gets.split.map(&:to_i)
  hash[l-1] ||= []
  hash[l-1].push(r)
  hash[r] ||= []
  hash[r].push(l-1)
end

done = {
  0 => true
}

queue = [0]

while !done[N] && cur = queue.shift do
  (hash[cur] || []).each do |to|
    next if done[to]
    done[to] = true
    queue.push(to)
  end
end

puts done[N] ? 'Yes' : 'No'