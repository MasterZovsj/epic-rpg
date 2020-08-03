%{
***************************************************************************
*    ,------.,------. ,--. ,-----.    ,------. ,------.  ,----.           *
*    |  .---'|  .--. '|  |'  .--./    |  .--. '|  .--. ''  .-./           *
*    |  `--, |  '--' ||  ||  |        |  '--'.'|  '--' ||  | .---.        *
*    |  `---.|  | --' |  |'  '--'\    |  |\  \ |  | --' '  '--'  |        *
*    `------'`--'     `--' `-----'    `--' '--'`--'      `------'         *
*                                by                                       *
*                           Micah  Fierro                                 *
*                           Gary  Jackson                                 *
*                           Troy Plageman                                 *
*                                                                         *
*     Robert Pitman-Gammon           Dec. 15 2018           Final Project *
***************************************************************************
%}

clear
clc

%% GLOBAL VARIABLES
global START_GAME
global PLAYER_SYMBOL
global HALLWAY_CHAR
global ROOMWALL_CHAR
global MOVEABLE_CHAR
global MASTERMAP_SIDE_CHAR
global MASTERMAP_TOP_CHAR
global MASTERMAP_BOTTOM_CHAR
global MASTERMAP_IMPASSABLE_CHAR
global EVENT_CHAR
global DEPTH
%% Initialize variables

PLAYER_SYMBOL = '@';
START_GAME = true;
HALLWAY_CHAR=' ';
ROOMWALL_CHAR=' ';
MOVEABLE_CHAR=' ';
MASTERMAP_SIDE_CHAR='|';
MASTERMAP_TOP_CHAR='-';
MASTERMAP_BOTTOM_CHAR='*';
MASTERMAP_IMPASSABLE_CHAR='#';
EVENT_CHAR='!';
DEPTH = 1;
currentLocation = [];
%% MAIN CODE
thisPlayer=newplayerCreation(); % create new player object
thisMap=mapClass(buildMap()); % create new map object
disp(thisMap.fullMap) %display the initial map
while thisPlayer.Health >= 0 % so long as the player is not dead, keep going
    %give the current location of the player to the move player function
    %then output the new location as the current location
    currentLocation=movePlayer(currentLocation,thisMap); 
    %change the player location
    thisPlayer = thisPlayer.updateLocation(currentLocation);
end
%% END GAME
fprintf('YOU DUN DIED SON\n') %you lose?
% build an epic credits scence by using the timer function -- lol not today