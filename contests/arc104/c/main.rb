N = gets.to_i
A = Array.new N 
B = Array.new N 

inlist = Array.new(2 * N + 1)
outlist = Array.new 2 * N

def failed
    puts "No"
    exit
end

def success
    puts "Yes"
    exit
end

N.times do |i|
    a, b = gets.split.map(&:to_i)
    A[i], B[i] = a, b
    if a != -1
        inlist[a] = i
    end
    if b != -1
        outlist[b] = i
    end
end
dp = Array.new(2*N + 1)
dp[0] = true

0.upto(2*N) do |sep|
    next unless dp[sep]
    l = sep + 1
    (l+1).upto(2*N) do |r|
        next if (r - l).even?
        w = (r - l + 1) / 2
        ok = true
        l.upto(l+w-1) do |x|
            if inlist[x]
                unless outlist[x+w]
        end
    end
end