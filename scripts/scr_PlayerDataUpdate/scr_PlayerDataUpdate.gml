/// @description scr_PlayerDataUpdate(character_index);
/// @param character_index

switch (argument[0]) {
    case PLAYER_EVILFLAME:
        global.lore          = 
        "Is it a bird? Is it a dolphin?" +
        "\nNegative, this fearless flying machine" +
        "\nis a worldwide known demon slayer." +
        "\nIt conquered countless challenges" +
        "\nand resisted the most ruthless of" +
        "\ntortures, some involving being shredded" +
        "\nto pieces, other long time exposure" +
        "\nto ultraviolet rays. It is said" +
        "\nto fall into unstoppable fury under" +
        "\nthe light of the twilight moon.";
        global.hp            = 720;
        global.bdmg          = 62;
        global.bdef          = 40;
        global.bpen          = 0;
        global.bkb           = 100;
        global.bkbres        = 40;
        global.acc           = 0.8;
        global.counteracc    = 0.4;
        global.spd           = 9;
        global.invtime       = 60;
        global.foctime       = 210;
        global.pdmg          = 7;
        global.pdef          = 35;
        global.ppen          = 0;
        global.pkb           = 25;
        global.pkbres        = 30;
        global.pspd          = 35;
        global.sacc          = 0.98;
        global.sspd          = 23;
        global.fmin          = 2;
        global.fmax          = 3;
        global.fdmg          = 5;
        global.fpen          = 0;
        global.fkb           = 0;
        global.cname         = "BLAZING FIREBALL";
        global.cdesc         = 
        "Spits a giant fireball that homes" +
        "\ninto nearby enemies and explodes" +
        "\ninto a ring of deadly sparks.";
        global.cdmg          = 115;
        global.cpen          = 50;
        global.ckb           = 200;
        global.ctime         = 90;
        global.ccooldown     = 720;
        if (!TWILIGHT_FURY) {
            global.uname     = "DUAL CLONE";
            global.utype     = "BUFF";
            global.ucooldown = 600;
            global.udesc     = 
            "Divides HP in half and summons" +
            "\nan upside-down copy of itself" +
            "\nthat mirrors every action of" +
            "\nthe original.";
        } else {
            global.uname     = "TWILIGHT FURY";
            global.utype     = "SECRET BUFF";
            global.ucooldown = 1200;
            global.udesc     = 
            "Borrows the power of stars...";
        }
    break;
    case PLAYER_EMERALD:
        global.lore          = 
        "Legends speak of a young pony disciple" +
        "\nso powerful, that its mere birth" +
        "\ncaused irreversible changes to" +
        "\nthe very fabric of the Universe." +
        "\nAdept at using deadly water spells," +
        "\nno one has ever clashed with this" +
        "\nbeast and come back unscathed.";
        global.hp            = 525;
        global.bdmg          = 38;
        global.bdef          = 24;
        global.bpen          = 0;
        global.bkb           = 50;
        global.bkbres        = 10;
        global.acc           = 1.2;
        global.counteracc    = 0.6;
        global.spd           = 10;
        global.invtime       = 70;
        global.foctime       = 270;
        global.pdmg          = 5;
        global.pdef          = 22;
        global.ppen          = 0;
        global.pkb           = 15;
        global.pkbres        = 10;
        global.pspd          = 30;
        global.sacc          = 0.95;
        global.sspd          = 17;
        global.fmin          = 2;
        global.fmax          = 5;
        global.fdmg          = 3;
        global.fpen          = 35;
        global.fkb           = 20;
        global.cname         = "ROYAL LASER";
        global.cdesc         = 
        "Releases a piercing laser beam" +
        "\nthat deals constant damage to" +
        "\nany enemy it touches.";
        global.cdmg          = 1;
        global.cpen          = 100;
        global.ckb           = 0;
        global.ctime         = 120;
        global.ccooldown     = 1200;
        global.uname         = "CURRENT CRUSH";
        global.utype         = "ATTACK";
        global.ucooldown     = 3600;
        global.udesc         = 
        "Creates a web of water streams" +
        "\nthat suck in enemies and most" +
        "\nprojectiles for 15 seconds," +
        "\nthen crushes everything trapped" +
        "\ninside with extreme pressure." +
        "\nTemporarily weakens the caster" +
        "\nafterwards due to exhaustion.";
    break;
    case PLAYER_DER_SCOOTOMIK:
        global.lore          = 
        "The most powerful scooter in the universe." +
        "\nIt has been infused with ancient metals," +
        "\nmaking it extremely durable in exchange" +
        "\nfor sporadic malfunctioning of its charge." +
        "\nCapable of achieving ludicrous speeds," +
        "\nwhich allow it to travel around the Earth" +
        "\nto attack its enemies from behind.";
        global.hp            = 1080;
        global.bdmg          = 86;
        global.bdef          = 72;
        global.bpen          = 0;
        global.bkb           = 120;
        global.bkbres        = 85;
        global.acc           = 0.77;
        global.counteracc    = 0.86;
        global.spd           = 16;
        global.invtime       = 85;
        global.foctime       = 240;
        global.pdmg          = 15;
        global.pdef          = 65;
        global.ppen          = 33;
        global.pkb           = 60;
        global.pkbres        = 90;
        global.pspd          = 24;
        global.sacc          = 1;
        global.sspd          = 6;
        global.fmin          = 2;
        global.fmax          = 5;
        global.fdmg          = 5;
        global.fpen          = 75;
        global.fkb           = 0;
        global.cname         = "BEAMING SPIN";
        global.cdesc         = 
        "Spins very quickly while shooting" +
        "\nbeams of light in both directions" +
        "\nand briefly becomes invincible." +
        "\nActivates only 70% of the time.";
        global.cdmg          = 8;
        global.cpen          = 95;
        global.ckb           = 100;
        global.ctime         = 30;
        global.ccooldown     = 1600;
        global.uname         = "CHIP TUNING";
        global.utype         = "BUFF";
        global.ucooldown     = 1500;
        global.udesc         = 
        "Advanced ECU chip engineering" +
        "\namplifies your engine's output" +
        "\nperformance so dramatically" +
        "\nthat you're able to sustain" +
        "\n0.00026% of the cosmic speed" +
        "\nlimit for a split second.";
    break;
	case PLAYER_BOBILEUSZ:
        global.lore          = 
        "It's Bobileusz. Deal with it." +
        "\nWe're all gonna die.";
        global.hp            = 580;
        global.bdmg          = 64;
        global.bdef          = 25;
        global.bpen          = 0.2;
        global.bkb           = 75;
        global.bkbres        = 70;
        global.acc           = 1;
        global.counteracc    = 1;
        global.spd           = 13;
        global.invtime       = 69;
        global.foctime       = 220;
        global.pdmg          = 5.2;
        global.pdef          = 25;
        global.ppen          = 25;
        global.pkb           = 0;
        global.pkbres        = 80;
        global.pspd          = 30;
        global.sacc          = 0.8;
        global.sspd          = 24;
        global.fmin          = 0;
        global.fmax          = 1;
        global.fdmg          = 40;
        global.fpen          = 25;
        global.fkb           = 0;
        global.cname         = "GEAR SHIFT";
        global.cdesc         = 
        "Hold up or down prior to releasing" +
        "\nthe charge to shift accordingly." +
        "\nAllows you to be perfectly balanced," +
        "\nas everything should be.";
        global.cdmg          = 0;
        global.cpen          = 0;
        global.ckb           = 0;
        global.ctime         = 1;
        global.ccooldown     = 15; //330;
        global.uname         = "PRISMATIC GLACIER";
        global.utype         = "BUFF";
        global.ucooldown     = 3600;
        global.udesc         = 
        "Stores up power for an instantaneous" +
        "\nrelease of immense frost energy," +
        "\nallowing much greater masses of" +
        "\nwater to be frozen solid, forming" +
        "\nnumerous glacial prisms that greatly" +
        "\namplify your offensive capabilities.";
    break;
    default: //Error
        global.lore          = 
        "If you're seeing this, I messed up." +
        "\nPlease send me email describing how this" +
        "\nhappened or how to replicate the bug to" +
        "\nrandoragongamedev@gmail.com" +
        "\n\nSorry for the inconvenience," +
        "\nplease try restarting your game.";
        global.hp            = 0;
        global.bdmg          = 0;
        global.bdef          = 0;
        global.bpen          = 0;
        global.bkb           = 0;
        global.bkbres        = 0;
        global.acc           = 0;
        global.spd           = 0;
        global.invtime       = 0;
        global.counteracc    = 0;
        global.pdmg          = 0;
        global.pdef          = 0;
        global.ppen          = 0;
        global.pkb           = 0;
        global.pkbres        = 0;
        global.pspd          = 0;
        global.sacc          = 0;
        global.sspd          = 0;
        global.fmin          = 0;
        global.fmax          = 0;
        global.fdmg          = 0;
        global.fpen          = 0;
        global.fkb           = 0;
        global.cname         = "error"
        global.cdesc         = "description unavailable";
        global.cdmg          = 0;
        global.cpen          = 0;
        global.ckb           = 0;
        global.ctime         = 0;
        global.ccooldown     = 0;
        global.uname         = "error";
        global.utype         = "unspecified";
        global.ucooldown     = 0;
        global.udesc         = "description unavailable";
    break;
}

// Don't allow shooting speed above framerate
// This is a feature that could potentially exist, but
// it would need a separate implementation if I ever want
// to do it.
if (global.sspd > 60) {
	show_message("ERROR! Shooting speed should not be set above framerate (60).\nEither add support for it, or tone it down a little.");
}