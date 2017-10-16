//
//  ResponseDetailViewController.m
//  WeatherRestApiClass
//
//  Created by kara0216 on 2017-09-27.
//  Copyright © 2017 kara0216. All rights reserved.
//

#import "ResponseDetailViewController.h"

@interface ResponseDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *responseTextView;

@end

@implementation ResponseDetailViewController

#pragma mark App Delegates
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@", self.responseValue);
    self.responseTextView.text = self.responseValue;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)backBtnPressed:(id)sender {
    [[self navigationController] popViewControllerAnimated:true];
}

@end
