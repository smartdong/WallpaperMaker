//
//  Slogan.m
//  WallpaperMaker
//
//  Created by YangXudong on 15/5/31.
//  Copyright (c) 2015年 yangxd. All rights reserved.
//

#define Slogan_Default_Width        100

#define Slogan_Default_Height       50


#import "Slogan.h"
#import "WallpaperMakerDefine.h"
#import "CommonDefine.h"

@interface Slogan ()

@end

@implementation Slogan

+(Slogan *)slogan {
    
    UITextField *lable = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, Slogan_Default_Width - 10, Slogan_Default_Height)];
    [lable setClipsToBounds:YES];
    [lable setAutoresizingMask:(UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin)];
    [lable setText:@""];
    [lable setTextColor:[UIColor whiteColor]];
    [lable sizeToFit];
    
    Slogan *slogan = [[Slogan alloc] initWithFrame:CGRectMake((mScreenWidth-Slogan_Default_Width)/2, 100, Slogan_Default_Width, Slogan_Default_Height)];
    [slogan setAutoresizingMask:(UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth)];
    [slogan setShowContentShadow:NO];
    [slogan setTextView:lable];
    [slogan setFontSize:21.0];
    [slogan sizeToFit];
    
    [[NSNotificationCenter defaultCenter] addObserver:slogan selector:@selector(action_recieveNotificationMainBackgroundTouched) name:Notification_Main_Backgroud_Touched_Event object:nil];
    
    return slogan;
}

- (void) action_recieveNotificationMainBackgroundTouched {
    [self hideEditingHandles];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
