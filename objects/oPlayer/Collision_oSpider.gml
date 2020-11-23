if(isOccupyingBuilding || isOccupyingRocket)exit;
hp-=5;
flash = 5;

if(hp<=0)
{
KillPlayer();	
}else{
with (other) {
	
	other.hsp+=20*sign(hsp);	
other.hitfrom=sign(hsp);
x-=20*sign(hsp);	
bitePause=20;
}}