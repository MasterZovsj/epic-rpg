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
*     Robert Pitman-Gammon           Dec. 10 2018           Final Project *
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
currentLocation = [];
%% MAIN CODE
thisPlayer=newplayerCreation();
thisMap=mapClass(buildMap());
disp(thisMap.fullMap)
while thisPlayer.Health >= 0
    currentLocation=movePlayer(currentLocation,thisMap);
end
%% END GAME
fprintf('YOU DUN DIED SON\n')
% build an epic credits scence by using the timer function