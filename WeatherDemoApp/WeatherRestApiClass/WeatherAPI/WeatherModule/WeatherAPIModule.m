//
//  WeatherAPIModule.m
//  WeatherRestApiClass
//
//  Created by kara0216 on 2017-09-27.
//  Copyright © 2017 kara0216. All rights reserved.
//

#import "WeatherAPIModule.h"
#import "WeatherUtilities.h"
#import "ASIFormDataRequest.h"
#import "JSON.h"

@implementation WeatherAPIModule
@synthesize delegate;

#pragma mark API Interface
-(void)localWeatherAPI
{

    NSString *finalURL= nil;
    finalURL = LOCAL_WEATHER_API_URL;
    NSURL *url = [NSURL URLWithString:finalURL];

    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setDidFinishSelector:@selector(returnedLocalWeatherList:)];
    [request setDidFailSelector:@selector(failedReturnedList:)];
    [request setDelegate:self];
    [request startAsynchronous];
    
}
-(void)marinWeatherAPI
{
    
    NSString *finalURL= nil;
    finalURL = MARINE_WEATHER_API_URL;
    NSURL *url = [NSURL URLWithString:finalURL];

    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setDidFinishSelector:@selector(returnedMarineWeatherList:)];
    [request setDidFailSelector:@selector(failedReturnedList:)];
    [request setDelegate:self];
    [request startAsynchronous];
    
}
-(void)timeZoneAPI
{
    
    NSString *finalURL= nil;
    finalURL = TIMEZONE_WEATHER_API_URL;
    NSURL *url = [NSURL URLWithString:finalURL];

    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setDidFinishSelector:@selector(returnedTimeWeatherList:)];
    [request setDidFailSelector:@selector(failedReturnedList:)];
    [request setDelegate:self];
    [request startAsynchronous];
    
}
-(void)searchAPI
{
    
    NSString *finalURL= nil;
    finalURL = SEARCH_WEATHER_API_URL;
    NSURL *url = [NSURL URLWithString:finalURL];

    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setDidFinishSelector:@selector(returnedSearchList:)];
    [request setDidFailSelector:@selector(failedReturnedList:)];
    [request setDelegate:self];
    [request startAsynchronous];
    
}

-(void)historicalLocalWeatherAPI
{
    
    NSString *finalURL= nil;
    finalURL = HISTORICAL_LOCAL_WEATHER_API_URL;
    NSURL *url = [NSURL URLWithString:finalURL];

    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setDidFinishSelector:@selector(returnedHistoricalLocalWeatherList:)];
    [request setDidFailSelector:@selector(failedReturnedList:)];
    [request setDelegate:self];
    [request startAsynchronous];
    
}
-(void)historicalMarineWeatherAPI
{
    
    NSString *finalURL= nil;
    finalURL = HISTORICAL_MARINE_WEATHER_API_URL;
    NSURL *url = [NSURL URLWithString:finalURL];
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setDidFinishSelector:@selector(returnedHistoricalMarineWeatherList:)];
    [request setDidFailSelector:@selector(failedReturnedList:)];
    [request setDelegate:self];
    [request startAsynchronous];
    
}
-(void)skiAPI
{

    NSString *finalURL= nil;
    finalURL = SKI_WEATHER_API_URL;
    NSURL *url = [NSURL URLWithString:finalURL];

    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setDidFinishSelector:@selector(returnedSkiWeatherList:)];
    [request setDidFailSelector:@selector(failedReturnedList:)];
    [request setDelegate:self];
    [request startAsynchronous];
    
}

#pragma mark Response Callback
// Deliver the Return Value
-(void) returnedLocalWeatherList:(ASIHTTPRequest *)request
{
    NSString *responseString = [request responseString];
    NSMutableDictionary *values=(NSMutableDictionary *) [responseString JSONValue];
    NSMutableDictionary *localWeatherDictionary = [values objectForKey:@"data"];

    [delegate responseString:responseString responseDic:localWeatherDictionary];
 
}
-(void) returnedMarineWeatherList:(ASIHTTPRequest *)request
{
    NSString *responseString = [request responseString];
    NSMutableDictionary *values=(NSMutableDictionary *) [responseString JSONValue];
    NSMutableDictionary *marinWeatherDictionary = [values objectForKey:@"data"];
    
    [delegate responseString:responseString responseDic:marinWeatherDictionary];
    
}
-(void) returnedTimeWeatherList:(ASIHTTPRequest *)request
{
    NSString *responseString = [request responseString];
    NSMutableDictionary *values=(NSMutableDictionary *) [responseString JSONValue];
    NSMutableDictionary *timeWeatherDictionary = [values objectForKey:@"data"];
    
    [delegate responseString:responseString responseDic:timeWeatherDictionary];
    
}
-(void) returnedSearchList:(ASIHTTPRequest *)request
{
    NSString *responseString = [request responseString];
    NSMutableDictionary *values=(NSMutableDictionary *) [responseString JSONValue];
    NSMutableDictionary *searchWeatherDictionary = [values objectForKey:@"search_api"];
    
    [delegate responseString:responseString responseDic:searchWeatherDictionary];
    
}
-(void) returnedHistoricalLocalWeatherList:(ASIHTTPRequest *)request
{
    NSString *responseString = [request responseString];
    NSMutableDictionary *values=(NSMutableDictionary *) [responseString JSONValue];
    NSMutableDictionary *historicalLocalWeatherDictionary = [values objectForKey:@"data"];
    
    [delegate responseString:responseString responseDic:historicalLocalWeatherDictionary];
    
}
-(void) returnedHistoricalMarineWeatherList:(ASIHTTPRequest *)request
{
    NSString *responseString = [request responseString];
    NSMutableDictionary *values=(NSMutableDictionary *) [responseString JSONValue];
    NSMutableDictionary *historicalMarineWeatherDictionary = [values objectForKey:@"data"];
    
    [delegate responseString:responseString responseDic:historicalMarineWeatherDictionary];
}
-(void) returnedSkiWeatherList:(ASIHTTPRequest *)request
{
    NSString *responseString = [request responseString];
    NSMutableDictionary *values=(NSMutableDictionary *) [responseString JSONValue];
    NSMutableDictionary *skiWeatherDictionary = [values objectForKey:@"data"];
    
    [delegate responseString:responseString responseDic:skiWeatherDictionary];
}

#pragma mark Unknown Error
-(void) failedReturnedList:(ASIHTTPRequest *)request
{
    NSString *responseString = [request responseString];
    NSLog(@"%@",responseString);
    
    [delegate isNetworkCommunicationFailed:YES];
    
}
@end
