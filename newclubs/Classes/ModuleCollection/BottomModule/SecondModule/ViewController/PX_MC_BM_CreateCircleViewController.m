//
//  PX_MC_BM_CreateCircleViewController.m
//  newclubs
//
//  Created by sundebiao on 2018/6/19.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_MC_BM_CreateCircleViewController.h"
#import "UITextView+ZWPlaceHolder.h"
#import "UITextView+ZWLimitCounter.h"
#import "PX_MC_BM_CreateCirclePermissionsViewController.h"


@interface PX_MC_BM_CreateCircleViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic,strong) UIImageView *myHeadPortrait;
@property (nonatomic,strong) UITextField *tfTitle;
@property (nonatomic,strong) UITextView *tfContent;

@end

@implementation PX_MC_BM_CreateCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"建圈子";
    [self setHeadPortrait];
    [self createInitUI];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame =CGRectMake(0,0, 60, 30);
    [btn setTitle:@"下一步"forState:UIControlStateNormal];
    [btn setTitleColor:HexColor(0xBEBEBE) forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(Next) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem  *barBut = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = barBut;

    //定制左按钮
    UIButton *btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
    btnBack.frame =CGRectMake(-10,-10,25, 30);
    [btnBack setTitle:@"取消"forState:UIControlStateNormal];
    [btnBack setTitleColor:PXBLACKCOLOR forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(popView)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem  *barLeft = [[UIBarButtonItem alloc]initWithCustomView:btnBack];
    self.navigationItem.leftBarButtonItem = barLeft;
     
}
-(void)popView{
     [self.navigationController popViewControllerAnimated:NO];
}

-(void)Next{
    PX_MC_BM_CreateCirclePermissionsViewController *CreateCirclePermissionsVc = [[PX_MC_BM_CreateCirclePermissionsViewController alloc]init];
    [self.navigationController pushViewController:CreateCirclePermissionsVc animated:NO];
}

- (void)createInitUI{
    self.tfTitle = [[UITextField alloc]init];
    self.tfTitle.placeholder = @"你的圈子名称(注:圈名是无法更改的)";
    self.tfTitle.borderStyle = UITextBorderStyleRoundedRect;
    self.tfTitle.frame = CGRectMake(MarginSize, 230, SCREEN_WIDTH - MarginSize*2, 44);
    [self.view addSubview:self.tfTitle];
    
    
    
    CGRect rect = CGRectMake(MarginSize, 280, SCREEN_WIDTH - MarginSize*2, 100);
    self.tfContent = [[UITextView alloc] initWithFrame:rect];
    self.tfContent.font = [UIFont systemFontOfSize:15.f];
    self.tfContent.layer.borderColor = HexColor(0xD2D2D2).CGColor;
    self.tfContent.layer.borderWidth = 0.5f;
    self.tfContent.layer.cornerRadius = 5.0f;
    
//    UILabel *placeHolderLabel = [[UILabel alloc] init];
//    placeHolderLabel.text = @"圈子的简介或者说明";
//    placeHolderLabel.numberOfLines = 0;
//    placeHolderLabel.textColor = [UIColor lightGrayColor];
//    [placeHolderLabel sizeToFit];
//    [self.tfContent addSubview:placeHolderLabel];
//    // same font
//    placeHolderLabel.font = [UIFont systemFontOfSize:16.f];
//    [self.tfContent setValue:placeHolderLabel forKey:@"_placeholderLabel"];
    
    // 使用textContainerInset设置top、left、right
    self.tfContent.textContainerInset = UIEdgeInsetsMake(3 , 1, 0, 0);
    //当光标在最后一行时，始终显示低边距，需使用contentInset设置bottom.
    self.tfContent.contentInset = UIEdgeInsetsMake(0, 0, 10, 0);
    //防止在拼音打字时抖动
    self.tfContent.layoutManager.allowsNonContiguousLayout=NO;
    
    
    //文字设置居右、placeHolder会跟随设置
    //textView.textAlignment = NSTextAlignmentRight;
    self.tfContent.zw_placeHolder = @"圈子的简介或者说明";
    self.tfContent.zw_limitCount = 30;
    self.tfContent.zw_placeHolderColor = [UIColor redColor];
    [self.view addSubview:self.tfContent];
    

}


-(void)setHeadPortrait{
    
   self.myHeadPortrait = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100 ,100)];
   self.myHeadPortrait.center = CGPointMake(CGRectGetWidth(self.view.frame)/2, CGRectGetHeight(self.view.frame)/5);
    [self.myHeadPortrait setImage:[UIImage imageNamed:@"ic_button_circle_photo_add"]];
//    self.myHeadPortrait.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.myHeadPortrait];

    //  把头像设置成圆形
    self.myHeadPortrait.layer.cornerRadius=self.myHeadPortrait.frame.size.width/2;
    self.myHeadPortrait.layer.masksToBounds=YES;
    //  给头像加一个圆形边框
    self.myHeadPortrait.layer.borderWidth = 1.5f;
    self.myHeadPortrait.layer.borderColor = [UIColor whiteColor].CGColor;
    
    /**
     *  添加手势：也就是当用户点击头像了之后，对这个操作进行反应
     */
    //允许用户交互
    _myHeadPortrait.userInteractionEnabled = YES;
    
    //初始化一个手势
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                               action:@selector(alterHeadPortrait:)];
    
    //给imageView添加手势
    [_myHeadPortrait addGestureRecognizer:singleTap];
}

//  方法：alterHeadPortrait
-(void)alterHeadPortrait:(UITapGestureRecognizer *)gesture{
    /**
     *  弹出提示框
     */
    //初始化提示框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    //按钮：从相册选择，类型：UIAlertActionStyleDefault
    [alert addAction:[UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //初始化UIImagePickerController
        UIImagePickerController *PickerImage = [[UIImagePickerController alloc]init];
        //获取方式1：通过相册（呈现全部相册），UIImagePickerControllerSourceTypePhotoLibrary
        //获取方式2，通过相机，UIImagePickerControllerSourceTypeCamera
        //获取方法3，通过相册（呈现全部图片），UIImagePickerControllerSourceTypeSavedPhotosAlbum
        PickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //允许编辑，即放大裁剪
        PickerImage.allowsEditing = YES;
        //自代理
        PickerImage.delegate = self;
        //页面跳转
        [self presentViewController:PickerImage animated:YES completion:nil];
    }]];
    //按钮：拍照，类型：UIAlertActionStyleDefault
    [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        /**
         其实和从相册选择一样，只是获取方式不同，前面是通过相册，而现在，我们要通过相机的方式
         */
        UIImagePickerController *PickerImage = [[UIImagePickerController alloc]init];
        //获取方式:通过相机
        PickerImage.sourceType = UIImagePickerControllerSourceTypeCamera;
        PickerImage.allowsEditing = YES;
        PickerImage.delegate = self;
        [self presentViewController:PickerImage animated:YES completion:nil];
    }]];
    //按钮：取消，类型：UIAlertActionStyleCancel
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}
//PickerImage完成后的代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //定义一个newPhoto，用来存放我们选择的图片。
    UIImage *newPhoto = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    _myHeadPortrait.image = newPhoto;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
