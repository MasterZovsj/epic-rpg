function [event] = eventGenerator(lastTile)
%eventGenerator Takes the tile the player entered and generates an encounter
%   event 1 is potion
%   event 2 is weapon
%   event 3 is combat
%   event 4 is wall

%% CONTROL VARIABLES
potion_chance = 0.9;
weapon_chance = 0.8;
combat_chance = 0.2;
% wall_chance = 0.0;
luck = 3; %player.Stats(3);
luckReducer = 10;

%% CHECK TILE
switch(lastTile)
    case 'E'
        fprintf('You''ve explored this place already...\n')
        return
    case '#'
        fprintf('You''ve never been here before...\n')
end
%% 
modL = luck/luckReducer;
eventRNG = rand;

if (eventRNG > potion_chance)
    fprintf('You found a Potion\n')
    event = 1;
elseif (eventRNG > weapon_chance)
    fprintf('You found a Weapon\n')
    event = 2;
elseif (eventRNG > combat_chance)
    fprintf('You found a Combat\n')
    event = 3;
else
    fprintf('You found a Wall\n')
    event = 4;
end

end

