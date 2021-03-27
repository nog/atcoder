K = gets.to_i
S = gets.chomp
T = gets.chomp

cards = Array.new 10, K
cards[0] = 0
result = 0

taka = Hash.new 0
aoki = Hash.new 0

S[0..-2].split('').map(&:to_i).each do |x|
    taka[x] += 1
    cards[x] -= 1
end
T[0..-2].split('').map(&:to_i).each do |x|
    aoki[x] += 1
    cards[x] -= 1
end

cards_count = (K*9)- 8

warn taka.inspect
warn aoki.inspect
warn cards.inspect

def calc_point hash, add
    result = 0
    1.upto(9) do |i|
        x = hash[i]
        x += 1 if add == i
        result += i * (10 ** x)
    end
    result
end

warn "taka"
warn calc_point(taka, 9)
warn calc_point(aoki, 8)

win_count = 0
1.upto(9) do |i|
    icnt = cards[i]
    next if icnt == 0
    taka_point = calc_point(taka, i)
    cnt = 0
    1.upto(9) do |j|
        jcnt = cards[j]
        next if jcnt == 0
        next if j == i && jcnt == 1
        aoki_point = calc_point(aoki, j)
        if taka_point > aoki_point
            if i == j
                cnt += jcnt - 1 if jcnt > 0
            else
                cnt += jcnt
            end
        end
    end
    win_count += icnt * cnt
    warn "i:#{i} icnt:#{icnt} cnt:#{cnt} win_count:#{win_count}"
end
warn "cards_count:#{cards_count}"

puts win_count.to_f / (cards_count * (cards_count - 1))