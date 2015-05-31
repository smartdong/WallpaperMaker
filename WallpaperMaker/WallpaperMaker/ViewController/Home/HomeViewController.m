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

@interface HomeViewController ()<UIAlertViewDelegate>

/**
 *  当前的壁纸
 */
@property(nonatomic,strong) SceneView *view_scene;

/**
 *  作为容器的scroll view
 */
@property (weak, nonatomic) IBOutlet UIScrollView *slv_contentView;

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



////////////////////////////////////////////////////////////////


@end

@implementation HomeViewController




#pragma mark - Button Action

/**
 *  创建一个新壁纸
 */
- (IBAction)action_createNewScene{
    
    //如果当前有正在制作的壁纸 则提示保存
    if (self.view_scene) {
        
        [self.view_scene removeFromSuperview];
        self.view_scene = nil;
        
        [self action_enableCreateSloganButton:NO];
        [self action_enableSaveButton:NO];
        
        [self action_createNewScene];
        
    }else{
        
        //创建新壁纸
        self.view_scene = [SceneManager createScene];
        
        [self.slv_contentView addSubview:self.view_scene];
        
        self.slv_contentView.contentSize = self.view_scene.frame.size;
        
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
    [self.view_scene addSubview:(UIView *)[SceneManager createSlogan]];
}


#pragma mark - Common

/**
 *  设置保存按钮状态
 */
-(void)action_enableSaveButton:(BOOL)isEnable{
    [self action_enableButton:_btn_saveButton isEnable:isEnable];
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

- (IBAction) action_backgroundTouchAction {
    //以后可以把当前所有标签的array作为object传过去  让标签自己从array中移除 然后再从super view中移除
    [[NSNotificationCenter defaultCenter] postNotificationName:Notification_Main_Backgroud_Touched_Event object:nil];
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //当前没有可以保存的图片
    [self action_enableSaveButton:NO];
    //当前没有壁纸 不能添加标签
    [self action_enableCreateSloganButton:NO];
    
}

@end
