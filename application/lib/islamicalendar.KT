import android.icu.util.IslamicCalendar
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.util.Calendar
import java.util.GregorianCalendar

class IslamicCalendarWrapper(private val channel: MethodChannel) : MethodCallHandler {

    init {
        // Set up method call handler
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "getIslamicDate") {
            // Handle the "getIslamicDate" method call
            val islamicDate = getIslamicDate()
            result.success(islamicDate)
        } else {
            result.notImplemented()
        }
    }

    private fun getIslamicDate(): String {
        val islamicCalendar = IslamicCalendar.getInstance()
        val gregorianCalendar = GregorianCalendar()
        islamicCalendar.timeInMillis = gregorianCalendar.timeInMillis

        // You can format the date here and return it as a String
        return islamicCalendar.get(Calendar.YEAR).toString() + "-" +
               (islamicCalendar.get(Calendar.MONTH) + 1).toString() + "-" +
               islamicCalendar.get(Calendar.DAY_OF_MONTH).toString()
    }
}
