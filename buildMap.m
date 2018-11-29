function [map] = buildMap()
%% TODO
%Make hallways to rooms that do not touch
%Add Doors between rooms
%%
%BUILDMAP v2.0 Creates the base map and rooms
%   Detailed explanation goes here
%#ok<*AGROW> 
%define the total map reigon
mapColumns = 120;
mapRows = 45;

for jj=1:mapColumns
    for ii=1:mapRows
        if ii==1
            map(ii,jj)='-'; %used on the upper border
        elseif ii==mapRows
            map(ii,jj)='-'; %used on lower border
        elseif jj==1
            map(ii,jj)='|'; %used on left border
        elseif jj==mapColumns
            map(ii,jj)='|'; %used on right border
        else
            map(ii,jj)=' '; %used everywhere else
        end
    end
end
%% generate a room
room_num=5; %determines number of rooms
locations=zeros([room_num,4]);
for kk=1:room_num
    %randomly create the size of the room within 5x5 to 15x30
    roomRows = randi([5,15]);
    roomColumns = randi([5,30]);
    %build the walls around the edge of the room
    %fill the center with spaces
    for jj=1:roomRows
        for ii=1:roomColumns  
            if ii==1
                room(jj,ii)='#'; %used on the upper border
            elseif ii==roomColumns
                room(jj,ii)='#'; %used on lower border
            elseif jj==1
                room(jj,ii)='#'; %used on left border
            elseif jj==roomRows
                room(jj,ii)='#'; %used on right border
            else
                room(jj,ii)=' '; %used everywhere else
            end
        end
    end
    
%Save the room in a cell array
rooms(kk)={room};
%clear the room variable
clear room
end
%% Paste the rooms into the master map
for ii=1:numel(rooms)
    %get the size of current room
    [roomRow,roomColumn]=size(rooms{ii});
    %select a starting location for the room
    %make sure the selection cannot result in the room going over the
    %border of the master map
    startColumn = randi([2,mapColumns-roomColumn]);
    startRow = randi([2,mapRows-roomRow]);
    if ii~=1
        while (startColumn>locations(:,1))&(startColumn<locations(:,2))
            startColumn = randi([2,mapColumns-roomColumn]);
        end
        while (startRow>locations(:,3))&(startRow<locations(:,4))
            startRow = randi([2,mapRows-roomRow]);
        end

    end

    %define the last row and column of the room within the map
    lastRow=startRow+roomRow-1;
    lastColumn=startColumn+roomColumn-1;
    %save rooms location

    locations(ii,:)=[startColumn,lastColumn,startRow,lastRow];

%     for aa=2:1:length(locations)
%         if (locations(aa,1)>locations(aa-1,1)&&locations(aa,1)<locations(aa-1,2))
%             fprintf("yes")
%         else
%             fprintf("No")
%         end
%     end
    
    %No need to check if the room fits, the selection of startRow and
    %startColumn take into account the size of the room during selection
    map(startRow:lastRow,startColumn:lastColumn)=rooms{ii};
end
%% Build Hallways

disp(map)
end

