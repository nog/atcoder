Q, K = gets.split.map(&:to_i)

bc = {}
queries = []
bcl = []
Q.times do
    a, x = gets.split
    x = x.to_i
    bc[x] ||= 0
    if a == "+"
        bc[x] += 1
    else
        bc[x] -= 1
    end
    bcl.push(bc.dup)
end