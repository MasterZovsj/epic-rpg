function [newPlayer] = newplayerCreation()
    % A function to start player creation on a new playable character.

    classOptions = {'Nurse' 'Construction Worker' 'Cook' 'Gambler'};
    weaponOptions = {'2x4 Board' 'Corroded Pipe' 'Clay Brick' 'Splintered Shovel'};
    
    j = randi(numel(weaponOptions));
    
    m = msgbox({'You have woken up in a cold,dark room with cinder block walls covered in years and years of mildew and vacancy.';
                    'The only light is emitted by one distant amber light bulb covered by a broken glass globe filled with the corpses of moths and flys.';
                    'The paint on the walls has begun to peel from years of neglect. The sound of old creeky hardwood flooring slats can be heard';
                    'from just above. The room is windowless, the only exit is a windowless steel door.'});
    uiwait(m);
    class = listdlg('PromptString','Select your occupation',...
                        'SelectionMode','single',...
                        'ListString',classOptions);
    class = string(classOptions(class));
    weapon = listdlg('PromptString','Select a weapon',...
                        'SelectionMode','single',...
                        'ListString',weaponOptions);
    weapon = string(weaponOptions(weapon));
    
    name = inputdlg('What is your name?');
    name = string(name(1));

    switch(class)
        case classOptions(1) %Nurse
            str = 2;
            def = 2;
            spd = 5;
            luck = 2;
            health = 40;
        case classOptions(2) %Construction Worker
            str = 5;
            def = 3;
            spd = 1;
            luck = 2;
            health = 45;
        case classOptions(3) % Cook
            str = 3;
            def = 4;
            spd = 3;
            luck = 1;
            health = 50;
        case classOptions(4) % Gambler
            str = 2;
            def = 1;
            spd = 3;
            luck = 5;
            health = 40;
    end
    
    switch(weapon)
        case weaponOptions(1) %2x4 Board
            str = str+2;
            def = def+3;
            spd = spd+1;
        case weaponOptions(2) % Corroded Pipe
            str = str+2;
            def = def+1;
            spd = spd+3;
        case weaponOptions(3) % Clay Brick
            str = str+3;
            def = def+1;
            spd = spd+2;
        case weaponOptions(4) % Splintered Shovel
            str = str+2;
            def = def+2;
            spd = spd+2;
    end
    
    newPlayer = newplayer(name,class,weapon,str,def,spd,luck,health);
end