//
//  TableViewController.h
//  WeatherRestApiClass
//
//  Created by Fire on 3/10/17.
//  Copyright © 2017 kara0216. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherUtilities.h"

@interface TableViewController : UIViewController

@property APINameCategory apiCategory;
@property NSString * apiName;
@property NSString * jsonResponseValue;
@property NSMutableDictionary * responseDic;

@end
