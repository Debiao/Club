//
//  PX_UM_RegisteredWebViewController.m
//  newclubs
//
//  Created by sundebiao on 2018/6/1.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_UM_RegisteredWebViewController.h"

@interface PX_UM_RegisteredWebViewController ()<UIWebViewDelegate>

@end

@implementation PX_UM_RegisteredWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"社区协议";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, NavBar_State_Height, SCREEN_WIDTH, SCREENH_HEIGHT)];
    webView.delegate = self;
    NSURL *url = [NSURL URLWithString:NEWCLUBSURL(USERAGREEMENT)];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    [self.view makeToastActivity:CSToastPositionCenter];
   
    // Do any additional setup after loading the view.
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
  [self.view hideToastActivity];
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

@end
