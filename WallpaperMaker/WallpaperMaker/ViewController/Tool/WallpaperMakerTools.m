//
//  WallpaperMakerTools.m
//  WallpaperMaker
//
//  Created by dd on 14/11/9.
//  Copyright (c) 2014年 yangxd. All rights reserved.
//

#import "WallpaperMakerTools.h"

@interface WallpaperMakerTools()<UIImagePickerControllerDelegate>

@end

@implementation WallpaperMakerTools

+(void)saveImageWithView:(UIView *)view{
    
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [UIScreen mainScreen].scale);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(viewImage, [WallpaperMakerTools sharedInstance], @selector(image:didFinishSavingWithError:contextInfo:), nil);
}


- (void) image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    
    if (error) {
        NSLog(@"error");
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"保存失败"
                                                     message:error.description
                                                    delegate:nil
                                           cancelButtonTitle:@"确定"
                                           otherButtonTitles:nil];
        [av show];
    } else {
        NSLog(@"success");
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"保存成功"
                                                     message:nil
                                                    delegate:nil
                                           cancelButtonTitle:@"确定"
                                           otherButtonTitles:nil];
        [av show];
    }
    
}


+ (WallpaperMakerTools *) sharedInstance {
    
    static WallpaperMakerTools *tools = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        tools = [WallpaperMakerTools new];
        
    });
    
    return tools;
}

@end
