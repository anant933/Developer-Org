trigger MyTrigger on Task (Before insert,Before update) {
for(Task t:Trigger.New){
    if(t.Priority.equals('Normal'))
    t.addError('it cant be Normal (Trigger)');
    }

}