//
//  PX_MC_BM_MyInfoViewController.m
//  newclubs
//
//  Created by sundebiao on 2018/6/22.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_MC_BM_MyInfoViewController.h"
#import "HSDatePickerVC.h"
#import "HSGenderPickerVC.h"
#import "PX_MC_BM_TM_MyInfoHandle.h"
#import "PX_MC_BM_MyInfoBaseModel.h"
#import "PX_MC_BM_MyDetailInfoModel.h"

@interface PX_MC_BM_MyInfoViewController ()<UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,HSDatePickerVCDelegate,UITextFieldDelegate,HSGenderPickerVCDelegate>
@property (nonatomic, strong) UITableView *myInfoTableView;
@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UITableViewCell *cell;
@property (nonatomic, strong) NSString *strBirthday,*trans_name, *trans_qianming, *trans_sex, *trans_zb,*strGender,*tagPhoto;
@property (nonatomic, strong) UIImage *pxPhoto;
@property (nonatomic, strong) NSString *strPhoto;
@property (nonatomic, strong) NSString *strBackgroundPic;

@property (nonatomic, strong) UITextField *tfText;
@end

@implementation PX_MC_BM_MyInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人信息";
    [self myInfoTableView];
    
    [self PxHandleData];
    // Do any additional setup after loading the view.
}

- (void)PxHandleData{
    [PX_MC_BM_TM_MyInfoHandle performaMyInfnSuccess:^(id obj) {
        
        PX_MC_BM_MyInfoBaseModel *model = obj;
        
        self.strPhoto = model.data.avatar;
        self.trans_name = model.data.realname;
        self.trans_qianming = model.data.mood;
        self.strBackgroundPic = model.data.topicon;
        
        if (model.data.sex == 1) {
            self.strGender = @"男";
        }else{
            self.strGender = @"女";
        }
        
        if (model.data.nickname == nil) {
            self.tfText.tag = 101;
        }else{
            self.tfText.tag = 102;
        }
        
        self.strBirthday = [model.data.birthday substringToIndex:10];
        
        [self.myInfoTableView reloadData];
    } failure:^(id obj) {
        
    }];
}


#pragma mark --lazy
- (UITableView *)myInfoTableView{
    if (!_myInfoTableView) {
        
        _myInfoTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREENH_HEIGHT) style:UITableViewStylePlain];
        _myInfoTableView.delegate = self;
        _myInfoTableView.dataSource = self;
        _myInfoTableView.rowHeight = 44;
        _myInfoTableView.separatorColor = LineColor;
        _myInfoTableView.backgroundColor =LineColor ;
        // 解决方法三：添加以下代码关闭估算行高
        _myInfoTableView.estimatedRowHeight = 0;
        _myInfoTableView.estimatedSectionHeaderHeight = 0;
        _myInfoTableView.estimatedSectionFooterHeight = 0;
        self.myInfoTableView.scrollEnabled = NO;
        [self.view addSubview:self.myInfoTableView];
    }
    return _myInfoTableView;
}

// 设置分区头部文字
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc]init];
    
    headerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UILabel *label = [[UILabel alloc]init];
    
    label.textColor = HexColor(0x333333);
    
    label.font = [UIFont systemFontOfSize:14];
    
    label.frame = CGRectMake(10, 3, 100, 24);
    
    
    [headerView addSubview:label];
    
    if (section == 0) {
        
        label.text = @"基本资料";
        
    }else{
        
        label.text = @"个性设置";
        
    }
    
    return headerView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId=@"SettingCell";
    _cell =[tableView dequeueReusableCellWithIdentifier:cellId];
    if (_cell==nil) {
        _cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
    }
    
    _cell.selectionStyle=UITableViewCellSelectionStyleNone;
    _cell.textLabel.font=TextFont(16);
    _cell.textLabel.textColor=ZhengWenColor;
    _cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    _cell.detailTextLabel.font = TextFont(14);
    _cell.detailTextLabel.backgroundColor = PXWHITECOLOR;
    
    switch (indexPath.section) {
        case 0: {
            if (indexPath.row==0) {
                _cell.textLabel.text=@"头像";
                _img = [[UIImageView alloc]init];
                _img.frame = CGRectMake(0, 0, 50, 50);
                _img.layer.cornerRadius = 25;
                _img.layer.masksToBounds = YES;
                _cell.accessoryView =_img;
    
                if (self.strPhoto) {
                    
                    if ([_tagPhoto isEqualToString: @"1"]) {
                        _img.image = _pxPhoto;
                    }else{
                        _img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.strPhoto]]];
                    }
                   
                }else{
                   
                    if ([_tagPhoto isEqualToString: @"1"]) {
                        _img.image = _pxPhoto;
                    }else{
                         _img.image= [UIImage imageNamed:@"ic_button_circle_photo_add"];
                    }
                }
                
            } else if (indexPath.row==1) {
                
                _cell.textLabel.text=@"昵称";
                //cell.detailTextLabel.text = @"请填写姓名";
               _tfText = [[UITextField alloc]init];
                _tfText.placeholder = @"请填写昵称";
                _tfText.textAlignment = NSTextAlignmentRight;
                _tfText.frame = CGRectMake(0, 0, 200, 44);
                _cell.accessoryView = _tfText;
                
                _tfText.delegate = self;
                _tfText.tag = 100+1;
                if (_trans_name.length>0) {
                    _tfText.text = _trans_name;
                }
                
            }else if (indexPath.row==2) {
                _cell.textLabel.text=@"性别";
                if (_strGender.length>0) {
                    _cell.detailTextLabel.text = _strGender;
                    
                }else{
                    _cell.detailTextLabel.text = @"请选择性别";
                    
                }
                //cell.imageView.image=[UIImage imageNamed:@"my2"];
                
            }else{
                _cell.textLabel.text=@"生日";
                
                if (_strBirthday.length>0) {
                    _cell.detailTextLabel.text = _strBirthday;
                    
                }else{
                    _cell.detailTextLabel.text = @"请选择生日";
                    
                }
            }
            
        }
            break;
            
        default: {
            
            if (indexPath.row==0) {
                
                _cell.textLabel.text=@"签名";
                //cell.detailTextLabel.text = @"请填写姓名";
                
                _tfText = [[UITextField alloc]init];
                _tfText.placeholder = @"请填写签名";
                _tfText.textAlignment = NSTextAlignmentRight;
                _tfText.frame = CGRectMake(0, 0, 200, 44);
                _cell.accessoryView =_tfText;
                _tfText.delegate = self;
                _tfText.tag = 100+2;
                if (_trans_qianming.length>0) {
                    _tfText.text = _trans_qianming;
                }
                
                
               
            }else{
                _cell.textLabel.text=@"装扮背景";
            
                _img = [[UIImageView alloc]init];
                _img.frame = CGRectMake(0, 0, 50, 50);
                _img.layer.cornerRadius = 5;
                _img.layer.masksToBounds = YES;
                _cell.accessoryView =_img;
                
                
                if (self.strPhoto) {
                    
                    if ([_tagPhoto isEqualToString: @"2"]) {
                        _img.image = _pxPhoto;
                    }else{
                        _img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.strPhoto]]];
                    }
                    
                }else{
                    
                    if ([_tagPhoto isEqualToString: @"2"]) {
                        _img.image = _pxPhoto;
                    }else{
                        _img.image= [UIImage imageNamed:@"ic_button_circle_photo_add"];
                    }
                }
                
                
                
            }
            
            
            
        }
            
            break;
    }
    
    
    
    
    return _cell;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 4;
            break;
        default:
            return 2;
            break;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:{
            
            switch (indexPath.row) {
                case 0:  {
                    [self alterHeadPortrait:nil];
                    _tagPhoto = @"1";
                }
                    break;
                    
                case 1:  {
                }
                    break;
                case 2:  {
                     HSGenderPickerVC *vc = [[HSGenderPickerVC alloc] init];
                    vc.delegate = self;
                    [self presentViewController:vc animated:YES completion:nil];
                }
                    break;
                  
                default:
                {
                    HSDatePickerVC *vc = [[HSDatePickerVC alloc] init];
                    vc.delegate = self;
                    [self presentViewController:vc animated:YES completion:nil];
                    
                }
                break;

            }
            break;
        }
            
        default:
        {
            switch (indexPath.section) {
                case 1:{
                    switch (indexPath.row) {
                        case 0:  {
                           
                        }
                            break;
                            
                        case 1:  {
                             [self alterHeadPortrait:nil];
                            _tagPhoto = @"2";
                            
                        }
                            break;
                            
                    }
                    
                }
                    
            }
            break;
            
        }
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row==0) {
            return 60;
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row==1) {
            return 60;
        }
    }
    return 44;
    
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
    _pxPhoto = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    //_intState = _img.image.scale;
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.myInfoTableView reloadData];
}
#pragma mark - HSDatePickerVCDelegate
- (void)datePicker:(HSDatePickerVC*)datePicker
          withYear:(NSString *)year
             month:(NSString *)month
               day:(NSString *)day
{
    NSLog(@"选择了   %@--%@--%@",year,month,day);
    _strBirthday = [NSString stringWithFormat:@"%@-%@-%@",year,month,day];
    
    [PX_MC_BM_TM_MyInfoHandle performaMyInfoBirthday:_strBirthday Success:^(id obj) {
        
    } failure:^(id obj) {
        
    }];
    
    
    [self.myInfoTableView reloadData];
    
}
#pragma mark - HSGenderPickerVCDelegate
- (void)genderPicker:(HSGenderPickerVC *)genderPicker selectedGernder:(NSString *)gender{
    _strGender = gender;
    
    int pxIntSex;
    if ([gender isEqualToString:@"男"]) {
        pxIntSex = 1;
    }else{
        pxIntSex = 2;
    }
    
    [PX_MC_BM_TM_MyInfoHandle performaMyInfoSex:pxIntSex Success:^(id obj) {
        
    } failure:^(id obj) {
        
    }];
    
    [self.myInfoTableView reloadData];
}

#pragma mark -- UITextField delegate --
//开始输入文字
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(shouldChangeTextField:) name:@"UITextFieldTextDidChangeNotification" object:textField];
    
    textField.returnKeyType = UIReturnKeyDone;
}
//文字发生改变
- (void)shouldChangeTextField:(NSNotification *)obj{
    UITextField *tf = (UITextField *)obj.object;
    NSInteger tag = tf.tag-100;
    if (tag == 1) {
        //姓名
        _trans_name = tf.text;
    } else {
        //签名
        _trans_qianming = tf.text;
    }
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
   
    if (textField.tag == 101) {
        [self.view makeToast:@"昵称不可以修改"];
         return NO;
    } else {
        return YES;
    }
    
}
//键盘确定搜索的点击事件
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    NSLog(@"点击搜索的逻辑");
    
    [PX_MC_BM_TM_MyInfoHandle performaMyInfoMood:_trans_qianming Success:^(id obj) {
        
    } failure:^(id obj) {
        
    }];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"完成编辑改变视图样式");
    //完成编辑
}

@end
