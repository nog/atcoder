H, W = gets.split.map(&:to_i)
S = []
H.times do
    S.push gets.chomp.split('')
end

res = Array.new(H){ Array.new W }
snuke = ["s", "n", "u", "k", "e"]

t = 1
targets = [[0,0]]
D = [[1,0],[0,1],[-1,0],[0,-1]]
res[0][0] = 0
if S[0][0] != 's'
    puts 'No'
    exit
end

while(!res[H-1][W-1] && targets.size > 0) do
    ntargets = []
    targets.each do |h,w|
        D.each do |dh, dw|
            nh, nw = h+dh, w+dw
            next if nh < 0 || nh >= H || nw < 0 || nw >= W
            next if res[nh][nw]
            next if S[nh][nw] != snuke[t%5]
            res[nh][nw] = t
            ntargets.push([nh, nw])
        end
    end
    targets = ntargets
    t  += 1
end

if res[H-1][W-1]
    puts 'Yes'
else
    puts 'No'
end