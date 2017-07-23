Dir.glob('./lib/**/*.rb').each{|file| require file}

games = File.open('./data/poker.txt').map do |line|
  Poker.new(line).declare_winner
end

total = 0
games.each{|player, message| total += 1 if player == 1 }

puts "Player 1 won a total of #{total} games"

games.select{|player, message| p message if player == 0}
