classdef character
    %Parent class for all playable characters in the game
    
    properties
        Weapon
        Str
        Spd
        Luck
        Health
        Level
        Inventory
    end
    
    methods
        function obj = character(weapon,str,spd,luck,health,level)
            if nargin>0
                if isstring(weapon) && isscalar(str) && isscalar(spd) && isscalar(luck) && isscalar(health) && isscalar(level)
                    obj.Weapon = weapon;
                    obj.Str = str;
                    obj.Spd = spd;
                    obj.Luck = luck;
                    obj.Health = health;
                    obj.Level = level;
                    obj.Inventory = [];
                elseif isstring(weapon) == false
                    error('Weapon needs to be a string.')
                elseif isscalar(str) == false
                    error('Strength needs to be scalar.')
                elseif isscalar(spd) == false
                    error('Speed needs to be scalar.')
                elseif isscalar(luck) == false
                    error('Luck needs to be scalar.')
                elseif isscalar(health) == false
                    error('Health needs to be scalar.')
                end
            else
                error('Null argument in Character constructor.')
            end
        end
    end
end