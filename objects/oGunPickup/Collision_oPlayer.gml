/// @desc Equip Gun
var _pId=other.pId;


var i;
var exists=false;
for (i = 0; i < instance_number(gun_type); i += 1)
   {
	   
   var gun = instance_find(gun_type,i);
   if(gun.pId==_pId){
	   exists=true;
	   gun.ammo+=ammo;
	    audio_play_sound(gun.gun_loading_sound,7,false);
  
   }
   }
   if(!exists){


var gun =instance_create_layer(x,y,other.layer,gun_type);
with(gun)
    {
   pId=_pId;
   ammo=other.ammo;
   audio_play_sound(gun_loading_sound,7,false);
    }
	other.current_gun=gun;
   }
instance_destroy();
