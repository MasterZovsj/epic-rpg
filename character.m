classdef character
    %Parent class for all playable characters in the game.
    
    properties % All characters in the game share these attributes.
        Level
        Weapon
        Str
        Def
        Spd
        Health
        Location
    end
    
    methods
        function obj = character(weapon,str,def,spd,health,level,location) % Parent class constructor for all game characters.
            if nargin == 0 % Checks for any null arguments.
                error('Null argument in Character constructor.')
            elseif isstring(weapon) == false % Checks to make sure that weapon is a string.
                error('Weapon needs to be a string.')
            elseif isscalar(str) == false % Checks to make sure that strength is a number.
                error('Strength needs to be scalar.')
            elseif isscalar(def) == false % Checks to make sure that defense is a number.
                error('Defense needs to be scalar.')
            elseif isscalar(spd) == false % Checks to make sure that speed is a number.
                error('Speed needs to be scalar.')
            elseif isscalar(health) == false % Checks to make sure that health is a number.
                error('Health needs to be scalar.')
            elseif isnumeric(location) == false || isvector(location) == false % Checks to make sure that location is an araay of numbers.
                if isnumeric(location) == false && isvector(location) == false
                    error("Location isn't an array or numeric.")
                elseif isnumeric(location) == false
                    error('Location needs to be numeric.')
                elseif isvector(location) == false
                    error('Location needs to be a vector.')
                end
            else % Assigns values.
                obj.Weapon = weapon;
                obj.Str = str;
                obj.Def = def;
                obj.Spd = spd;
                obj.Health = health;
                obj.Level = level;
                obj.Location = location;
            end
        end
    %---------------------------------------------------------------------------------------------------------------%
        function def = getDef(char) % Returns the character's defense.
            def = char.Def;
        end

        function health = getHealth(char) % Returns the character's health.
            health = char.Health;
        end

        function spd = getSpd(char) % Returns the character's speed.
            spd = char.Spd;
        end

        function str = getStr(char) % Returns the character's strength.
            str = char.Str;
        end

        function alive = isAlive(char) % Returns true if character is alive.
            if char.Health > 0
                alive = true;
            else
                alive = false;
            end
        end
        
        function char = takeDamage(char,damage) %Deals given damage to the character and returns the updated character.
            char.Health = char.Health - damage;
            if char.Health < 0
                char.Health = 0;
            end
        end

        function char = updateLocation(char,loc) % Returns the character with an updated location.
            char.Location = loc;
        end
    end
end