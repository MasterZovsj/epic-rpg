function [] = buildMap()
%% TODO
%Make hallways to rooms that do not touch
%Add Doors between rooms
%%
%BUILDMAP v2.0 Creates the base map and rooms
%   Detailed explanation goes here
%#ok<*AGROW> 
%#ok<*AND2>
%define the total map reigon
mapColumns = 120;
mapRows = 45;
room_num=100; %determines number of rooms
locations=zeros([room_num,4]); %preallocates matrix to store locations of rooms
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
for kk=1:room_num
    %randomly create the size of the room within 5x5 to 15x30
    roomRows = randi([5,10]);
    roomColumns = randi([5,15]);
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
    lastRow=startRow+roomRow-1;
    lastColumn=startColumn+roomColumn-1;
    overlaps=0;
    abort=false;
    if ii~=1
       overlaps =(startColumn>=locations(:,3)-1)&(startColumn<=locations(:,4)+1)&...
                (lastRow>=locations(:,1)-1)&(lastRow<=locations(:,2)+1)|...%checks if the bottom left corner is in another box
                (lastColumn>=locations(:,3)-1)&(lastColumn<=locations(:,4)+1)&...
                (startRow>=locations(:,1)-1)&(startRow<=locations(:,2)+1)|...%checks if the top right corner is in another box
                (startColumn>=locations(:,3)-1)&(startColumn<=locations(:,4)+1)&...
                (startRow>=locations(:,1)-1)&(startRow<=locations(:,2)+1)|...%checks if the top left corner is in another box
                (lastColumn>=locations(:,3)-1)&(lastColumn<=locations(:,4)+1)&...
                (lastRow>=locations(:,1)-1)&(lastRow<=locations(:,2)+1);%checks if the bottom right corner is in another box
                %BL or TR or TL or BR corners are in a box, return true.
    end
    for mm=1:numel(overlaps)
        if overlaps(mm)==true
            abort=true;
            break;
        end
    end
    if abort==true
        continue;
    else
            %save rooms location
            locations(ii,:)=[startRow,lastRow,startColumn,lastColumn];
            %No need to check if the room fits, the selection of startRow and
            %startColumn take into account the size of the room during selection
            map(startRow:lastRow,startColumn:lastColumn)=rooms{ii};
    end
end
disp(map)
end

