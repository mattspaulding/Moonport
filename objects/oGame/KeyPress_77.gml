/// @description Debug mode

isDebug=!isDebug;

if(isDebug){
	layer_set_visible("Walls",true);
	layer_set_visible("InternalWalls",true);
}
else{
	layer_set_visible("Walls",false);
	layer_set_visible("InternalWalls",false);
}