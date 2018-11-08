classdef player
    %CLASS player is the classes used by the player to store weapons and
    %stats in a organized manner
    %   Detailed explanation goes here
    
    properties
        Class
        Weapon
        Stats
        Health
        %Level <-- need to add
    end
    
    methods
        %Build a constructor to easily define the player in main.m
        function obj = player(class,weapon,stats,health)
            %CLASS Construct an instance of this class
            %   Detailed explanation goes here
            if nargin > 0 %Make sure the proper amount of args were passed in
                if isstring(weapon) && isstring(class) && isDataArray(stats) && isscalar(health) %Weapon and Class must be a string - Stats must be a data array
                    obj.Class = class;
                    obj.Weapon = weapon;
                    obj.Stats = stats;
                    obj.Health = health;
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

