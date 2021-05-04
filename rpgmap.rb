require "./rpgbattle.rb"
require "colorize"

# Variables
lw = 60
size = 10
x = 4
y = 5
i = rand(0...size)
j = rand(0...size)
looping = true

## Sizes Map
grid = [];
(0...size).each do |row|
    grid[row] = []
    (0...size).each do |column|
        grid[row][column] = "* ".colorize(:red)
    end
end

# Game Loop
while looping
  system("clear")
  puts

  # Draw Map
  grid[x][y] = "X "    # Player
  grid[i][j] = "@ ".colorize(:black)    # Enemy
  (0...size).each do |row|
      print " " * (lw / 3)
      (0...size).each do |column|
          print grid[row][column]
      end
      puts
  end
  puts "Player - X    Enemy - @".center lw
  puts "WASD to move".center lw
  puts
  print "MOVE: "

  # Cleans board
  grid[x][y] = "* ".colorize(:red)
  grid[i][j] = "* ".colorize(:red)

  # Player movement
  move = gets.chomp
  if move == "w" && x != 0
    x -= 1
  elsif move == "s" && x < size - 1
    x += 1
  elsif move == "a" && y != 0
    y -= 1
  elsif move == "d" && y < size - 1
    y += 1
  end

  # Random enemy movement
  enemy_roll = rand(0..3)
  if enemy_roll == 0 && i != 0
    i -= 1
  elsif enemy_roll == 1 && i < size - 1
    i += 1
  elsif enemy_roll == 2 && j != 0
    j -= 1
  elsif enemy_roll == 3 && j < size -1
    j += 1
  end

  # Encounter / Go To Battle
  if x == i && y == j
    Battle.new
    looping = false
  end
end

# Credits
system("clear")
puts "Game Over!"
puts
puts "Created By"
puts "    Sean Lenhart"
puts "            2021"
puts
puts "                Thank you for playing!"
puts
