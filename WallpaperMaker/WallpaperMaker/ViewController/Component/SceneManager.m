//
//  SceneManager.m
//  WallpaperMaker
//
//  Created by dd on 14/11/9.
//  Copyright (c) 2014年 yangxd. All rights reserved.
//

#import "SceneManager.h"
#import "SceneView.h"
#import "SloganMessage.h"

@implementation SceneManager

+(SceneView *)createScene{
    return [SceneView sceneView];
}

+(SceneView *)createSceneWithSize:(CGSize)size{
    return [SceneView sceneViewWithSize:size];
}

+(SloganMessage *)createSloganMessage{
    return [SloganMessage sloganMessage];
}

@end
