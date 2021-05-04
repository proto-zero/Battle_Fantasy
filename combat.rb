class Battle

  def initialize
    # Player Variables
    @health = 30
    @player_hp = @health
    @choice = ""
    @outcome = ""
    @result = ""
    @roll = 0
    @defense = 0
    @spells = ["Fire", "Lightning", "Heal"]
    @burn = 0
    @elec = 0

    # Enemy Variables
    @enemy_hp = rand(10..50)
    @enemy_status1 = ""
    @enemy_status2 = ""
    @enemy_choice = ""
    @enemy_outcome = ""
    @enemy_result = ""
    @status = "Encountered Enemy!"
    game
  end

  def attack
    @choice = "Attack"
    @roll = rand(0..99)
    if @roll < 18
      @outcome = "CRITICAL HIT"
      damage = rand(6..10)
      @enemy_hp -= damage
      @result = "Enemy takes #{damage} damage"
    elsif @roll < 70
      @outcome = "HIT "
      damage = rand(1..5)
      @enemy_hp -= damage
      @result = "Enemy takes #{damage} damage"
    else
      @outcome = "MISS"
      @result = "Enemy takes 0 damage"
    end
  end

  def defend
    @choice = "Defend"
    roll = rand(0..9)
    if roll < 8
      @outcome = "A firm defense"
      @defense = rand(2..4)
      @result = "Defend against #{@defense} damage"
    else
      @outcome = "STUMBLE"
      @defense = -5
      @result = "Vulnderable to extra damage"
    end
  end

  def magic
    puts "Choose Spell:"
    i = 1
    @spells.each do |x|
      puts "#{i}: #{x}"
      i += 1
    end
    cast = gets.chomp.to_i
    if cast == 1
      @choice = "Cast"
      @outcome = "FIRE"
      @result = "Enemy is burning"
      @burn += 2
    elsif cast == 2
      @choice = "Cast"
      @outcome = "LIGHTNING"
      @result = "Enemy is electrified"
      @elec += 2
    elsif cast == 3
      @choice = "Cast"
      @outcome = "Heal"
      heal = rand(5..10)
      @result = "Player heals #{heal} damage"
      @player_hp += heal
      if @player_hp > @health
        @player_hp = @health
      end
    end
  end

  def enemyTurn

    # Status effects from player magic
    if @elec > 0
      @enemy_status1 = "(Enemy is electrified)"
      @defense += 2
      @elec -= 1
    else
      @enemy_status1 = ""
    end
    if @burn > 0
      @enemy_status2 = "(Enemy is burning)"
      @enemy_hp -= 2
      @burn -= 1
    else
      @enemy_status2 = ""
    end

    #Enemy attack
    @enemy_choice = "Enemy Attacks"
    enemy_roll = rand(0..9)
    if enemy_roll < 5
      @enemy_outcome = "HIT"
      player_damage = rand(1..5) - @defense
      if player_damage < 0
        player_damage = 0
      end
      @player_hp -= player_damage
      @enemy_result = "Player takes #{player_damage} damage"
    else
      @enemy_outcome = "MISS"
      @enemy_result = "Player takes 0 damage"
    end
  end

  # Game Screen Layout
  def screen
    system("clear")
    puts @status
    puts "Player HP #{@player_hp}      Enemy Hp #{@enemy_hp}"
    puts "(A)ttack - (D)efend - (M)agic - (R)un"
    puts "                            #{@enemy_status1}#{@enemy_status2}"
    puts "#{@choice}                        #{@enemy_choice}"
    puts "#{@outcome}                          #{@enemy_outcome}"
    puts "#{@result}         #{@enemy_result}"
    puts
    print "ACTION: "
  end

  # Game Logic
  def game
    @looping = true
    while @looping
      screen
      @defense = 0
      turn = gets.chomp.downcase
      if turn == "a"
        attack
      elsif turn == "d"
        defend
      elsif turn == "m"
        magic
      elsif turn == "r"
        @status = "             You fled\nGame Over"
        break
      end
      if @enemy_hp <= 0
        @status = "             Enemy Defeated!"
        break
      end
      enemyTurn
      if @player_hp <= 0
        @status = "             Player Defeated\nGame Over"
        @looping = false
      end
    end

    # Finish Screen
    screen
    sleep 2.5
  end
end
