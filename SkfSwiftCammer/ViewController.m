//
//  ViewController.m
//  SkfSwiftCammer
//
//  Created by Kevin Sun on 16/4/13.
//  Copyright © 2016年 Kevin Sun. All rights reserved.
//
#import <Photos/Photos.h>
#import "ViewController.h"
/* 1. 在oc中使用swift文件
   2. 创建全局编译文件 PrefixHeader.pch
   3. 在全局预编译文件PrefixHeader.pch中 #import ‘项目名-Swift.h")
   4. 现在就可以在oc中使用swift了
   是不是很神奇
   先导入ALCameraViewController到你的工程 然后在预编译文件里面添加#import ‘项目名-Swift.h" 就可以使用了
*/
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *ssss;
- (IBAction)kkkkk:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *Kimage;
- (IBAction)KLibrary:(id)sender;
- (IBAction)KCropping:(id)sender;
@property(nonatomic,assign)BOOL IsOpneLibrary;
@property(nonatomic,assign)BOOL IsOpneCropping;
@property (weak, nonatomic) IBOutlet UISwitch *KLibarySwtich;
@property (weak, nonatomic) IBOutlet UILabel *KlibrayLabel;
@property (weak, nonatomic) IBOutlet UIButton *KCamera;
@property (weak, nonatomic) IBOutlet UISwitch *KCroppingSwitch;
@property (weak, nonatomic) IBOutlet UILabel *KCroppingLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //默认不打开从相册选择照片和裁剪功能
    self.IsOpneLibrary=NO;
    self.IsOpneCropping=NO;
    [self Addmasonry];
}
#pragma mark 添加约束 原谅我不会Autolayout
-(void)Addmasonry{
    [self.KCamera mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(34, 17));
    }];
    [self.KLibarySwtich mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.KCamera.mas_centerY);
        make.right.mas_equalTo(self.KCamera.mas_left).offset(-70);
    }];
    [self.KCroppingSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.KCamera.mas_centerY);
        make.left.mas_equalTo(self.KCamera.mas_right).offset(70);
    }];
    [self.KlibrayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.KLibarySwtich.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(68, 17));
        make.top.mas_equalTo(self.KCroppingSwitch.mas_bottom).offset(15);

    }];
    [self.KCroppingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.KCroppingSwitch.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(68, 17));
        make.top.mas_equalTo(self.KCroppingSwitch.mas_bottom).offset(15);
    }];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)kkkkk:(id)sender {
    ALCameraViewController *kk=[[ALCameraViewController alloc]initWithCroppingEnabled:self.IsOpneCropping allowsLibraryAccess:self.IsOpneLibrary completion:^(UIImage * sss, PHAsset * kkk) {
        self.Kimage.image=sss;
        [self dismissViewControllerAnimated:YES completion:nil];

    }];

    
    
    
    [self presentViewController:kk animated:YES completion:nil];
}
- (IBAction)KLibrary:(id)sender {
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    if (isButtonOn) {
        NSLog(@"我点击了switch，设置self.IsOpneLibrary= YES");
        NSLog(@"self.IsOpneLibrary %d",self.IsOpneLibrary);
        self.IsOpneLibrary= YES;
    }else {
        self.IsOpneLibrary= NO;
        NSLog(@"self.IsOpneLibrary %d",self.IsOpneLibrary);

    }
}

- (IBAction)KCropping:(id)sender {
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    if (isButtonOn) {
        NSLog(@"我点击了switch，设置self.IsOpneCropping= YES");
        NSLog(@"self.IsOpneLibrary %d",self.IsOpneCropping);
        self.IsOpneCropping= YES;
    }else {
        self.IsOpneCropping= NO;
        NSLog(@"self.IsOpneLibrary %d",self.IsOpneCropping);
        
    }

}
@end
