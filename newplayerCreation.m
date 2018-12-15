function newPlayer = newplayerCreation()
    % A function to start player creation on a new playable character.
    
    startLocation = [5,5];

    classOptions = {'Nurse' 'Construction Worker' 'Cook' 'Gambler'};
    weaponOptions = {'2x4 Board' 'Corroded Pipe' 'Clay Brick' 'Splintered Shovel'};
    
    j = randi(numel(weaponOptions));
    
    m = msgbox({'You have woken up in a cold,dark room with cinder block walls covered in';
                'years and years of mildew and vacancy. The only light is emitted by one';
                'distant amber light bulb covered by a broken glass globe filled with the';
                'corpses of moths and flys. The paint on the walls has begun to peel from';
                'years of neglect. The sound of old creeky hardwood flooring slats can be';
                'heard from just above. The room is windowless, the only exit is a';
                'windowless steel door.'});
    uiwait(m);
    class = listdlg('PromptString','Select your occupation',...
                        'SelectionMode','single',...
                        'ListString',classOptions);
    class = string(classOptions(class));
    m = msgbox({'The scene is unfamiliar as yesterday you were working as a';
                class+' with a family.';
                'You have arrived in this room through a wormhole. The room';
                'has a variety of building materieral that could be of use to';
                'defend yourself 2x4 boards,old corroded galvanized pipe, red';
                'clay bricks, and a splintered wood handled shovel.'});
    uiwait(m);
    weapon = listdlg('PromptString','Select a weapon',...
                        'SelectionMode','single',...
                        'ListString',weaponOptions);
    weapon = string(weaponOptions(weapon));
    m = msgbox({'You are all alone in this dark room clueless of what awaits on the other';
                    'side of the windowless steel door. You have no friends, no family and';
                    'nobody to call for help. The only way out of this nightmare is through';
                    'the door.'});
    uiwait(m);
    name = inputdlg('What is your name?');
    name = string(name(1));

    switch(class)
        case classOptions(1) %Nurse
            str = 6;
            def = 5;
            spd = 8;
            luck = 5;
            health = 40;
        case classOptions(2) %Construction Worker
            str = 8;
            def = 6;
            spd = 4;
            luck = 5;
            health = 45;
        case classOptions(3) % Cook
            str = 7;
            def = 8;
            spd = 7;
            luck = 4;
            health = 50;
        case classOptions(4) % Gambler
            str = 6;
            def = 4;
            spd = 6;
            luck = 8;
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
    
    newPlayer = newplayer(name,class,weapon,str,def,spd,luck,health,startLocation);
end