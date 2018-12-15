# EPIC RPG                                                                                                  

***************************************************************************
    ,------.,------. ,--. ,-----.    ,------. ,------.  ,----.           
    |  .---'|  .--. '|  |'  .--./    |  .--. '|  .--. ''  .-./          
    |  `--, |  '--' ||  ||  |        |  '--'.'|  '--' ||  | .---.        
    |  `---.|  | --' |  |'  '--'\    |  |\  \ |  | --' '  '--'  |        
    `------'`--'     `--' `-----'    `--' '--'`--'      `------'   
                                       by                                       
                                   Micah Fierro                                  
                                   Gary Jackson                                  
                                   Troy Plageman

    Robert Pittman-Gammon          Dec. 10 2018            Final Project
***************************************************************************


Written in and for MATLAB as the Final Project for ENGR 1181.

EPIC RPG (working title) is a game where the player plays as an adventurer who must brave a text based map and defend from the horde of monsters.


Original design inclided a single square map where each element of the map was considered an encounter.
The character stats were stored in a single vector.
Enemies generated for a single encounter, and were not persistent.

New design includes a map that contains several rooms, each with its own monster/treasure posibilies. Player is free to move between the rooms.
The enemies should be defined and stay on the map until killed. They should persist to kill the player.
Player now has an inventory and can use items in the inventory during combat situations

TODO: <br>
&nbsp;&nbsp;+Maps<br>
&nbsp;&nbsp;&nbsp;&nbsp;-Depth for multiple maps and increasing difficulty<br>
&nbsp;&nbsp;+Player<br>
&nbsp;&nbsp;&nbsp;&nbsp;-Inventory<br>
&nbsp;&nbsp;+Enemies<br>
&nbsp;&nbsp;+Combat<br>
&nbsp;&nbsp;&nbsp;&nbsp;-When player moves into monster square initiate combat<br>
&nbsp;&nbsp;&nbsp;&nbsp;-Combat is Damage - Defense with 1/Speed chance to miss<br>
&nbsp;&nbsp;&nbsp;&nbsp;-Image pops up to graphically display combat encounter<br>
&nbsp;&nbsp;&nbsp;&nbsp;-Sound if enemy dies -- maybe depends on enemy<br>
&nbsp;&nbsp;&nbsp;&nbsp;-GAME OVER image if player dies<br>
&nbsp;&nbsp;+Main GUI<br>
&nbsp;&nbsp;&nbsp;&nbsp;-High score screen at end<br>
&nbsp;&nbsp;&nbsp;&nbsp;-Character images for class selection<br>
MORE MAYBE<br>

Inspiration:
http://www.astrolog.org/labyrnth/algrithm.htm
http://journal.stuffwithstuff.com/2014/12/21/rooms-and-mazes/
