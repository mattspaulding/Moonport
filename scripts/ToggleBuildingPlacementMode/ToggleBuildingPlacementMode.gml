function ToggleBuildingPlacementMode() {
	isPlaceBuildingMode=!isPlaceBuildingMode;
	if(isPlaceBuildingMode)
	{
		if(!instance_exists(oFarmPlacer))
		{
			with(instance_create_layer(x,bbox_bottom,"Outside_Back",oFarmPlacer))
			{
				image_index=0;
			}
		}
	}
	else
	{
		if(instance_exists(oFarmPlacer))
		{
			instance_destroy(oFarmPlacer);
		}
	}


}
