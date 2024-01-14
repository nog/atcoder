N, M = gets.split.map(&:to_i)

results = Array.new(N, nil)
results[0] = [0,0]

to = Array.new(N){ Array.new }

M.times do
    a, b, x, y = gets.split.map(&:to_i)
    to[a-1].push [b-1, x, y]
    to[b-1].push [a-1, -x, -y]
end

# warn to.inspect

queue = [0]

n = N
while(q = queue.shift) do
    # warn results.inspect
    n -= 1
    to[q].each do |t, x, y|
        # warn "t:#{t} x:#{x} y:#{y}"
        next if results[t]
        results[t] = [results[q][0] + x, results[q][1] + y]
        queue.push(t)
    end
end

results.each do |r|
    puts r ? r.join(' ') : "undecidable"
end