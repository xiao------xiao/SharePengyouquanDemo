//
//  PublicMethod.h
//  Dajiankang
//
//  Created by anson on 16/10/8.
//  Copyright © 2016年 hyj. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>


@interface PublicView : NSObject


+(UIButton *)createButtonWithImageOnly:(CGRect)frame normalImage:(UIImage *)image selectedImage:(UIImage *)selectImage bgColor:(UIColor *)bgcolor;

//基本控件封装
+ (UILabel *)setupLabel:(CGRect)frame withText:(NSString *)text withFontSizde:(CGFloat)fontSize withTextColor:(UIColor *)color;
//加粗
+ (UILabel *)setupBoldLabel:(CGRect)frame withText:(NSString *)text withFontSizde:(CGFloat)fontSize withTextColor:(UIColor *)color;
//label基本属性，无自适应和换行
+ (UILabel *)setupLabelNOadjust:(CGRect)frame withText:(NSString *)text withFontSizde:(CGFloat)fontSize withTextColor:(UIColor *)color;
+ (UIButton *)setupButton:(CGRect)frame withFontSize:(CGFloat)fontSize withBGColor:(UIColor *)bgColor withTitle:(NSString *)str withTitleColor:(UIColor *)color withImage:(UIImage *)image withLayerRound:(CGFloat)round;
+(UITextView *)creatTextView:(CGRect)frame withText:(NSString *)text withTextColor:(UIColor *)color withFontSize:(CGFloat)fontSize withBackgroundColor:(UIColor *)color;

+(UITextField *)createTextFieldWithFrame:(CGRect)rect backgroundColor:(UIColor *)color borderStyle:(UITextBorderStyle)borderStyle placeholder:(NSString *)placeholder text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textalignment:(NSTextAlignment )alignment;
+ (UIButton *)creatButton:(CGRect)frame withFontSize:(CGFloat)fontSize withBGColor:(UIColor *)bgColor withTitle:(NSString *)str withTitleColor:(UIColor *)color withsetImage:(UIImage *)setimage withLayerRound:(CGFloat)round;
+ (NSString *)getNowTimeStr;
+ (CGFloat)widthOfString:(NSString *)string font:(UIFont *)font height:(CGFloat)height;


+ (NSString *)dateTimeDifferenceWithStartTime:(NSString *)startTime endTime:(NSString *)endTime;
//计算酒店入住的时间
+ (NSString *)countDaysFromNowToTime:(NSString *)endTime;
//根据时间戳计算剩余时间
+ (NSString *)TheCountdown:(NSString *)timestamp;

+ (NSString *)generateTradeNO;
+ (UIImage *)Base64StrToUIImage:(NSString *)_encodedImageStr;

+ (void)setupLinePaceWithLabel:(UILabel *)label withLineSpace:(float)lineSpace;
+ (CGFloat)getTextLabelHeight:(CGFloat)labelWith WithText:(NSString *)str WithFont:(UIFont *)font withLineSapce:(float)lineSapce;
+ (CGFloat)getLabelHeight:(CGFloat)labelWith WithText:(NSString *)str WithFont:(UIFont *)font;
+ (NSString *)builtDataString:(id)dataStr;
+ (BOOL)compareVerLocal:(NSString* )localVer app:(NSString* )appVer;
@end
