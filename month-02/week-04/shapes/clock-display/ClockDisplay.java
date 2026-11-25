/**
 * ClockDisplay — 24 цагийн дижитал цаг.
 * Хоёр NumberDisplay объектоос бүтнэ: цаг ба минут.
 */
public class ClockDisplay {
    private NumberDisplay hours;
    private NumberDisplay minutes;
    private NumberDisplay alarmHours;
    private NumberDisplay alarmMinutes;
    private boolean alarmOn;

    /** 00:00-ээс эхлэх цаг. */
    public ClockDisplay() {
        hours = new NumberDisplay(24);
        minutes = new NumberDisplay(60);
        alarmHours = new NumberDisplay(24);
        alarmMinutes = new NumberDisplay(60);
        alarmOn = false;
    }
    
    public void setAlarm(int hour, int minute) {
        if (hour >= 0 && hour < 24 && minute >= 0 && minute < 60) {
            alarmHours.setValue(hour);
            alarmMinutes.setValue(minute);
            alarmOn = true;
    }
    }
    
    public void alarmOff() {
        alarmOn = false;
    }
    
    public String getAlarm() {
        if (alarmOn) {
            return alarmHours.getDisplayValue() + ":" + alarmMinutes.getDisplayValue();
        }
        return "--:--";
    }
    
    public boolean isRinging() {
        if(alarmOn == true && hours.getValue() == alarmHours.getValue() &&   minutes.getValue() == alarmMinutes.getValue()){
            return true;
        }
        return false;
    }

    /** hour:minute-ээс эхлэх цаг. */
    public ClockDisplay(int hour, int minute) {
        hours = new NumberDisplay(24);
        minutes = new NumberDisplay(60);
        hours.setValue(hour);
        minutes.setValue(minute);
    }

    /** Цагийг тохируулна. */
    public void setTime(int hour, int minute) {
        hours.setValue(hour);
        minutes.setValue(minute);
    }

    /** "HH:MM" хэлбэрийн текст. */
    public String getTime() {
        return hours.getDisplayValue() + ":" + minutes.getDisplayValue();
    }

    /**
     * Нэг минут урагшилна.
     * TODO: минут 0 руу эргэх үед цагийг ч нэмэх ёстой.
     */
    public void timeTick() {
        minutes.increment();
        if(minutes.getValue() == 0){
            hours.increment();
        }
    }
}
