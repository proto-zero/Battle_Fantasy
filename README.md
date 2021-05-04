# Battle Fantasy

## How To Run The Program

Run the program through start.rb, which will call on the class contained in combat.rb

## Files

combat.rb                       - A turn-based battle system accessed through start.rb

start.rb                          - The world map for an RPG style game

## Instructions
## World Map

On the map screen, the Player appears as the X icon. The Player can move up/left/down/right using the W/A/S/D keys.

The Enemy is the @ icon. After every Player move the Enemy will also randomly move.

Chase the enemy, and when you finally catch them, enter the Combat Menu.

## Combat Menu

The combat menu screen is divided into a few pieces. At the top is your health (Player HP) and the Enemy health (Enemy HP). The Enemy HP is random, allowing for some fights to be much more challenging than others.

The Player Actions are outlined next. (A)ttack - (D)efend - (M)agic - (R)un

Once an Action is chosen the Display is created. First, the chosen Action will display, followed by the result of that Action. For example, when you Attack you can Hit or Miss. Next a description of the result is created, detailing what damage or status effect the Enemy has received.

After the Player performs an Action the Enemy will attack. The Enemy Display appears to the right of the Player Display.

The Player and Enemy HP will update as damage is received.

## Attack

Attack has a high chance of success, dealing a small amount of damage to the Enemy. While there is a small chance of missing entirely, there is also a chance that the attack will be a Critical Hit and deal extra damage!

## Defend

When you successfully Defend, the Enemy deals less damage for that turn. There is the possibility that Defend will fail, leaving you vulnerable and increasing the amount of damage the enemy can deal that turn.

## Magic

Magic opens a new Display called Choose Spell, populated with new Actions: Fire, Lightning, and Heal.

Fire burns the Enemy, dealing a small amount of damage to the Enemy for two consecutive turns.

Lightning electrifies the Enemy, making it more difficult for the Enemy to deal damage to the Player for two consecutive turns.

Both Fire and Heal appear as a status effect above the Enemy Display area while they are active. The more spells cast increase how long they remain in effect.

Heal restores a small amount of health to the Player.

## Run

Run abandons the battle and flees the area, ending the game prematurely. If you're taking too much damage and are in over your head, feel free to Run.

## Ending
The game ends when either the Player or Enemy loses all of their health, or if the Player Runs away.
