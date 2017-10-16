//
//  WeatherUtilities.h
//  WeatherRestApiClass
//
//  Created by Kara0216 on 3/10/17.
//  Copyright © 2017 kara0216. All rights reserved.
//


// Setup API Key
#define API_KEY 5e29c2f7d3f843ca8e052610171709

// Setup Search URLs
#define LOCAL_WEATHER_API_URL         @"http://api.worldweatheronline.com/premium/v1/weather.ashx?key=5e29c2f7d3f843ca8e052610171709&q=London&format=json&includelocation=yes"
#define MARINE_WEATHER_API_URL         @"http://api.worldweatheronline.com/premium/v1/marine.ashx?key=5e29c2f7d3f843ca8e052610171709&q=31.50,-12.50&format=json&includelocation=yes"
#define TIMEZONE_WEATHER_API_URL         @"http://api.worldweatheronline.com/premium/v1/tz.ashx?key=5e29c2f7d3f843ca8e052610171709&q=Paris&format=json&includelocation=yes"
#define SEARCH_WEATHER_API_URL         @"http://api.worldweatheronline.com/premium/v1/search.ashx?key=5e29c2f7d3f843ca8e052610171709&q=London&format=json"
#define HISTORICAL_LOCAL_WEATHER_API_URL         @"http://api.worldweatheronline.com/premium/v1/past-weather.ashx?key=5e29c2f7d3f843ca8e052610171709&q=Paris&format=json&includelocation=yes&date=2017-08-15&enddate=2017-09-10"
#define HISTORICAL_MARINE_WEATHER_API_URL         @"http://api.worldweatheronline.com/premium/v1/past-marine.ashx?key=5e29c2f7d3f843ca8e052610171709&q=31.50,-12.50&format=json&includelocation=yes&date=2017-08-15&enddate=2017-09-10"
#define SKI_WEATHER_API_URL         @"http://api.worldweatheronline.com/premium/v1/ski.ashx?key=5e29c2f7d3f843ca8e052610171709&q=52.233,-90.75&format=json&includelocation=yes"

typedef enum{
    LocalWeather,
    MarineWeather,
    TimezoneWeather,
    SearchWeather,
    HistoricalLocalWeather,
    HistoricalMarineWeather,
    SkiWeather
}APINameCategory;

#import <Foundation/Foundation.h>
@interface WeatherUtilities : NSObject

@end
