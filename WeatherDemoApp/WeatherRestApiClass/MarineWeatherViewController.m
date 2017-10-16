//
//  MarineWeatherViewController.m
//  WeatherRestApiClass
//
//  Created by Fire on 3/10/17.
//  Copyright © 2017 kara0216. All rights reserved.
//

#import "MarineWeatherViewController.h"
#import "ResponseDetailViewController.h"
#import "CommonTableViewCell.h"
#import "DataTitleBarCell.h"
#import "DataContentCell.h"

@interface MarineWeatherViewController ()

#pragma mark IBOutlet Properties
@property (weak, nonatomic) IBOutlet UITableView *tableView;

#pragma mark Weather Sample Properties
@property NSString * longitudeStr;
@property NSString * latitudeStr;
@property NSString * distanceMilesStr;
@property NSMutableArray * dailyWeatherArray;
@end

@implementation MarineWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.longitudeStr = nil;
    self.latitudeStr = nil;
    self.distanceMilesStr = nil;
    self.dailyWeatherArray = [[NSMutableArray alloc]init];
    
    self.longitudeStr = [[[self.responseDic objectForKey:@"nearest_area"] objectAtIndex:0] objectForKey:@"longitude"];
    self.distanceMilesStr = [[[self.responseDic objectForKey:@"nearest_area"] objectAtIndex:0] objectForKey:@"distance_miles"];
    self.latitudeStr = [[[self.responseDic objectForKey:@"nearest_area"] objectAtIndex:0] objectForKey:@"latitude"];
    self.dailyWeatherArray = [self.responseDic objectForKey:@"weather"];
    
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
            return 3;
        case 2:
            return self.dailyWeatherArray.count + 1;
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
                cell.contentLbl.text = @"Marine Weather API";
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
                        cell.titleLbl.text = @"Longitude :";
                        cell.contentLbl.text = self.longitudeStr;
                        break;
                    case 1:
                        cell.titleLbl.text = @"Latitude :";
                        cell.contentLbl.text = self.latitudeStr;
                        break;
                    case 2:
                        cell.titleLbl.text = @"Distance Miles :";
                        cell.contentLbl.text = self.distanceMilesStr;
                        break;
                    default:
                        break;
                }
            }
            return cell;
        }
            
        case 2:{
            if (indexPath.row == 0) {
                DataTitleBarCell *cell = (DataTitleBarCell *)[tableView dequeueReusableCellWithIdentifier:@"dataTitleBarCell"];
                if (cell == nil) {
                    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DataTitleBarCell" owner:self options:nil];
                    cell = [nib objectAtIndex:0];
                    cell.firstTitleLbl.text = @"Date";
                    cell.secondTitleLbl.text = @"MaxTempC";
                    cell.thirdTitleLbl.text = @"MinTempC";
                }
                return cell;
            }
            else{
                DataContentCell *cell = (DataContentCell *)[tableView dequeueReusableCellWithIdentifier:@"dataContent"];
                if (cell == nil) {
                    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DataContentCell" owner:self options:nil];
                    cell = [nib objectAtIndex:0];
                    cell.monthLbl.text = [[self.dailyWeatherArray objectAtIndex:indexPath.row - 1] objectForKey:@"date"];
                    cell.maxTemp.text = [[self.dailyWeatherArray objectAtIndex:indexPath.row - 1] objectForKey:@"maxtempC"];
                    cell.minTemp.text = [[self.dailyWeatherArray objectAtIndex:indexPath.row - 1] objectForKey:@"mintempC"];
                }
                return cell;
            }
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
            return @"Nearest Area";
        case 2:
            return @"Daily Weather List";
        default:
            return nil;
    }
}

@end
