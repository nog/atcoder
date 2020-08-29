H, W, M = gets.split.map(&:to_i)
hcounts = Array.new H+1, 0
wcounts = Array.new W+1, 0

B = Array.new M
M.times do |i|
    h, w = gets.split.map(&:to_i)
    B[i] = [h,w]
    hcounts[h] += 1
    wcounts[w] += 1
end

hmax = hcounts.max
wmax = wcounts.max
hmaxcount = hcounts.count hmax 
wmaxcount = wcounts.count wmax

count = B.count do |h,w|
    hcounts[h] == hmax && wcounts[w] == wmax
end

if count == hmaxcount * wmaxcount
    puts hmax + wmax - 1
else
    puts hmax + wmax
end