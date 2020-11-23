var player_instance=other;
		 with (instance_create_layer(x, y, "Dialog", oBlueprintScreen))
            {
        		player=player_instance;
				blueprint_sprite=sSubmachineGunBlueprint;
				blueprint_title="Submachine Gun Blueprint";
            }
instance_destroy();
