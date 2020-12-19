H, W = gets.split.map(&:to_i)
MOD = 10**9+7

S = Array.new H
H.times do |i|
    S[i] = gets.chomp.split('').map{|x| x == "#" ? 1 : 0 }
end

patterns = Array.new(H){ Array.new(W, 0)}
patterns[0][0] = 1
seki_yoko = Array.new(H){ Array.new(W, 0)}
seki_yoko[0][0] = 1
seki_tate = Array.new(H){ Array.new(W, 0)}
seki_tate[0][0] = 1
seki_naname = Array.new(H){ Array.new(W, 0)}
seki_naname[0][0] = 1


1.upto(W-1) do |w|
    if S[0][w] == 1
        break
    end
    patterns[0][w] = seki_yoko[0][w-1]
    seki_yoko[0][w] = (seki_yoko[0][w-1] + patterns[0][w]) % MOD
    seki_naname[0][w] = patterns[0][w]
    seki_tate[0][w] = patterns[0][w]
end

1.upto(H-1) do |h|
    if S[h][0] == 0
        patterns[h][0] = seki_tate[h-1][0]
        seki_tate[h][0] = (seki_tate[h-1][0] + patterns[h][0]) % MOD
        seki_naname[h][0] = patterns[h][0]
        seki_yoko[h][0] = patterns[h][0]
    end
    1.upto(W-1) do |w|
        if S[h][w] == 1
            next
        end
        pats = (seki_yoko[h][w-1] + seki_tate[h-1][w] + seki_naname[h-1][w-1]) % MOD
        seki_yoko[h][w] = (seki_yoko[h][w-1] + pats) % MOD
        seki_tate[h][w] = (seki_tate[h-1][w] + pats ) % MOD
        seki_naname[h][w] = (seki_naname[h-1][w-1] + pats) % MOD
        patterns[h][w] = pats
    end
end

puts patterns[H-1][W-1] % MOD