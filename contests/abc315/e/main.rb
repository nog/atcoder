N = gets.to_i
req_hash = {}
n_hash = {}
N.times do |i|
    c, *list = gets.split.map(&:to_i)
    h = {}
    list.each do |l|
        l -= 1
        h[l] = true
        @n_hash[l] ||= []
        @n_hash[l].push(i)
    end
    req_hash[i] = h
end

required = {}

queue = req_hash[0].keys
while(q = queue.shift) do
    next if required[q]
    required[q] = true
    
end