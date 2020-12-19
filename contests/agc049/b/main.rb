N = gets.to_i
S = gets.chomp.split('').map(&:to_i)
T = gets.chomp.split('').map(&:to_i)

Scnt = S.count(1)
Tcnt = T.count(1)

if Tcnt > Scnt
    puts -1
    exit
end

diff = Scnt - Tcnt
if diff.odd?
    puts -1
    exit
end
