N = gets.to_i
FS = []
N.times do
    FS.push(gets.split.map(&:to_i))
end

FS.sort_by!{|a,b| - b }

maxf, maxs = FS.shift
res = 0
FS.each do |f, s|
    if maxf == f
        r =  s / 2
    else
        r = s
    end
    res = res > r ? res : r
end

puts maxs + res