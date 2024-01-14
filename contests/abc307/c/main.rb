HA, WA = gets.split.map(&:to_i)
A = Array.new
HA.times do
  A.push(gets.chomp.split(''))
end
HB, WB = gets.split.map(&:to_i)
B = Array.new
HB.times do
  B.push(gets.chomp.split(''))
end
HX, WX = gets.split.map(&:to_i)
X = Array.new
HX.times do
  X.push(gets.chomp.split(''))
end

while A[0].all?('.')
  A.shift
  HA -= 1
end
while A[-1].all?('.')
  A.pop
  HA -= 1
end
A =  A.transpose
while A[0].all?('.') 
  A.shift
  WA -= 1
end
while A[-1].all?('.')
  A.pop
  WA -= 1
end
A = A.transpose

while B[0].all?('.')
  B.shift
  HB -= 1
end
while B[-1].all?('.')
  B.pop
  HB -= 1
end
B = B.transpose
while B[0].all?('.') 
  B.shift
  WB -= 1
end
while B[-1].all?('.')
  B.pop
  WB -= 1
end
B = B.transpose

if HA > HX || WA > WX || HB > HX || WB > WX
  # warn "HA:#{HA} WA:#{WA} HB:#{HB} WB:#{WB} HX:#{HX} WX:#{WX}"
  # warn "#{A.inspect}"
  puts 'No'
  exit
end

# warn "HX:#{HX} WX:#{WX} HA:#{HA} WA:#{WA} HB:#{HB} WB:#{WB}"
# warn "X"
# warn X.inspect
# warn "A"
# warn A.inspect
# warn "B"
# warn B.inspect

(0).upto(HX - HA) do |dha|
  (0).upto(WX - WA) do |dwa|
    (0).upto(HX - HB) do |dhb|
      (0).upto(WX - WB) do |dwb|
        res = true
        HX.times do |h|
          WX.times do |w|
            x = X[h][w]
            l = []
            if (0...HA).include?(h - dha) && (0...WA).include?(w - dwa)
              l.push(A[h-dha][w-dwa])
            end
            if (0...HB).include?(h - dhb) && (0...WB).include?(w - dwb)
              l.push(B[h-dhb][w-dwb])
            end
            if x == '.'
              unless l.all?('.')
                # warn "x:#{x} l:#{l.inspect} dha:#{dha} dwa:#{dwa} dhb:#{dhb} dwb:#{dwb} h:#{h} w:#{w}"
                res = false
                break
              end
            elsif x == '#'
              unless l.include?('#')
                # warn "x:#{x} l:#{l.inspect} dha:#{dha} dwa:#{dwa} dhb:#{dhb} dwb:#{dwb} h:#{h} w:#{w}"
                res = false
                break
              end
            else
              raise
            end
          end
          unless res
            break
          end
        end
        if res
          puts 'Yes'
          exit
        end
      end
    end
  end
end

puts 'No'