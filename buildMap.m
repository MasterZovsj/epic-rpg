%% buildMap.m function
% version 2.4
function [map] = buildMap()
%%
%BUILDMAP v2.0 Creates the base map and rooms
%   Detailed explanation goes here
%#ok<*AGROW> 
%#ok<*AND2>
%% Define variables
%define the total map reigon
mapColumns = 120;
mapRows = 45;
room_num=100; %determines number of rooms
% % % % pastDirections=zeros(1,3);%used to keep track of hallway generation
%% Define chars
HALLWAY_CHAR=' ';
ROOMWALL_CHAR=' ';
MOVEABLE_CHAR=' ';
MASTERMAP_SIDE_CHAR='|';
MASTERMAP_TOP_CHAR='-';
MASTERMAP_BOTTOM_CHAR='*';
MASTERMAP_IMPASSABLE_CHAR='#';
EVENT_CHAR='!';

locations=zeros([room_num,4]); %preallocates matrix to store locations of rooms
%% Build the master map
for jj=1:mapColumns
    for ii=1:mapRows
        if ii==1
            map(ii,jj)=MASTERMAP_BOTTOM_CHAR; %used on the upper border
        elseif ii==mapRows
            map(ii,jj)=MASTERMAP_TOP_CHAR; %used on lower border
        elseif jj==1
            map(ii,jj)=MASTERMAP_SIDE_CHAR; %used on left border
        elseif jj==mapColumns
            map(ii,jj)=MASTERMAP_SIDE_CHAR; %used on right border
        else
            map(ii,jj)=MASTERMAP_IMPASSABLE_CHAR; %used everywhere else
        end
    end
end
%% Build some random hallways on the map
for jj=1:20
    startMazeColumns = randi([2,mapColumns-2]); % pick a random starting point
    startMazeRows = randi([2,mapRows-2]);       % pick a random starting point
    map(startMazeRows:mapRows-2,startMazeColumns)=HALLWAY_CHAR;
    map(startMazeRows,startMazeColumns:mapColumns-2)=HALLWAY_CHAR;
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
                room(jj,ii)=ROOMWALL_CHAR; %used on the upper border
            elseif ii==roomColumns
                room(jj,ii)=ROOMWALL_CHAR; %used on lower border
            elseif jj==1
                room(jj,ii)=ROOMWALL_CHAR; %used on left border
            elseif jj==roomRows
                room(jj,ii)=ROOMWALL_CHAR; %used on right border
            else
                room(jj,ii)=MOVEABLE_CHAR; %used everywhere else
            end
        end
    end
%%% Add three places for treasure/monster
for oo=1:randi([0,4])
    room(randi([2,roomRows-1]),randi([2,roomColumns-1]))=EVENT_CHAR;
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
    %% Define all variables for room placement
    %variables to determine the starting and ending posistions of the room
    startColumn = randi([2,mapColumns-roomColumn]);
    startRow = randi([2,mapRows-roomRow]);
    lastRow=startRow+roomRow-1;
    lastColumn=startColumn+roomColumn-1;
    %variables used in the logic when determining if the room will fit
    overlaps=0;
    abort=false;
    
    %% Logic block to test location of room versus other rooms
    if ii~=1
        % this really ugly block of logic checks to see if any of the
        % corners of the rooms we are going to place are inside of any
        % other room on our list. It stores each possible collision as a
        % single value in a column vector (i.e. 100x1 where the first
        % number is determined by the number of rooms generated).
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
    %after we have a list of all the collisions, run through that list
    %checking each one. Once we find a collusion, stop searching and set
    %abort to true.
    for mm=1:numel(overlaps)
        if overlaps(mm)==true
            abort=true;
            break;
        end
    end
    %If we do fine a collusion, abort will be true. When about is true we
    %simply move on to the next room in the list. If abort is false, we can
    %safely store and place this room before moving on to the next room.
    if abort==true
        continue;
    else
            %save rooms location
            locations(ii,:)=[startRow,lastRow,startColumn,lastColumn];
            %No need to check if the room fits in the master room, the 
            %selection of startRow and startColumn take into account the 
            %size of the room during selection
            
            %paste the room into the map!
            map(startRow:lastRow,startColumn:lastColumn)=rooms{ii};
    end
    for nn=2:mapColumns-1
        for pp=2:mapRows-1
        map(pp,nn)=combineOverlap(map(pp-1,nn),map(pp+1,nn),map(pp,nn+1),map(pp,nn-1),map(pp,nn));
        end
    end
end
%% Build the maze HIGHLY IMPORTANT FOR LATER MAZE GENERATION
% % % % startMazeColumns = randi(mapColumns); % pick a random starting point
% % % % startMazeRows = randi(mapRows);       % pick a random starting point
% % % % % make sure its not in a room
% % % % while map(startMazeRows,startMazeColumns) ~= ":"
% % % %     startMazeColumns = randi(mapColumns);
% % % %     startMazeRows = randi(mapRows);
% % % % end
% % % % map(startMazeRows,startMazeColumns) = '+'; %set the inital point to a hallway
% % % % cellList(1) = {[startMazeRows,startMazeColumns]}; %save the first cell of hallway
% % % % while isempty(cellList) == false %change this to go until all cells are filled - DONE
% % % %     pickCell=randi(numel(cellList));
% % % %     getCell=cellList{end};%pickCell};
% % % %     newColumn=getCell(2);
% % % %     newRow=getCell(1);
% % % %     direction = randi([1,4]);
% % % %     
% % % %     if (map(newRow+1,newColumn)=='+') + (map(newRow-1,newColumn)=='+') +...
% % % %             (map(newRow,newColumn-1)=='+') + (map(newRow,newColumn+1)=='+') >= 2
% % % %             
% % % %         cellList(pickCell)=[];
% % % %         
% % % %     end
% % % %     % Check to prevent choosing the opposite direction from last choice
% % % %     while pastDirections(1)==1&&direction==2||...   if up, no down
% % % %             pastDirections(1)==2&&direction==1||... if down, no up
% % % %             pastDirections(1)==3&&direction==4||... if left, no right
% % % %             pastDirections(1)==4&&direction==3%     if right, no left
% % % %     direction = randi([1,4]);
% % % %     end
% % % %     switch(direction)
% % % %         case 1 %up or decrease row
% % % %             if newRow-1<2
% % % %                 continue
% % % %             elseif map(newRow-1,newColumn)=='#'||map(newRow-1,newColumn)=='+'||map(newRow-1,newColumn)=='D'
% % % %                 continue
% % % %             else
% % % %             newRow=newRow-1;
% % % %             end
% % % %         case 2%down or increase row
% % % %             if newRow+1>mapRows-1
% % % %                 continue
% % % %             elseif map(newRow+1,newColumn)=='#'||map(newRow+1,newColumn)=='+'||map(newRow+1,newColumn)=='D'
% % % %                 continue
% % % %             else
% % % %             newRow=newRow+1;
% % % %             end
% % % %         case 3%left or decrease column
% % % %             if newColumn-1<2
% % % %                 continue
% % % %             elseif map(newRow,newColumn-1)=='#'||map(newRow,newColumn-1)=='+'
% % % %                 continue
% % % %             else
% % % %             newColumn=newColumn-1;
% % % %             end
% % % %         case 4%right or increase column
% % % %             if newColumn+1>mapColumns-1
% % % %                 continue
% % % %             elseif map(newRow,newColumn+1)=='#'||map(newRow,newColumn+1)=='+'
% % % %                 continue
% % % %             else
% % % %             newColumn=newColumn+1;
% % % %             end
% % % %     end
% % % %     map(newRow,newColumn)='+';
% % % %     cellList(end+1) = {[newRow,newColumn]};
% % % %     disp(map)
% % % %     %save the direction and delete the direction from three moves ago
% % % %     %this is so we can constantly get the direction from 2 movies ago
% % % %     pastDirections(end+1)=direction;
% % % %     pastDirections(1)=[];
% % % % 
% % % % end
%% display the map
%may change this to simply output the map so I can use
%it later.
function [me] = combineOverlap(up,down,right,left,me)
    if me == ROOMWALL_CHAR && ((up==MOVEABLE_CHAR&&down==MOVEABLE_CHAR)||(right==MOVEABLE_CHAR&&left==MOVEABLE_CHAR))
        me=MOVEABLE_CHAR;  

    end
end
end



        