/// @description scr_PlayerDataUpdate(character_index);
/// @param character_index

switch (argument[0]) {
    case 0: //Evilflame
        global.lore          = 
        "Is it a bird? Is it a dolphin?" +
        "#Negative, this fearless flying machine" +
        "#is a worldwide known demon slayer." +
        "#It conquered countless challenges" +
        "#and resisted the most ruthless of" +
        "#tortures, some involving being shredded" +
        "#to pieces, other long time exposure" +
        "#to ultraviolet rays. It is said" +
        "#to fall into unstoppable fury under" +
        "#the light of the twilight moon.";
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
        "#into nearby enemies and explodes" +
        "#into a ring of deadly sparks.";
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
            "#an upside-down copy of itself" +
            "#that mirrors every action of" +
            "#the original.";
        } else {
            global.uname     = "TWILIGHT FURY";
            global.utype     = "SECRET BUFF";
            global.ucooldown = 1200;
            global.udesc     = 
            "Borrows the power of stars...";
        }
    break;
    case 1: //Emerald~
        global.lore          = 
        "Legends speak of a young pony disciple" +
        "#so powerful, that its mere birth" +
        "#caused irreversible changes to" +
        "#the very fabric of the Universe." +
        "#Adept at using deadly water spells," +
        "#no one has ever clashed with this" +
        "#beast and came back unscathed.";
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
        "#that deals constant damage to" +
        "#any enemy it touches.";
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
        "#that suck in enemies and most" +
        "#projectiles for 15 seconds," +
        "#then crushes everything trapped" +
        "#inside with extreme pressure." +
        "#Temporarily weakens the caster" +
        "#afterwards due to exhaustion.";
    break;
    case 2: //Der Scootomik
        global.lore          = 
        "The most powerful scooter in the universe." +
        "#It has been infused with ancient metals," +
        "#making it extremely durable in exchange" +
        "#for sporadic malfunctioning of its charge." +
        "#Capable of achieving ludicrous speeds," +
        "#which allow it to travel around the Earth" +
        "#to attack its enemies from behind.";
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
        "#beams of light in both directions" +
        "#and briefly becomes invincible." +
        "#Activates only 70% of the time.";
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
        "#amplifies your engine's output" +
        "#performance so dramatically" +
        "#that you're able to sustain" +
        "#0.00026% of the cosmic speed" +
        "#limit for a split second.";
    break;
    default: //Error
        global.lore          = 
        "If you're seeing this, I messed up." +
        "#Please send me email describing how this" +
        "#happened or how to replicate the bug to" +
        "#randoragongamedev@gmail.com" +
        "##Sorry for the inconvenience," +
        "#please try restarting your game.";
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