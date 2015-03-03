//
//  HomeViewController.m
//  WallpaperMaker
//
//  Created by dd on 14/11/9.
//  Copyright (c) 2014年 yangxd. All rights reserved.
//

#import "HomeViewController.h"
#import "SceneManager.h"
#import "SceneView.h"
#import "WallpaperMakerTools.h"
#import "CommonDefine.h"
#import "WallpaperMakerDefine.h"
#import "SloganMessage.h"

//当前没有壁纸
//#define Tag_alert_view_no_wallpaper                 910001



@interface HomeViewController ()<UIAlertViewDelegate>

/**
 *  当前的壁纸
 */
@property(nonatomic,strong) SceneView *view_scene;

/**
 *  作为容器的scroll view
 */
@property (weak, nonatomic) IBOutlet UIScrollView *clv_contentView;

/**
 *  新建按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *btn_createButton;

/**
 *  保存按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *btn_saveButton;

/**
 *  添加标签
 */
@property (weak, nonatomic) IBOutlet UIButton *btn_addSlogan;

/**
 *  删除标签
 */
@property (weak, nonatomic) IBOutlet UIButton *btn_deleteSlogan;



////////////////////////////////////////////////////////////////

/**
 *  当前选中的标语
 */
@property (nonatomic , strong) SloganMessage *currentSlogan;


@end

@implementation HomeViewController




#pragma mark - Alert View Delegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    switch (alertView.tag) {
//        case Tag_alert_view_no_wallpaper:
//        {
//            //没有壁纸
//            
//            if (buttonIndex == 0) {
//                //不保存
//                
//            }else{
//                //新建
//                [self action_createNewScene];
//            }
//            
//        }
            break;
            
        default:
            break;
    }
}

#pragma mark - Button Action

/**
 *  创建一个新壁纸
 */
- (IBAction)action_createNewScene{
    
    //如果当前有正在制作的壁纸 则提示保存
    if (self.view_scene) {
        
        //提示保存
//        mAlertViewWithButtonTitle(Define_alert_view_title, @"当前", <#dlg#>, <#tg#>, <#cancelTitle#>, <#comfirmTitle#>)
        
        [self.view_scene removeFromSuperview];
        self.view_scene = nil;
        
        [self action_enableCreateSloganButton:NO];
        [self action_enableDeleteSloganButton:NO];
        [self action_enableSaveButton:NO];
        
    }else{
        
        //创建新壁纸
        self.view_scene = [SceneManager createScene];
        
        [self.clv_contentView addSubview:self.view_scene];
        
        self.clv_contentView.contentSize = self.view_scene.frame.size;
        
        [self action_enableSaveButton:YES];
        
        [self action_enableCreateSloganButton:YES];
    }
}

/**
 *  保存壁纸
 */
- (IBAction)action_saveScene {
    
    //如果当前存在正在编辑的壁纸
    if (self.view_scene) {
        //保存     
        [WallpaperMakerTools saveImageWithView:self.view_scene];
    }
}

/**
 *  添加标签
 */
- (IBAction)action_addSlogan {
    [self.view_scene addSubview:[SceneManager createSloganMessage]];
}

/**
 *  删除标签
 */
- (IBAction)action_deleteSlogan {
    
    [self.currentSlogan endEditing:YES];
    
    [self.currentSlogan removeFromSuperview];
    
    self.currentSlogan = nil;
}


#pragma mark - Common

/**
 *  设置保存按钮状态
 */
-(void)action_enableSaveButton:(BOOL)isEnable{
    [self action_enableButton:_btn_saveButton isEnable:isEnable];
}

/**
 *  设置删除标签按钮状态
 */
-(void)action_enableDeleteSloganButton:(BOOL)isEnable{
    [self action_enableButton:_btn_deleteSlogan isEnable:isEnable];
}

/**
 *  设置添加标签按钮状态
 */
-(void)action_enableCreateSloganButton:(BOOL)isEnable {
    [self action_enableButton:_btn_addSlogan isEnable:isEnable];
}

/**
 *  设置按钮是否可用
 *
 *  @param button   按钮
 *  @param isEnable 是否可用
 */
- (void) action_enableButton:(UIButton *)button isEnable:(BOOL)isEnable {

    if (isEnable) {
        button.enabled = YES;
        button.alpha = 1;
    }else{
        button.enabled = NO;
        button.alpha = 0.3;
    }
}


//接收通知  选中某条标语
- (void) action_receiveSelectedSloganNotification:(NSNotification *)notification {
    
    self.currentSlogan = notification.object;
    
    [self action_enableDeleteSloganButton:YES];
}

//接收通知  取消选中某条标语
- (void) action_receiveDeselectedSloganNotification:(NSNotification *)notification {
    
    [self action_enableDeleteSloganButton:NO];
}


#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //当前没有可以保存的图片
    [self action_enableSaveButton:NO];
    //当前没有选择标签  无法删除
    [self action_enableDeleteSloganButton:NO];
    //当前没有壁纸 不能添加标签
    [self action_enableCreateSloganButton:NO];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(action_receiveSelectedSloganNotification:)
                                                 name:Define_Notification_Selected_Slogan
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(action_receiveDeselectedSloganNotification:)
                                                 name:Define_Notification_Deselected_Slogan
                                               object:nil];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
