//
//  WallpaperMakerTools.h
//  WallpaperMaker
//
//  Created by dd on 14/11/9.
//  Copyright (c) 2014年 yangxd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  工具类
 */
@interface WallpaperMakerTools : NSObject

/**
 *  将一个view保存成图片
 *
 *  @param view      需要保存的view
 *
 */
+ (void) saveImageWithView:(UIView *)view;


@end
