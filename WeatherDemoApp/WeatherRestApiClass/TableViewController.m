//
//  TableViewController.m
//  WeatherRestApiClass
//
//  Created by Fire on 3/10/17.
//  Copyright © 2017 kara0216. All rights reserved.
//

#import "TableViewController.h"
#import "ResponseDetailViewController.h"

@interface TableViewController ()

#pragma mark IBOutlet Properties
@property (weak, nonatomic) IBOutlet UILabel *apiNameLbl;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TableViewController

#pragma mark App Delegates
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.responseDic = [[NSMutableDictionary alloc]init];
    [self initUI];
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

#pragma mark UI Init
- (void)initUI{
    self.apiNameLbl.text = self.apiName;
}

#pragma mark UI Actions
- (IBAction)backBtnPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}
- (IBAction)responseBtnPressed:(id)sender {
    [self performSegueWithIdentifier:@"json_response" sender:nil];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (self.apiCategory) {
        case LocalWeather:
            return nil;
        case MarineWeather:
            return nil;
        case TimezoneWeather:
            return nil;
        case SearchWeather:
            return nil;
        case HistoricalLocalWeather:
            return nil;
        case HistoricalMarineWeather:
            return nil;
        case SkiWeather:
            return nil;
        default:
            return nil;
    }
    
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"";
}
#pragma mark UITableViewDelegate
@end
