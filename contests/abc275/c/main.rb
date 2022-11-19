S = Array.new(9)
9.times do |i|
  S[i] = gets.split('')
end
result = 0
8.times do |h|
  sh = S[h]
  8.times do |w|
    if sh[w] == '#'
      h2 = h
      w2 = w + 1
      while(h2 < 9) do
        if S[h2][w2] == '#'
          # warn "h:#{h} w:#{w} h2:#{h2} w2:#{w2}"
          dw = w2 - w
          dh = h2 - h

          h3 = h + dw + dh
          w3 = w + dw - dh
          if h3 >= 0 && h3 < 9 && w3 >= 0 && w3 < 9
            if S[h3][w3] == '#'
              # warn "h3:#{h3} w3:#{w3}"
              h4 = h + dw
              w4 = w - dh
              # warn "h4:#{h4} w4:#{w4}"
              if h4 >= 0 && h4 < 9 && w4 >= 0 && w4 < 9
                if S[h4][w4] == '#'
                  # warn "h:#{h} w:#{w} h2:#{h2} w2:#{w2} h3:#{h3} w3:#{w3} h4:#{h4} w4:#{w4}"
                  result += 1
                end
              end
            end
          end
        end
        w2 += 1
        if w2 >= 9
          h2 += 1
          w2 = w + 1 
        end
      end
    end
  end
end

puts result