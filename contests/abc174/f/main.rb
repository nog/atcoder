N, Q = gets.split.map(&:to_i)
c = gets.split.map(&:to_i)

hash = {}
dups = {}
c.each_with_index do |x, i|
    if hash[x]
        dups[x] = true
        hash[x].push(i)
    else
        hash[x] ||= [i]
    end
end


sums = {}
dups = dups.keys
dups.each do |d|
    sums[d] = Array.new(N, 0)
    before = hash[d].shift
    hash[d].each do |x|
        (before+1).upto(x) do |i|
            
        end
    end
end

Q.times do
    l, r = gets.split.map(&:to_i)
end