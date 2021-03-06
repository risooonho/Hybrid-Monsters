extends CanvasLayer

func _ready():
	DeliveryManager.get_node("Deliveries").connect("new_delivery", self, "_on_new_delivery")

func _on_new_delivery(delivery):
	SoundManager.play_sound(SoundManager.Sound.NOTIFICATION)
	
	if delivery[0] == "ShopItems":
		$ShopAnim.play("show")
		ItemGenerator.create_item_pack_for_shop(DataManager.shop_inventory, DataManager.players[Main.current_player].level)
		DataManager.save_user_config()