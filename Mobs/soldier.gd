extends CharacterBody2D


@export var speed = 1000
var Health = 10
var time_passed = 0.0  # Переменная для отслеживания времени

func _process(delta):
	time_passed += delta  # Увеличиваем время на прошедшее время кадра

	# Проверяем, прошло ли 10 секунд
	if time_passed >= 3.0:
		increase_stats()  # Увеличиваем характеристики
		time_passed = 0.0  # Сбрасываем таймер

func increase_stats():
	speed += 1  # Увеличиваем скорость на 1
	Health += 1  # Увеличиваем здоровье на 1

func _physics_process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed*delta)
	
	if get_parent().get_progress_ratio() == 1:
		death()
		Game.Health -= 1
		
	if Health <= 0:
		death()
		Game.Gold += 1
	
func death():
	get_parent().get_parent().queue_free()
