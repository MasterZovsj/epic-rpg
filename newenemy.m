classdef newenemy < character
    %Subclass for creating an enemy.
    
    properties
        Type
%         ID
    end
    
    methods
        function e = newenemy(type,weapon,str,def,spd,health,level,location,ID) % Constructor for an enemy.
            e@character(weapon,str,def,spd,health,level,location);
            if nargin == 0
                error('Null argument in enemy constructor.')
            elseif isstring(type) == false
                error('Type needs to be a string.')
            else
                e.Type = type;
%                 e.Type = ID;
            end
        end
    %---------------------------------------------------------------------------------------------------------------%
        function name = getName(enemy) % Returns the enemy name.
            name = enemy.Type;
        end
    end
end