N = gets.to_i

C = Array.new N
N.times do |i|
    C[i] = gets.split.map(&:to_i)
end

adiff = Array.new N-1
adiffmin = 0
bdiff = Array.new N-1
bdiffmin = 0

(N-1).times do |i|
    ad = C[i+1][0] - C[0][0]
    adiff[i] = ad
    adiffmin = ad if ad < adiffmin
    bd = C[0][i+1] - C[0][0]
    bdiff[i] = bd
    bdiffmin = bd if bd < bdiffmin
end

if - adiffmin - bdiffmin > C[0][0]
    puts 'No'
    exit
end

if adiffmin < bdiffmin
    bdiffmin = -(C[0][0] + adiffmin)
else
    adiffmin = -(C[0][0] + bdiffmin)
end

alist = [-adiffmin]
blist = [-bdiffmin]

(N-1).times do |i|
    alist.push(adiff[i] - adiffmin)
    blist.push(bdiff[i] - bdiffmin)
end
warn alist.inspect
warn blist.inspect
N.times do |i|
    N.times do |j|
        unless C[i][j]  == alist[i] + blist[j]
            puts 'No'
            exit
        end
    end
end

puts 'Yes'
puts alist.join(' ')
puts blist.join(' ')