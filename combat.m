function [player,enemy] = combat(player,enemy)
% This function takes two characters as input, makes them fight until one
% of them dies, and then returns both players with updated health.
    if player.getSpd() >= enemy.getSpd() % Player goes first.
        attack = player;
        defend = enemy;
    else % Enemy goes first.
        attack = enemy;
        defend = payer;
    end
    while attack.isAlive() && defend.isAlive() % While both characters are alive, this contines to loop (Fight to the death)
        damage = attack.getStr() - defend.getDef(); % Damage is attacker's strength minus defender's defense
        if damage < 0
            damage = 0;
        end
        defend = defend.takeDamage(damage); % Deals damage to the defending player
        fprintf('%s dealt %i damage to %s\n',attack.getName(),damage,defend.getName());
        fprintf('%s has %i health left.\n',attack.getName(),attack.getHealth());
        fprintf('%s has %i health left.\n',defend.getName(),defend.getHealth());
        temp = attack;
        attack = defend;
        defend = temp;
    end
    if length(class(attack)) == length(class(player)) % Determines whether or not the player is the attacker or defender
        if class(attack) == class(player)
            player = attack;
            enemy = defend;
        end
    else
        player = defend;
        enemy = attack;
    end
end