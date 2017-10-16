//
//  WelcomeViewController.m
//  WeatherRestApiClass
//
//  Created by kara0216 on 2017-09-27.
//  Copyright © 2017 kara0216. All rights reserved.
//

#import "WelcomeViewController.h"
#import "TableViewController.h"
#import "LocalWeatherViewController.h"
#import "MarineWeatherViewController.h"
#import "TimeZoneViewController.h"
#import "SearchViewController.h"
#import "HistoricalLocalWeatherViewController.h"
#import "HistoricalMarineViewController.h"
#import "SkiViewController.h"
#import "MBProgressHUD.h"
#import "WeatherUtilities.h"

@interface WelcomeViewController ()

#pragma mark Vaiables
@property NSString * responseStrings;
@property NSMutableDictionary * responseDictionary;
@property APINameCategory apiNameCategory;
@property WeatherAPIModule *network;

@end

@implementation WelcomeViewController

#pragma mark App Delegates
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.network = [[WeatherAPIModule alloc] init];
    [self.network setDelegate:self];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"local_weather"]) {
        LocalWeatherViewController * vc = (LocalWeatherViewController*)segue.destinationViewController;
        vc.jsonResponseValue = self.responseStrings;
        vc.responseDic = self.responseDictionary;
    }
    if ([segue.identifier isEqualToString:@"marine_weather"]) {
        MarineWeatherViewController * vc = (MarineWeatherViewController*)segue.destinationViewController;
        vc.jsonResponseValue = self.responseStrings;
        vc.responseDic = self.responseDictionary;
    }
    if ([segue.identifier isEqualToString:@"time"]) {
        TimeZoneViewController * vc = (TimeZoneViewController*)segue.destinationViewController;
        vc.jsonResponseValue = self.responseStrings;
        vc.responseDic = self.responseDictionary;
    }
    if ([segue.identifier isEqualToString:@"search"]) {
        SearchViewController * vc = (SearchViewController*)segue.destinationViewController;
        vc.jsonResponseValue = self.responseStrings;
        vc.responseDic = self.responseDictionary;
    }
    if ([segue.identifier isEqualToString:@"historical_local_weather"]) {
        HistoricalLocalWeatherViewController * vc = (HistoricalLocalWeatherViewController*)segue.destinationViewController;
        vc.jsonResponseValue = self.responseStrings;
        vc.responseDic = self.responseDictionary;
    }
    if ([segue.identifier isEqualToString:@"historical_marine_weather"]) {
        HistoricalMarineViewController * vc = (HistoricalMarineViewController*)segue.destinationViewController;
        vc.jsonResponseValue = self.responseStrings;
        vc.responseDic = self.responseDictionary;
    }
    if ([segue.identifier isEqualToString:@"ski"]) {
        SkiViewController * vc = (SkiViewController*)segue.destinationViewController;
        vc.jsonResponseValue = self.responseStrings;
        vc.responseDic = self.responseDictionary;
    }
}

#pragma mark UI Actions
- (IBAction)localWeatherBtnPressed:(id)sender {
    self.apiNameCategory = LocalWeather;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        });
        [self.network localWeatherAPI];
    });
}
- (IBAction)marinWeatherBtnPressed:(id)sender {
    self.apiNameCategory = MarineWeather;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        });
        [self.network marinWeatherAPI];
    });
}
- (IBAction)timeZoneBtnPressed:(id)sender {
    self.apiNameCategory = TimezoneWeather;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        });
        [self.network timeZoneAPI];
    });
}
- (IBAction)searchBtnPressed:(id)sender {
    self.apiNameCategory = SearchWeather;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        });
        [self.network searchAPI];
    });
}
- (IBAction)historicalLocalWeatherBtnPressed:(id)sender {
    self.apiNameCategory = HistoricalLocalWeather;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        });
        [self.network historicalLocalWeatherAPI];
    });
}
- (IBAction)historicalMarineWeatherBtnPressed:(id)sender {
    self.apiNameCategory = HistoricalMarineWeather;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        });
        [self.network historicalMarineWeatherAPI];
    });
}
- (IBAction)skiWeatherBtnPressed:(id)sender {
    self.apiNameCategory = SkiWeather;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        });
        [self.network skiAPI];
    });
}

#pragma mark Weather Module Delegates
-(void) responseString:(NSString *) responseString responseDic:(NSMutableDictionary *)responseDic{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        self.responseStrings = responseString;
        self.responseDictionary = [[NSMutableDictionary alloc]init];
        self.responseDictionary = responseDic;
        
        NSString * segueStr = nil;
        switch (self.apiNameCategory) {
            case LocalWeather:
                segueStr = @"local_weather";
                break;
            case MarineWeather:
                segueStr = @"marine_weather";
                break;
            case TimezoneWeather:
                segueStr = @"time";
                break;
            case SearchWeather:
                segueStr = @"search";
                break;
            case HistoricalLocalWeather:
                segueStr = @"historical_local_weather";
                break;
            case HistoricalMarineWeather:
                segueStr = @"historical_marine_weather";
                break;
            case SkiWeather:
                segueStr = @"ski";
                break;
            default:
                break;
        }
        
        [self performSegueWithIdentifier:segueStr sender:nil];
    });
}
-(void)isNetworkCommunicationFailed:(BOOL)isfailed
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
@end
