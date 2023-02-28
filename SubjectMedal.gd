extends Area2D

export var subject_name = "subject-name"

func _on_SubjectMedal_body_entered(body):
#	if subject_name == 'subject1':
#		$CanvasLayer/CounterUI/Subject1.show()
#	if subject_name == 'subject2':
#		$CanvasLayer/CounterUI/Subject2.show()
#	if subject_name == 'subject3':
#		$CanvasLayer/CounterUI/Subject3.show()
#	if subject_name == 'subject4':
#		$CanvasLayer/CounterUI/Subject4.show()
#	if subject_name == 'subject5':
#		$CanvasLayer/CounterUI/Subject5.show()
	queue_free()
