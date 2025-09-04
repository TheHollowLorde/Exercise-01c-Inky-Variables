/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/


VAR health = 5
VAR pet_name = ""
VAR torches = 0
VAR stamina = 11
VAR mirror_shards = 0



-> memory

== memory ==
Before you stands the cavern of Orion. You wish your childhood pet was with you now. The cave might be less intimidating. What was your pet's name?

* [Charlie]  
~ pet_name = "Charlie" 
-> cave_mouth

* [Cocoa]
~ pet_name = "Cocoa"
-> cave_mouth

* [Scout]
~ pet_name = "Scout"
-> cave_mouth





== cave_mouth ==
~ stamina = stamina - 1
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.

You made it to the cave. If only {pet_name} could see you now.

You have {torches} torches.

You are currently at {stamina} stamina.

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
~ stamina = stamina - 1

You are in the east tunnel. It is very dark, you can't see anything.

{pet_name == "Cocoa": Cocoa always hated the dark. You should make some light.| }

You are currently at {stamina} stamina.

* {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
~ stamina = stamina - 1
You are in the west. It is very dark, you can't see anything.

You are currently at {stamina} stamina.

{pet_name == "Scout": Scout would love it here in the West.| }

* {torches > 0} [Light Torch] -> west_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room, but you also see a small glint in the corner of your eye.

Do you:

* {mirror_shards > 0} [Investigate?] -> lock
* [Take the coins and leave?] -> leave

== west_tunnel_lit ==
You're in a cavern made of a glass-like substance.

You are currently at {stamina} stamina.

Do you:

* [Go closer to the glass] -> spirits
* [Go back] -> cave_mouth

== spirits ==
~ stamina = stamina - 1
As you go closer, you see your reflection, and next to you is {pet_name}. 

Do you: 
* [Reach out to touch them?] -> mirror_realm
* [Retreat?] -> cave_mouth

== mirror_realm ==
As you reach out and touch them, you fall into the mirror.

Do you:

* [Try to go back?] -> trapped
* [Look around?] -> exit

== trapped ==
You try to escape and realize that you're completely trapped.

GAME OVER
->END

== exit ==
~ mirror_shards = mirror_shards + 1
You look around and manage to find an exit. You leave, and realize that you have a shard of the mirror from that place in your pocket.

You have {mirror_shards} mirror shards.

* [Go back] -> cave_mouth

== leave ==
You take the coins and leave.
-> END

== lock ==
As you investigate, you see a lock with a keyhole the exact shape of the mirror shard that you have.

Do you:

* [Insert the shard?] -> more_treasure
* [Just take the coins and leave?] -> leave

== more_treasure ==
~ mirror_shards = mirror_shards - 1 

You open the lock, and you see even more treasure than what was outside of this locked area.

* [Take everything and leave.] -> leave_better

== leave_better ==
Now that you have even more treasure than you would've had if you would have if you only took the original coins, you can leave happy.
-> END



