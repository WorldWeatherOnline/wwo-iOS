//
//  DataContentCell.h
//  WeatherRestApiClass
//
//  Created by Fire on 3/10/17.
//  Copyright © 2017 kara0216. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataContentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *monthLbl;
@property (weak, nonatomic) IBOutlet UILabel *maxTemp;
@property (weak, nonatomic) IBOutlet UILabel *minTemp;

@end
