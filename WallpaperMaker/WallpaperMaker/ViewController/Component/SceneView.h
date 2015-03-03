//
//  SceneView.h
//  WallpaperMaker
//
//  Created by dd on 14/11/9.
//  Copyright (c) 2014年 yangxd. All rights reserved.
//

#import "BaseView.h"

/**
 *  壁纸的画布
 */
@interface SceneView : BaseView

/**
 *  新建一个壁纸 默认使用屏幕尺寸
 *
 *  @return 壁纸画布
 */
+ (SceneView *)sceneView;

/**
 *  新建一个壁纸
 *
 *  @param size 壁纸尺寸
 *
 *  @return 壁纸画布
 */
+ (SceneView *)sceneViewWithSize:(CGSize)size;

@end
