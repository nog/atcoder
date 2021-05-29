N = gets.to_i
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)
c = Array.new N
hash = {}

N.times do |i|
    a = A[i] + i
    hash[a] ||= []
    hash[a].push(i)
end

N.times do |i|
    b = B[i] + i
    unless hash[b]
        puts -1
        exit
    end

    j = hash[b].shift
    c[j] = i
end

puts result