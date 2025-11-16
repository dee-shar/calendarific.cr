# calendarific.cr
Web-API for [calendarific.com](https://calendarific.com/) Global Holidays API which covers over 230 countries and 3000 states around the world

## Example
```cr
require "./calendarific"

calendarific = Calendarific.new(api_key="")
countries = calendarific.get_countries()
puts countries
```
