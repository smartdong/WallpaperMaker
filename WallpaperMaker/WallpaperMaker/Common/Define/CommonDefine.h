//
//  CommonDefine.h
//
//  Created by Yang Xudong .
//  Copyright (c) 2014年 Mac. All rights reserved.
//

/*--------------------------------开发中常用到的宏定义--------------------------------------*/

//系统目录
#define kDocuments  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
#define kCaches     [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]
#define kLibrary    [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define kTemp       [NSString stringWithFormat:@"%@/temp", kCaches]

//方法简写
#define mApplication        [UIApplication sharedApplication]
#define mAppDelegate        (AppDelegate *)[[UIApplication sharedApplication] delegate]
#define mWindow             [[[UIApplication sharedApplication] windows] lastObject]
#define mKeyWindow          [[UIApplication sharedApplication] keyWindow]
#define mUserDefaults       [NSUserDefaults standardUserDefaults]
#define mNotificationCenter [NSNotificationCenter defaultCenter]

//加载图片
#define mImageByName(name)        [UIImage imageNamed:name]
#define mImageByPath(name, ext)   [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:name ofType:ext]]

//根据数字生成字符串
#define mNSStringByInt(value)       [NSString stringWithFormat:@"%d",value]
#define mNSStringByDouble(value)    [NSString stringWithFormat:@"%f",value]


//生成cgpoint生成字符串 、 cgsize 、 cgrect
#define mNSStringWithCGPoint(x, y)                  NSStringFromCGPoint(CGPointMake(x, y))
#define mNSStringWithCGSize(width, height)          NSStringFromCGSize(CGSizeMake(width, height))
#define mNSStringWithCGRect(x, y, width, height)    NSStringFromCGRect(CGRectMake(x, y, width, height))

//根据字符串生成cgpoint 、 cgsize 、 cgrect
#define mCGPointWithNSString(string)                CGPointFromString(string)
#define mCGSizeWithNSString(string)                 CGSizeFromString(string)
#define mCGRectWithNSString(string)                 CGRectFromString(string)


//以tag读取View
#define mViewByTag(parentView, tag, Class)  (Class *)[parentView viewWithTag:tag]
//读取Xib文件的类
#define mViewByNib(Class, owner) [[[NSBundle mainBundle] loadNibNamed:Class owner:owner options:nil] lastObject]

//id对象与NSData之间转换
#define mObjectToData(object)   [NSKeyedArchiver archivedDataWithRootObject:object]
#define mDataToObject(data)     [NSKeyedUnarchiver unarchiveObjectWithData:data]

//度弧度转换
#define mDegreesToRadian(x)      (M_PI * (x) / 180.0)
#define mRadianToDegrees(radian) (radian*180.0) / (M_PI)

//生成颜色
#define mRGBColor(r, g, b)          [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define mRGBAColor(r, g, b, a)      [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


//GCD相关方法
#define kGCDBackground(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define kGCDMain(block)       dispatch_async(dispatch_get_main_queue(),block)


//简单的以AlertView显示提示信息
#define mAlertView(title, msg) \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil \
cancelButtonTitle:@"确定" \
otherButtonTitles:nil]; \
[alert show];

#define mAlertViewWithDelegate(title, msg, dlg) \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:dlg \
cancelButtonTitle:@"确定" \
otherButtonTitles:nil]; \
[alert show];

#define mAlertViewWithTag(title, msg, dlg, tg) \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:dlg \
cancelButtonTitle:@"确定" \
otherButtonTitles:nil]; \
alert.tag = tg; \
[alert show];

#define mAlertViewWithButtonTitle(title, msg, dlg, tg, cancelTitle, comfirmTitle) \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:dlg \
cancelButtonTitle:cancelTitle \
otherButtonTitles:comfirmTitle,nil]; \
alert.tag = tg; \
[alert show];


//当前设备的系统版本
#define mSystemVersion          ([[[UIDevice currentDevice] systemVersion] floatValue])

//屏幕尺寸
#define mScreenWidth          ([UIScreen mainScreen].bounds.size.width)
#define mScreenHeight         ([UIScreen mainScreen].bounds.size.height)


//触摸点在视图中的位置
#define TouchPointInView(view) [((UITouch *)[[[event allTouches] allObjects] firstObject]) locationInView:view]


