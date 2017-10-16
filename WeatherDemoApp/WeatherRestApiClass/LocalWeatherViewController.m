//
//  LocalWeatherViewController.m
//  WeatherRestApiClass
//
//  Created by Fire on 3/10/17.
//  Copyright © 2017 kara0216. All rights reserved.
//

#import "LocalWeatherViewController.h"
#import "ResponseDetailViewController.h"
#import "CommonTableViewCell.h"
#import "DataContentCell.h"
#import "DataTitleBarCell.h"

@interface LocalWeatherViewController ()

#pragma mark IBOutlet Properties
@property (weak, nonatomic) IBOutlet UITableView *tableView;

#pragma mark Weather Sample Properties
@property NSString * countryStr;
@property NSString * areaStr;
@property NSString * longitudeStr;
@property NSString * latitudeStr;
@property NSMutableArray * localWeatherMonthArray;
@end

@implementation LocalWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.countryStr = nil;
    self.areaStr = nil;
    self.longitudeStr = nil;
    self.latitudeStr = nil;
    self.localWeatherMonthArray = [[NSMutableArray alloc]init];

    self.countryStr = [[[[[self.responseDic objectForKey:@"nearest_area"] objectAtIndex:0] objectForKey:@"country"] objectAtIndex:0] objectForKey:@"value"];
    self.areaStr = [[[[[self.responseDic objectForKey:@"nearest_area"] objectAtIndex:0] objectForKey:@"areaName"] objectAtIndex:0] objectForKey:@"value"];
    self.longitudeStr = [[[self.responseDic objectForKey:@"nearest_area"] objectAtIndex:0] objectForKey:@"longitude"];
    self.latitudeStr = [[[self.responseDic objectForKey:@"nearest_area"] objectAtIndex:0] objectForKey:@"latitude"];
    self.localWeatherMonthArray = [[[self.responseDic objectForKey:@"ClimateAverages"] objectAtIndex:0] objectForKey:@"month"];
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
            return 4;
        case 2:
            return self.localWeatherMonthArray.count + 1;
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
                cell.contentLbl.text = @"Local Weather API";
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
                        cell.titleLbl.text = @"Country :";
                        cell.contentLbl.text = self.countryStr;
                        break;
                    case 1:
                        cell.titleLbl.text = @"Area :";
                        cell.contentLbl.text = self.areaStr;
                        break;
                    case 2:
                        cell.titleLbl.text = @"Longitude :";
                        cell.contentLbl.text = self.longitudeStr;
                        break;
                    case 3:
                        cell.titleLbl.text = @"Latitude :";
                        cell.contentLbl.text = self.latitudeStr;
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
                }
                return cell;
            }
            else{
                DataContentCell *cell = (DataContentCell *)[tableView dequeueReusableCellWithIdentifier:@"dataContent"];
                if (cell == nil) {
                    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DataContentCell" owner:self options:nil];
                    cell = [nib objectAtIndex:0];
                    cell.monthLbl.text = [[self.localWeatherMonthArray objectAtIndex:indexPath.row - 1] objectForKey:@"name"];
                    cell.maxTemp.text = [[self.localWeatherMonthArray objectAtIndex:indexPath.row - 1] objectForKey:@"absMaxTemp"];
                    cell.minTemp.text = [[self.localWeatherMonthArray objectAtIndex:indexPath.row - 1] objectForKey:@"avgMinTemp"];
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
            return @"Location";
        case 2:
            return @"Monthly Weather Data";
        default:
            return nil;
    }
}
#pragma mark UITableViewDelegate

@end
