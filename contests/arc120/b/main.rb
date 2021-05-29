H, W = gets.split.map(&:to_i)

S = Array.new H
MOD=998244353

mapf = {
    '.' => 0,
    'R' => 1,
    'B' => 2
}
lines = Array.new(H+W-1){ Hash.new }
H.times do |h|
    s = gets.chomp.split('').map{|s| mapf[s] }
    W.times do |w|
        # warn "h:#{h} w:#{w}"
        lines[h+w][s[w]] = true
    end
end

result = 1
lines.each do |res|
    if res[1] && res[2]
        result = 0
        break
    end

    if !res[1] && ! res[2]
        result = result * 2 % MOD
    end
end

puts result % MOD