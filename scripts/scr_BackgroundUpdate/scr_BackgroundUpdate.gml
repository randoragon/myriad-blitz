/// @description scr_BackgroundUpdate(realm)
/// @param realm

switch(argument[0]) {
case 0: //Menu
    __background_set( e__BG.Index, 0, bg_Menu0 );
    __background_set( e__BG.HTiled, 0, 0 );
    __background_set( e__BG.VTiled, 0, 1 );
    global.parallax_speed[0,0]=0;
    global.parallax_speed[0,1]=0;
    __background_set( e__BG.Index, 1, bg_Menu1 );
    __background_set( e__BG.HTiled, 1, 1 );
    __background_set( e__BG.VTiled, 1, 0 );
    global.parallax_speed[1,0]=-1;
    global.parallax_speed[1,1]=0;
    __background_set( e__BG.Index, 2, bg_Menu2 );
    __background_set( e__BG.HTiled, 2, 1 );
    __background_set( e__BG.VTiled, 2, 0 );
    global.parallax_speed[2,0]=-2;
    global.parallax_speed[2,1]=0;
    __background_set( e__BG.Index, 3, bg_Menu3 );
    __background_set( e__BG.HTiled, 3, 1 );
    __background_set( e__BG.VTiled, 3, 0 );
    global.parallax_speed[3,0]=-3;
    global.parallax_speed[3,1]=0;
    __background_set( e__BG.Index, 4, bg_Menu4 );
    __background_set( e__BG.HTiled, 4, 1 );
    __background_set( e__BG.VTiled, 4, 0 );
    global.parallax_speed[4,0]=-4;
    global.parallax_speed[4,1]=0;
    __background_set( e__BG.Index, 5, bg_Menu5 );
    __background_set( e__BG.HTiled, 5, 1 );
    __background_set( e__BG.VTiled, 5, 0 );
    global.parallax_speed[5,0]=-5;
    global.parallax_speed[5,1]=0;
    __background_set( e__BG.Index, 6, bg_Menu6 );
    __background_set( e__BG.HTiled, 6, 1 );
    __background_set( e__BG.VTiled, 6, 0 );
    global.parallax_speed[6,0]=-6;
    global.parallax_speed[6,1]=0;
    __background_set( e__BG.Index, 7, -1 );
break;
case 1: //Christmas Realm
    __background_set( e__BG.Index, 0, bg_Christmas0 );
    __background_set( e__BG.HTiled, 0, 0 );
    __background_set( e__BG.VTiled, 0, 1 );
    global.parallax_speed[0,0]=0;
    global.parallax_speed[0,1]=0;
    __background_set( e__BG.Index, 1, bg_Christmas1 );
    __background_set( e__BG.HTiled, 1, 1 );
    __background_set( e__BG.VTiled, 1, 0 );
    global.parallax_speed[1,0]=-1;
    global.parallax_speed[1,1]=0;
    __background_set( e__BG.Index, 2, bg_Christmas2 );
    __background_set( e__BG.HTiled, 2, 1 );
    __background_set( e__BG.VTiled, 2, 0 );
    global.parallax_speed[2,0]=-2;
    global.parallax_speed[2,1]=0;
    __background_set( e__BG.Index, 3, bg_Christmas3 );
    __background_set( e__BG.HTiled, 3, 1 );
    __background_set( e__BG.VTiled, 3, 0 );
    global.parallax_speed[3,0]=-3;
    global.parallax_speed[3,1]=0;
    __background_set( e__BG.Index, 4, bg_Christmas4 );
    __background_set( e__BG.HTiled, 4, 1 );
    __background_set( e__BG.VTiled, 4, 0 );
    global.parallax_speed[4,0]=-4;
    global.parallax_speed[4,1]=0;
    __background_set( e__BG.Index, 5, bg_Christmas5 );
    __background_set( e__BG.HTiled, 5, 1 );
    __background_set( e__BG.VTiled, 5, 0 );
    global.parallax_speed[5,0]=-6;
    global.parallax_speed[5,1]=0;
    __background_set( e__BG.Index, 6, -1 );
    __background_set( e__BG.Index, 7, -1 );
break;
}
