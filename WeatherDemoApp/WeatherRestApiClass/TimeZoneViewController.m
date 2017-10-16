//
//  TimeZoneViewController.m
//  WeatherRestApiClass
//
//  Created by Fire on 3/10/17.
//  Copyright © 2017 kara0216. All rights reserved.
//

#import "TimeZoneViewController.h"
#import "ResponseDetailViewController.h"
#import "CommonTableViewCell.h"

@interface TimeZoneViewController ()

#pragma mark IBOutlet Properties
@property (weak, nonatomic) IBOutlet UITableView *tableView;

#pragma mark Weather Sample Properties
@property NSString * localTimeStr;
@property NSString * utcOffsetStr;
@property NSString * areaStr;
@property NSString * countryStr;
@property NSString * regionStr;
@property NSString * populationStr;
@property NSMutableArray * dailyWeatherArray;
@end

@implementation TimeZoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.localTimeStr = nil;
    self.utcOffsetStr = nil;
    self.areaStr = nil;
    self.countryStr = nil;
    self.regionStr = nil;
    self.populationStr = nil;
    self.dailyWeatherArray = [[NSMutableArray alloc]init];
    
    self.localTimeStr = [[[self.responseDic objectForKey:@"time_zone"] objectAtIndex:0] objectForKey:@"localtime"];
    self.utcOffsetStr = [[[self.responseDic objectForKey:@"time_zone"] objectAtIndex:0] objectForKey:@"utcOffset"];
    self.areaStr = [[[[[self.responseDic objectForKey:@"nearest_area"] objectAtIndex:0] objectForKey:@"areaName"] objectAtIndex:0] objectForKey:@"value"];
    self.countryStr = [[[[[self.responseDic objectForKey:@"nearest_area"] objectAtIndex:0] objectForKey:@"country"] objectAtIndex:0] objectForKey:@"value"];
    self.regionStr = [[[[[self.responseDic objectForKey:@"nearest_area"] objectAtIndex:0] objectForKey:@"region"] objectAtIndex:0] objectForKey:@"value"];
    self.populationStr = [[[self.responseDic objectForKey:@"nearest_area"] objectAtIndex:0] objectForKey:@"population"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"json_response"]) {
        ResponseDetailViewController * vc = (ResponseDetailViewController*)segue.destinationViewController;
        vc.responseValue = self.jsonResponseValue;
    }
}

#pragma mark UI Actions
- (IBAction)responseBtnPressed:(id)sender {
     [self performSegueWithIdentifier:@"json_response" sender:nil];
}

- (IBAction)backBtnPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40.0f;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 2;
        case 2:
            return 4;
        default:
            return 1;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:{
            CommonTableViewCell *cell = (CommonTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"commonCell"];
            if (cell == nil) {
                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CommonTableViewCell" owner:self options:nil];
                cell = [nib objectAtIndex:0];
                cell.titleLbl.text = @"API Name :";
                cell.contentLbl.text = @"TimeZone API";
            }
            return cell;
        }
        case 1:{
            CommonTableViewCell *cell = (CommonTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"commonCell"];
            if (cell == nil)
            {
                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CommonTableViewCell" owner:self options:nil];
                cell = [nib objectAtIndex:0];
                
                switch (indexPath.row) {
                    case 0:
                        cell.titleLbl.text = @"Local Time :";
                        cell.contentLbl.text = self.localTimeStr;
                        break;
                    case 1:
                        cell.titleLbl.text = @"UTC Offset :";
                        cell.contentLbl.text = self.utcOffsetStr;
                        break;
                    default:
                        break;
                }
            }
            return cell;
        }
        case 2:{
            CommonTableViewCell *cell = (CommonTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"commonCell"];
            if (cell == nil)
            {
                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CommonTableViewCell" owner:self options:nil];
                cell = [nib objectAtIndex:0];
                
                switch (indexPath.row) {
                    case 0:
                        cell.titleLbl.text = @"Country :";
                        cell.contentLbl.text = self.countryStr;
                        break;
                    case 1:
                        cell.titleLbl.text = @"Area :";
                        cell.contentLbl.text = self.areaStr;
                        break;
                    case 2:
                        cell.titleLbl.text = @"Region :";
                        cell.contentLbl.text = self.regionStr;
                        break;
                    case 3:
                        cell.titleLbl.text = @"Population :";
                        cell.contentLbl.text = self.populationStr;
                        break;
                    default:
                        break;
                }
            }
            return cell;
        }
        default:{
            return  [tableView cellForRowAtIndexPath:indexPath];
        }
    }
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"API Name";
        case 1:
            return @"TimeZone";
        case 2:
            return @"Location";
        default:
            return nil;
    }
}

@end
