XA, YA, XB, YB, XC, YC = gets.split.map(&:to_i)

up = (YB+1-YA).abs
if XB != XA
    up += (XB-XA).abs
elsif YA > YB
    up += YA - YB
else
    up += YB - YA + 2
end