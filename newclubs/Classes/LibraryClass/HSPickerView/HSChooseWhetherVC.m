//
//  HSChooseWhetherVC.m
//  newclubs
//
//  Created by a on 2018/6/27.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "HSChooseWhetherVC.h"

@interface HSChooseWhetherVC ()
//数据源数组
@property(nonatomic,strong) NSArray *chooseArray;
@property(nonatomic,copy) NSString *currentIs;
@end

@implementation HSChooseWhetherVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pickerTitle = @"身份验证";
    self.definesPresentationContext = YES;
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    
    self.chooseArray = @[@[@"无需验证",@"需要验证",@"不接受新成员"]];
    self.currentIs = _chooseArray[0][0];
    self.dataArray = _chooseArray;
    // Do any additional setup after loading the view.
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.currentIs = self.chooseArray[0][row];
}
#pragma mark - privateMethods

-(void)cancleAction{
    [super cancleAction];
    if ([self.delegate respondsToSelector:@selector(ChooseWhether:selectedIs:State:)]) {
        [self.delegate ChooseWhether:nil selectedIs:nil State:1];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    if (point.y < CGRectGetMinY(self.selectView.frame)) {
        if ([self.delegate respondsToSelector:@selector(ChooseWhether:selectedIs:State:)]) {
            [self.delegate ChooseWhether:nil selectedIs:nil State:1];
        }
    }
    
    
}
-(void)ensureAction{
    [super ensureAction];
    
    if ([self.delegate respondsToSelector:@selector(ChooseWhether:selectedIs:State:)]) {
       [self.delegate ChooseWhether:nil selectedIs:nil State:0];
    }
    
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
