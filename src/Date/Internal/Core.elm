module Date.Internal.Core exposing (
  unixTimeFromParts,
  unixTimeFromCalendarDate,
  unixTimeFromWeekDate,
  msFromTimeParts,
  weekYearFromCalendarDate,
  weekNumberFromCalendarDate
  )

import Date exposing (Month)
import Date.Facts exposing (daysBeforeStartOfMonth, months, msPerSecond, msPerMinute, msPerHour, msPerDay)
import Date.Internal.RataDie as RataDie


msFromTimeParts : Int -> Int -> Int -> Int -> Int
msFromTimeParts hh mm ss ms =
  ms
  + msPerSecond * ss
  + msPerMinute * mm
  + msPerHour * hh


unixTimeFromParts : Int -> Month -> Int -> Int -> Int -> Int -> Int -> Int
unixTimeFromParts y m d hh mm ss ms =
  RataDie.toUnixTime (RataDie.fromCalendarDate y m d)
  + msFromTimeParts hh mm ss ms


unixTimeFromCalendarDate : Int -> Month -> Int -> Int
unixTimeFromCalendarDate y m d =
  RataDie.toUnixTime <| RataDie.fromCalendarDate y m d


unixTimeFromWeekDate : Int -> Int -> Int -> Int
unixTimeFromWeekDate y w d =
  RataDie.toUnixTime <| RataDie.fromWeekDate y w d


weekYearFromCalendarDate : Int -> Month -> Int -> Int
weekYearFromCalendarDate y m d =
  RataDie.weekYear <| RataDie.fromCalendarDate y m d


weekNumberFromCalendarDate : Int -> Month -> Int -> Int
weekNumberFromCalendarDate y m d =
  RataDie.weekNumber <| RataDie.fromCalendarDate y m d
