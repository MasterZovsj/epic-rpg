classdef newenemy < character
    %Subclass for creating an enemy.
    
    properties
        Type
    end
    
    methods
        function e = newenemy(type,weapon,str,def,spd,health,level,location) % Constructor for an enemy.
            e@character(weapon,str,def,spd,health,level,location);
            if nargin == 0
                error('Null argument in enemy constructor.')
            elseif isstring(type) == false
                error('Type needs to be a string.')
            else
                e.Type = type;
            end
        end
    end
end