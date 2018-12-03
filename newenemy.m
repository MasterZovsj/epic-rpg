classdef newenemy < character
    %Subclass for creating an enemy.
    
    properties
        Type
    end
    
    methods
        function e = newenemy(type,weapon,str,spd,luck,health,level)
            e@character(weapon,str,spd,luck,health,level);
            e.Type = type;
        end
    end
end