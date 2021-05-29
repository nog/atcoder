S = gets.chomp.split('')

maph = {
    '6' => '9',
    '9' => '6'
}
puts S.reverse.map{|a| maph[a] || a }.join('')