//
//  SloganMessage.m
//  WallpaperMaker
//
//  Created by dd on 14/11/9.
//  Copyright (c) 2014年 yangxd. All rights reserved.
//

#import "SloganMessage.h"
#import "CommonDefine.h"
#import "WallpaperMakerDefine.h"

/**
 *  默认标语宽度
 */
static const int SMSloganMessageBoundsWidthDefault = 132;

/**
 *  默认标语高度
 */
static const int SMSloganMessageBoundsHeightDefault = 30;

/**
 *  默认标语字体
 */
#define SMSloganMessageFontDefault                  [UIFont systemFontOfSize:25]

/**
 *  默认标语字体颜色
 */
#define SMSloganMessageTextColorDeafault            [UIColor whiteColor]

/**
 *  默认显示内容
 */
#define SMSloganMessagePlaceholderDefault           @"placeholder"

@interface SloganMessage ()<UITextFieldDelegate>

@property (nonatomic, assign) float currentRotation;

@property (nonatomic, assign) float currentScale;

@end

@implementation SloganMessage

#pragma mark - Delegate

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if ([string isEqualToString:@"\n"]) {
        
        [self endEditing:YES];

        return YES;
    }
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:Define_Notification_Selected_Slogan object:self];
    
    textField.layer.borderWidth = 1;
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    
    [self sizeToFit];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:Define_Notification_Deselected_Slogan object:self];
    
    textField.layer.borderWidth = 0;
}

- (void) textDidChanged {
    [self sizeToFit];
}

#pragma mark - Gesture

- (void) action_pan:(UIPanGestureRecognizer *)pan{
    
    CGPoint point = [pan translationInView:self.superview];
    
    CGRect selfFrame = self.frame;
    selfFrame.origin.x += point.x;
    selfFrame.origin.y += point.y;
    self.frame = selfFrame;
    
    [pan setTranslation:CGPointZero inView:self.superview];
}

- (void) action_rotation:(UIRotationGestureRecognizer *)rotation {
    
//    float tempRotation = self.currentScale + rotation.rotation;
//    
//    if (rotation.state == UIGestureRecognizerStateEnded){
//        self.currentRotation = tempRotation;
//    }
//    
//    [self action_makeTransformWithScale:self.currentScale rotation:tempRotation];
}

- (void) action_pinch:(UIPinchGestureRecognizer *)pinch {
    
    float tempScale = self.currentScale * pinch.scale;
    
    if (pinch.state == UIGestureRecognizerStateEnded){

        self.currentScale = tempScale;
    }
    
    [self action_makeTransformWithScale:tempScale rotation:self.currentRotation];
}

- (void) action_makeTransformWithScale:(float)scale rotation:(float)rotation {
    self.transform = CGAffineTransformConcat(CGAffineTransformMakeRotation(rotation), CGAffineTransformMakeScale(scale, scale));
}

///////////

- (void) action_addPanGesture {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(action_pan:)];
    pan.maximumNumberOfTouches = 1;
    pan.minimumNumberOfTouches = 1;
    [self addGestureRecognizer:pan];
}

- (void) action_addRotationGesture {
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(action_rotation:)];
    [self addGestureRecognizer:rotation];
}

- (void) action_addPinchGesture {
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(action_pinch:)];
    [self addGestureRecognizer:pinch];
}

#pragma mark -

+(SloganMessage *)sloganMessage {
    
    SloganMessage *sm       = [[SloganMessage alloc] initWithFrame:CGRectMake(0, 0, SMSloganMessageBoundsWidthDefault, SMSloganMessageBoundsHeightDefault)];
    sm.center               = CGPointMake(mScreenWidth/2, mScreenHeight/3);
    sm.placeholder          = SMSloganMessagePlaceholderDefault;
    sm.font                 = SMSloganMessageFontDefault;
    sm.textColor            = SMSloganMessageTextColorDeafault;
    sm.textAlignment        = NSTextAlignmentLeft;
    sm.backgroundColor      = [UIColor clearColor];
    sm.delegate             = sm;
    sm.multipleTouchEnabled = YES;
    sm.layer.borderColor    = [UIColor redColor].CGColor;
    sm.currentRotation      = 0;
    sm.currentScale         = 1;
    
    [sm becomeFirstResponder];
    
    [sm action_addPanGesture];
    [sm action_addRotationGesture];
    [sm action_addPinchGesture];
    
    [[NSNotificationCenter defaultCenter] addObserver:sm
                                             selector:@selector(textDidChanged)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:nil];
    
    return sm;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
