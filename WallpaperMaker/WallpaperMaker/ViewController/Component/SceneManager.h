//
//  SceneManager.h
//  WallpaperMaker
//
//  Created by dd on 14/11/9.
//  Copyright (c) 2014年 yangxd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SceneView;
@class SloganMessage;

/**
 *  管理壁纸以及标语 (新建)
 */
@interface SceneManager : NSObject

/**
 *  新建一个壁纸 默认使用屏幕尺寸
 *
 *  @return 壁纸画布
 */
+ (SceneView *) createScene;

/**
 *  新建一个壁纸
 *
 *  @param size 壁纸尺寸
 *
 *  @return 壁纸画布
 */
+ (SceneView *) createSceneWithSize:(CGSize)size;

/**
 *  新建一个标语信息
 *
 *  @return 生成的标语信息view
 */
+ (SloganMessage *) createSloganMessage;


@end
