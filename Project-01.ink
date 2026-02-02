/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/
VAR has_sword = false 
VAR has_torch = false 
VAR strength = 5 // base strength 
VAR has_armor = false 

-> Cave_Entrance 

== Cave_Entrance ==

You are a Vagabond and you come upon a large cave that is desolate and abandoned, there is two entrances one to the East and the other to the West.



* East Entrance 
-> East_Entrance

* West Entrance 
-> West_Entrance 

== East_Entrance ==
you enter into a long corridor that is dimmly lit by one singular torch on the wall.

* Pick up torch
-> Pick_up_torch
* Continue down corridor 
-> Down_Corridor 
* Go back 
-> Cave_Entrance
-> END

== West_Entrance ==
There is short corridor with 2 rooms at the end of the hall.
* Left Room
-> Left_Room

* Right Room
-> Right_Room

* Go back
-> Cave_Entrance







== Pick_up_torch ==
~ has_torch = true 
you grab the torch
-> East_Entrance


== Down_Corridor ==
you continue down the corridor and see a glinting light at the end of the hall.
{has_torch:
you are able to see the corridor and the path ahead. Through your light you see a glint at the end of the hall.
* Go towards the glinting light 
-> Gold_Room 
- else:
You cant see anything it is too dark to see without a light
*Go back
-> East_Entrance
}


== Left_Room ==
You walk into the room and see nothing of value but a few bits of skeleton scattered throughout the room.
* Go back
->Go_back1
== Right_Room ==
A man lies on the floor dead, dressed in body armor and a shield that are scorched with fire, but still in tact.
* Pick up armor and put it on 
you put the armor on and travel to the East entrance
~ has_armor = true 
~ strength = strength +2 
the armor makes you feel much stronger
-> East_Entrance


-> East_Entrance
* go back 
-> Cave_Entrance
->END 

==Go_back1== 
-> West_Entrance

==Gold_Room==
You enter into a Room full of Gold, their are coins armor and anything else you could think of made of cold filling the room.
{not has_sword:
* Pick up golden sword
-> Pick_up_sword
}


* Explore and fill your pockets full of Gold for if you take anything you will be set for life.
-> Explore

*Grab coins and leave
->END


== Pick_up_sword ==
~has_sword = true
The sword is oddly light and you feel as if its apart of your being.
-> Gold_Room

==Explore==
*Grab coins 
-> Make_noise 
*Grab Challace 
-> no_noise 
*Grab Golden Sword
-> Pick_up_sword


==Make_noise==
You Knock the golden coins over making a loud noise and you hear a giant roar behind you, you turn around and its a giant red dragon staring at you.
* Run 
-> Run
==no_noise==
you grab the challace 
*leave
->END
*Go back
-> Explore 

==Run==
* Jump to right
    -> Die

* Jump to left
    -> survive

* Dodge
    -> Dodge
    
*Attack Dragon

 {has_sword:
->Dragon
-else:
you have no weapon to fight the dragon you die
->END 
}

== Die == 
you get burnt to a crisp
->END

==survive==
You jump out of the way 
-> Leave

==Leave==
->END

==Dodge==
You dodge out of the way 
-> Get_away

==Get_away==
you survive barely but have spoils for your troubles and you have your life.
->END

==Dragon==
You attack the dragon as he leaps forward towards you with the golden sword 
{has_sword:
{strength >= 7:
* Hard strngth strike 
    -> Kill
-else: 
you dont have anything to fight with.
->END
    * Up
        -> Kill
* Down 
    -> END
}
-else:
you dont have anything to fight the dragon with you die 
->END
}


==Miss==
you miss complealty and and the dragon burns you to a crisp
->END 


== Kill ==
You strike up and hit the dragon in the head with the sword killing him leaving all of the gold in the cave all to you.
-> Win

==Win== 
-> END 












