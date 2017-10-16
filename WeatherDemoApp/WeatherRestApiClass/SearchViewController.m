//
//  SearchViewController.m
//  WeatherRestApiClass
//
//  Created by Fire on 3/10/17.
//  Copyright © 2017 kara0216. All rights reserved.
//

#import "SearchViewController.h"
#import "ResponseDetailViewController.h"
#import "CommonTableViewCell.h"

@interface SearchViewController ()

#pragma mark IBOutlet Properties
@property (weak, nonatomic) IBOutlet UITableView *tableView;

#pragma mark Weather Sample Properties
@property NSMutableArray * resultArray;

@end

@implementation SearchViewController

#pragma mark App Delegates
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.resultArray = [[NSMutableArray alloc] init];
    self.resultArray = [self.responseDic objectForKey:@"result"];
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
    return 11;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40.0f;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
        default:
            return 4;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommonTableViewCell *cell = (CommonTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"commonCell"];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CommonTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    switch (indexPath.section) {
        case 0:{
            cell.titleLbl.text = @"API Name :";
            cell.contentLbl.text = @"Search API";
            break;
        }
        default:{
            switch (indexPath.row) {
                case 0:
                    cell.titleLbl.text = @"Country :";
                    cell.contentLbl.text = [[[[self.resultArray objectAtIndex:indexPath.section - 1] objectForKey:@"country"] objectAtIndex:0] objectForKey:@"value"];
                    break;
                case 1:
                    cell.titleLbl.text = @"Area :";
                    cell.contentLbl.text = [[[[self.resultArray objectAtIndex:indexPath.section - 1] objectForKey:@"areaName"] objectAtIndex:0] objectForKey:@"value"];
                    break;
                case 2:
                    cell.titleLbl.text = @"Region :";
                    cell.contentLbl.text = [[[[self.resultArray objectAtIndex:indexPath.section - 1] objectForKey:@"region"] objectAtIndex:0] objectForKey:@"value"];
                    break;
                case 3:
                    cell.titleLbl.text = @"Population :";
                    cell.contentLbl.text = [[self.resultArray objectAtIndex:indexPath.section - 1] objectForKey:@"population"];
                    break;
                default:
                    break;
                }
        }
    }
    return cell;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"API Name";
        case 1:
            return @"Search List";
        default:
            return nil;
    }
}

@end
