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
                                                                         
  Robert Pitman-Gammon            Dec. 10 2018              Final Project 
***************************************************************************


Written in and for MATLAB as the Final Project for ENGR 1181. 

EPIC RPG (working title) is a game where the player plays as an adventurer who must brave a text based map and defend from the horde of monsters. 

Original design inclided a single square map where each element of the map was considered an encounter.
The character stats were stored in a single vector.
Enemies generated for a single encounter, and were not persistent. 

New design includes a map that contains several rooms, each with its own monster/treasure posibilies. Player is free to move between the rooms.
The enemies should be defined and stay on the map until killed. They should persist to kill the player.
Player now has an inventory and can use items in the inventory during combat situations.
