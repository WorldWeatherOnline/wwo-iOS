
World Weather Online iOS Api Sample
============

A Simple weather api demo to show how to use the "world weather online apis".

 * Simple and easy UI 
 * Access weather apis with WeatherAPIModule Library
 * Uses gson for adapter factory

This sample app is very easy to understand and you can simply
start using this weather online api in few minutes!
Apis are out there already and you can access it with any of
your favourite http client:-

    Local Weather API:
    http://api.worldweatheronline.com/premium/v1/weather.ashx?key=API_KEY&q=London&format=json&includelocation=yes
		
    Marine Weather API:
    http://api.worldweatheronline.com/premium/v1/marine.ashx?key=API_KEY&q=31.50,-12.50&format=json&includelocation=yes  
         
    Time Zone API:
    http://api.worldweatheronline.com/premium/v1/tz.ashx?key=API_KEY&q=Paris&format=json&includelocation=yes      
       
    Search API:
    http://api.worldweatheronline.com/premium/v1/tz.ashx?key=API_KEY&q=London&format=json          
      

    Historical Local Weather API:
    http://api.worldweatheronline.com/premium/v1/past-weather.ashx?key=API_KEY&q=Paris&format=json&includelocation=yes&date=2017-08-15&enddate=2017-09-10     
      

    Historical Marine Weather API:
    http://api.worldweatheronline.com/premium/v1/past-marine.ashx?key=API_KEY&q=31.50,-12.50&format=json&includelocation=yes&date=2017-08-15&enddate=2017-09-10       
     
	
    Ski Weather API:
    http://api.worldweatheronline.com/premium/v1/ski.ashx?key=API_KEY&q=52.233,-90.75&format=json&includelocation=yes  	
  	
But We have even make your journey more easier with this sample app :)  	
These are the simple steps to get started with WeatherAPIModule library approach:-

1)Add Required Frameworks
-------
```xml
Foundation.framework
CFNetwork.framework
UIKit.framework
```
2)Add Required Header File To Custome Project 
-------
```xml
#import <WeatherAPIModule.h>
#import <WeatherUtilities.h>
```
That's it! You can now use the api easily :)
3)Usage
-----------
Add WeatherAPIModule Variable 
```xml
@property WeatherAPIModule *network;
```

__To Access Local Weather Api__
```objective c
- (IBAction)localWeatherBtnPressed:(id)sender {
    self.apiNameCategory = LocalWeather;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        });
        [self.network localWeatherAPI];
    });
}
```
__To Access Marine Weather Api__
```objective c
- (IBAction)marinWeatherBtnPressed:(id)sender {
    self.apiNameCategory = MarineWeather;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        });
        [self.network marinWeatherAPI];
    });
}
```
__To Access Timezone Api__
```objective c
- (IBAction)timeZoneBtnPressed:(id)sender {
    self.apiNameCategory = TimezoneWeather;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        });
        [self.network timeZoneAPI];
    });
}
```
__To Access Ski Api__
```objective c
- (IBAction)skiWeatherBtnPressed:(id)sender {
    self.apiNameCategory = SkiWeather;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        });
        [self.network skiAPI];
    });
}
```
### Network Failer Callback

-(void) isNetworkCommunicationFailed:(BOOL)isfailed
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Network Error"
                                     message:@"Can't connect to the server for now. Please confirm your network status."
                                     preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* okButton = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleCancel
                                   handler:nil];
        [alert addAction:okButton];
        [self presentViewController:alert animated:YES completion:nil];
    });
}


License
-------
       MIT License
       
       Copyright (c) 2017 World Weather Online
       
       Permission is hereby granted, free of charge, to any person obtaining a copy
       of this software and associated documentation files (the "Software"), to deal
       in the Software without restriction, including without limitation the rights
       to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
       copies of the Software, and to permit persons to whom the Software is
       furnished to do so, subject to the following conditions:
       
       The above copyright notice and this permission notice shall be included in all
       copies or substantial portions of the Software.
       
       THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
       IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
       FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
       AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
       LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
       OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
       SOFTWARE.
