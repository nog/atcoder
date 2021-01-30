H, W, K = gets.split.map(&:to_i)
MOD = 998244353

defoline = [-1] + ([nil]*W) + [-1]
field = Array.new(H+2){ defoline.dup }
field[0] = [-1] * (W+2)
field[-1] = [-1] * (W+2)


K.times do |k|
    h, w, c = gets.split
    field[h.to_i][w.to_i] = c
end

patts = Array.new(H+1){ Array.new(W+1, 0)}
field[1][0] = "R"
patts[1][0] = 1
base = 1

STR_D = "D".freeze
STR_X = "X".freeze
STR_R = "R".freeze

x = H * W - K

queue = [1,1,1]

1.upto(H) do |h|
    1.upto(W) do |w|
        pat = 0
        up = field[h-1][w]
        left = field[h][w-1]
        if up == nil 
            pat += 2 * patts[h-1][w]
        elsif up == STR_D or up == STR_X
            pat += patts[h-1][w]
        end
        if left == nil
            pat += 2 * patts[h][w-1]
        elsif left == STR_R or left == STR_X
            pat += patts[h][w-1]
        end
        if pat == 0
            base = (base * 3) % MOD
        else
            patts[h][w] = pat
        end
    end
end

if H < 100
    warn field.inspect
    warn patts.inspect
end

puts patts[H][W] * base % MOD