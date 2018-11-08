%% TODO 
% 1. Add in experience and monster slaying stats
% 2. Add in player name for record keeping.
classdef player
    %CLASS player is the classes used by the player to store weapons and
    %stats in a organized manner
    %   Detailed explanation goes here
    
    properties
        Class
        Weapon
%         Stats
        Str
        Spd
        Luck
        Health
        Exp
        %Level <-- need to add
    end
    
    methods
        %Build a constructor to easily define the player in main.m
        function obj = player(class,weapon,str,spd,luck,health,exp)
            %CLASS Construct an instance of this class
            %   Takes the inputed values when called and creates an
            %   instance of the player class. 
            if nargin > 0 %Make sure the proper amount of args were passed in
                if isstring(weapon) && isstring(class) && isnumeric(str) && isnumeric(spd) && isnumeric(luck) && isnumeric(health) && isnumeric(exp) 
                    %Weapon and Class must be a string - Stats must be
                    %numeric.
                    obj.Class = class;
                    obj.Weapon = weapon;
%                     obj.Stats = stats;
                    obj.Str = str;
                    obj.Spd = spd;
                    obj.Luck = luck;
                    obj.Health = health;
                    obj.Exp = exp;
                else
                    error('You screwed up somewhere, bud. [Player class constructor]')
                end
            end
        end
        
%         function outputArg = method1(obj,inputArg)
%             %METHOD1 Summary of this method goes here
%             %   Detailed explanation goes here
%             outputArg = obj.Property1 + inputArg;
%         end
    end
end

