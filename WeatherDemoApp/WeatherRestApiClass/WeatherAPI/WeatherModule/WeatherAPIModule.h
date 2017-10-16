//
//  WeatherAPIModule.h
//  WeatherRestApiClass
//
//  Created by jessy hansen on 2017-09-27.
//  Copyright © 2017 kara0216. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NPNetworkProtocol

@optional
-(void) isNetworkCommunicationFailed:(BOOL) isfailed;
-(void) responseString:(NSString *) responseString responseDic:(NSMutableDictionary*) responseDic;

@end

@interface WeatherAPIModule : NSObject

@property(assign) id<NPNetworkProtocol> delegate;

// APIs For Static Sample
-(void)localWeatherAPI;
-(void)marinWeatherAPI;
-(void)timeZoneAPI;
-(void)searchAPI;
-(void)historicalLocalWeatherAPI;
-(void)historicalMarineWeatherAPI;
-(void)skiAPI;

/* APIs For Extensible Interface (Flexible APIs)

-(void)localWeatherAPI:(NSString *)location includeLocation:(BOOL) includeLocation;
-(void)marinWeatherAPI:(NSString *)location includeLocation:(BOOL) includeLocation;
-(void)timeZoneAPI:(NSString *)location includeLocation:(BOOL) includeLocation;
-(void)searchAPI:(NSString *)location;
-(void)historicalLocalWeatherAPI:(NSString *)location startDate:(NSString*) startDate endDate:(NSString*) endDate includeLocation:(BOOL) includeLocation;
-(void)historicalMarineWeatherAPI:(NSString *)location startDate:(NSString*) startDate endDate:(NSString*) endDate includeLocation:(BOOL) includeLocation;
-(void)skiAPI:(NSString *)location includeLocation:(BOOL) includeLocation;

 */

@end
