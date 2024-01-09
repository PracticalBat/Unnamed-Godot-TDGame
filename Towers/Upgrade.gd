extends Control

func Upgrade_DMG(value: float, cost : int ) -> void:
	if StageData.money >= cost:
		StageData.money -= cost
		get_parent().tower_value += value
		get_parent().tower_damage += value
		print("new damage : "+ str(get_parent().tower_damage))
	else: print("broke")


func Sell_Tower() -> void:
	StageData.money += get_parent().tower_value * GameData.sell_percentage
	print("Sold for : "+ str(get_parent().tower_value * GameData.sell_percentage))
	get_parent().queue_free() # animationplayer including money popup 


func Upgrade_ROF(value: float, cost : int) -> void:
	if StageData.money >= cost:
		StageData.money -= cost
		get_parent().rate_of_fire -= value
		get_parent().tower_value += value
		print("new rof : "+ str(get_parent().rate_of_fire))
	else: print("broke")

func _process(delta: float) -> void:
	$Debug/DMGLabel.text = "DMG: "+ str(get_parent().tower_damage)
	$Debug/RofLabel.text = "ROF: " +str(get_parent().rate_of_fire)
	$Debug/SellPriceLabel.text = "SellPrice: "+str(get_parent().tower_value * GameData.sell_percentage)
	
	
	
