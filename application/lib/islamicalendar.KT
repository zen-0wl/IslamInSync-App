import android.icu.util.IslamicCalendar
import java.util.Calendar
import java.util.GregorianCalendar

class IslamicCalendarWrapper {
    fun getIslamicDate(): String {
        val islamicCalendar = IslamicCalendar.getInstance()
        val gregorianCalendar = GregorianCalendar()
        islamicCalendar.timeInMillis = gregorianCalendar.timeInMillis

        // You can format the date here and return it as a String
        return islamicCalendar.get(Calendar.YEAR).toString() + "-" +
               (islamicCalendar.get(Calendar.MONTH) + 1).toString() + "-" +
               islamicCalendar.get(Calendar.DAY_OF_MONTH).toString()
    }
}
