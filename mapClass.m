classdef mapClass
    %MAP class where the map is stored
    %   Stores the map in its own class. Created to add more functionality
    %   to it later, such as viewable map, past maps, and more.
    
    properties
        fullMap
%         viewMap
%         lastTile
%         playerSymbol
%         playerLocation
        
    end
    
    methods
        function obj = mapClass(fullMap)
            %mapClass Construct an instance of this class
            %   Detailed explanation goes here
            if nargin > 0 %Make sure the proper amount of args were passed in
                if ischar(fullMap) 
                  obj.fullMap = fullMap;
                else
                    error('Map must be char matrix!')
                end
            end 
        end
        
% %         function outputArg = buildMap(obj,inputArg)
% %             BUILDMAP is called to build a new iteration of the game map. Player is
% %             given the option to move each time function is called.
% %             outputArg = obj.Property1 + inputArg;
% %         end
    end
end

