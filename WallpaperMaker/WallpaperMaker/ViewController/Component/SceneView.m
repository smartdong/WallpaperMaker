//
//  SceneView.m
//  WallpaperMaker
//
//  Created by dd on 14/11/9.
//  Copyright (c) 2014年 yangxd. All rights reserved.
//

#import "SceneView.h"
#import "WallpaperMakerDefine.h"
#import "CommonDefine.h"

@implementation SceneView

+ (SceneView *)sceneView {
    return [SceneView sceneViewWithSize:CGSizeMake(mScreenWidth, mScreenHeight)];
}

+ (SceneView *)sceneViewWithSize:(CGSize)size {
    
    SceneView *sv = [[SceneView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    sv.multipleTouchEnabled = YES;
    sv.backgroundColor = Define_scene_bakeground_color_default;
    
    return sv;
}

#pragma mark -

-(SceneView *)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self addTarget:self action:@selector(action_backgroundTouched) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return self;
}

/**
 *  背景被点击
 */
- (void) action_backgroundTouched{
    [self endEditing:YES];
}

@end
