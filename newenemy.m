classdef newenemy < character
    %Subclass for creating an enemy.
    
    properties
        Type
    end
    
    methods
        function e = newenemy(type,weapon,str,def,spd,health,level,location) % Constructor for an enemy.
            e@character(weapon,str,def,spd,health,level,location); % Calls parent class (character) constructor.
            if nargin == 0 % Checks for any null arguments.
                error('Null argument in enemy constructor.')
            elseif isstring(type) == false % Checks to make sure that type is a string.
                error('Type needs to be a string.')
            else % Assigns calues.
                e.Type = type;
            end
        end
    %---------------------------------------------------------------------------------------------------------------%
        function name = getName(enemy) % Returns the enemy name.
            name = enemy.Type;
        end
    end
end