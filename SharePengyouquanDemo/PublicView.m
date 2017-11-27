//
//  PublicMethod.m
//  Dajiankang
//
//  Created by anson on 16/10/8.
//  Copyright © 2016年 hyj. All rights reserved.
//

#import "PublicView.h"
#import "ZYHeader.h"
@implementation PublicView
//创建Label
+ (UILabel *)setupLabel:(CGRect)frame withText:(NSString *)text withFontSizde:(CGFloat)fontSize withTextColor:(UIColor *)color
{
    UILabel *lab = [[UILabel alloc] initWithFrame:frame];
//    lab.numberOfLines = 0;
    lab.adjustsFontSizeToFitWidth = YES;
    lab.textColor = color;
    lab.font = [UIFont systemFontOfSize:fontSize];
    lab.text = text;
    return lab;
}
//创建Label
+ (UILabel *)setupBoldLabel:(CGRect)frame withText:(NSString *)text withFontSizde:(CGFloat)fontSize withTextColor:(UIColor *)color
{
    UILabel *lab = [[UILabel alloc] initWithFrame:frame];
    lab.numberOfLines = 0;
    lab.adjustsFontSizeToFitWidth = YES;
    lab.textColor = color;
    lab.font =  [UIFont boldSystemFontOfSize:fontSize];
    lab.text = text;
    return lab;
}
//label基本属性，无自适应和换行
+ (UILabel *)setupLabelNOadjust:(CGRect)frame withText:(NSString *)text withFontSizde:(CGFloat)fontSize withTextColor:(UIColor *)color
{

    UILabel *lab = [[UILabel alloc] initWithFrame:frame];
    lab.textColor = color;
    lab.font =  [UIFont systemFontOfSize:fontSize];
    lab.text = text;
    return lab;

}
//创建button背景图片的方法
+ (UIButton *)setupButton:(CGRect)frame withFontSize:(CGFloat)fontSize withBGColor:(UIColor *)bgColor withTitle:(NSString *)str withTitleColor:(UIColor *)color withImage:(UIImage *)image withLayerRound:(CGFloat)round
{
    UIButton *setupBtn = [[UIButton alloc] initWithFrame:frame];
    setupBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    if (str != nil) {
        [setupBtn setTitle:str forState:UIControlStateNormal];
    }
    if (color != nil) {
        [setupBtn setTitleColor:color forState:UIControlStateNormal];
    }
    
    if (image != nil) {

        [setupBtn setBackgroundImage:image forState:UIControlStateNormal];
    }
    if (bgColor != nil) {
        setupBtn.backgroundColor = bgColor;
    }
    
    setupBtn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    setupBtn.titleLabel.textAlignment= NSTextAlignmentCenter;
    setupBtn.layer.cornerRadius = round;
    setupBtn.layer.masksToBounds = YES;
    return setupBtn;
    
}
#pragma mark textView创建方法
+(UITextView *)creatTextView:(CGRect)frame withText:(NSString *)text withTextColor:(UIColor *)textcolor withFontSize:(CGFloat)fontSize withBackgroundColor:(UIColor *)bgcolor 
{
   UITextView *textView=[[UITextView alloc] initWithFrame:frame]; //初始化大小并自动释放
    if(textcolor !=nil){
    textView.textColor = textcolor ;//设置textview里面的字体颜色
    }
    
    if(bgcolor !=nil){
    textView.backgroundColor =bgcolor ;//设置它的背景颜色
    }
    if(text !=nil){
    textView.text = text;//设置它显示的内容
    }
    
    textView.font = [UIFont systemFontOfSize:fontSize];//设置字体名字和字体大小
    
    return textView;
}
//button上添加图片的方法
+ (UIButton *)creatButton:(CGRect)frame withFontSize:(CGFloat)fontSize withBGColor:(UIColor *)bgColor withTitle:(NSString *)str withTitleColor:(UIColor *)color withsetImage:(UIImage *)setimage withLayerRound:(CGFloat)round
{
    UIButton *setupBtn = [[UIButton alloc] initWithFrame:frame];
    if (str != nil) {
        [setupBtn setTitle:str forState:UIControlStateNormal];
    }
    if (color != nil) {
        [setupBtn setTitleColor:color forState:UIControlStateNormal];
    }
    if (setimage != nil) {
        [setupBtn setImage:setimage forState:UIControlStateNormal];
    }
    if (bgColor != nil) {
        setupBtn.backgroundColor = bgColor;
    }
    setupBtn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    setupBtn.titleLabel.textAlignment= NSTextAlignmentCenter;
    setupBtn.layer.cornerRadius = round;
    setupBtn.layer.masksToBounds = YES;
    
    return setupBtn;
}

+(UIButton *)createButtonWithImageOnly:(CGRect)frame normalImage:(UIImage *)image selectedImage:(UIImage *)selectImage bgColor:(UIColor *)bgcolor {
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    if (bgcolor) {
        button.backgroundColor = bgcolor;
    }
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
    }
    if (selectImage) {
        [button setImage:selectImage forState:UIControlStateSelected];
    }
    return button;
    
}
+(UITextField *)createTextFieldWithFrame:(CGRect)rect backgroundColor:(UIColor *)color borderStyle:(UITextBorderStyle)borderStyle placeholder:(NSString *)placeholder text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textalignment:(NSTextAlignment )alignment
{
    
    UITextField *textField=[[UITextField alloc]initWithFrame:CGRectMake(rect.origin.x, rect.origin.y+1, rect.size.width, rect.size.height)];
    
    [textField setBackgroundColor:color];
    [textField setBorderStyle:borderStyle];
    [textField setPlaceholder:placeholder];
    if (text) {
        [textField setText:text];

    }
    if (font) {
        [textField setFont:font];

    }else{
        [textField setFont:kFont(FontBig)];
    }
    if (textColor) {
        [textField setTextColor:textColor];

    }else{
        [textField setTextColor:FTDarkGray];
    }
    if (alignment) {
         [textField setTextAlignment:alignment];
    }
   
    return textField;
}



//获取当前时间
+ (NSString *)getNowTimeStr {
    
    NSDate *date = [NSDate date]; // 获得时间对象
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone]; // 获得系统的时区
    
    NSTimeInterval time = [zone secondsFromGMTForDate:date];// 以秒为单位返回当前时间与系统格林尼治时间的差
    
    NSDate *dateNow = [date dateByAddingTimeInterval:time];// 然后把差的时间加上,就是当前系统准确的时间
    
    NSDateFormatter *startFormatter = [[NSDateFormatter alloc] init];
    [startFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *dateStr = [startFormatter stringFromDate:dateNow];
    
    return dateStr;
}
//获取字符串的宽度
+(CGFloat)widthOfString:(NSString *)string font:(UIFont *)font height:(CGFloat)height
{
    NSDictionary * dict=[NSDictionary dictionaryWithObject: font forKey:NSFontAttributeName];
    CGRect rect=[string boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    return rect.size.width;
}
+ (NSString *)dateTimeDifferenceWithStartTime:(NSString *)startTime endTime:(NSString *)endTime{
    NSDateFormatter *date = [[NSDateFormatter alloc]init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *startD =[date dateFromString:startTime];
    NSDate *endD = [date dateFromString:endTime];
    NSTimeInterval start = [startD timeIntervalSince1970]*1;
    NSTimeInterval end = [endD timeIntervalSince1970]*1;
    NSTimeInterval value = end - start;
    int second = (int)value %60;//秒
    int minute = (int)value /60%60;
    int house = (int)value / (24 * 3600)%3600;
   int day = (int)value / (24 * 3600);
    NSString *str;
    if (day != 0) {
        str = [NSString stringWithFormat:@"%d天%d小时%d分%d秒",day,house,minute,second];
    }else if ( house != 0) {
        str = [NSString stringWithFormat:@"%d小时%d分%d秒",house,minute,second];
    }else if (day== 0 && house== 0 && minute!=0) {
        str = [NSString stringWithFormat:@"%d分%d秒",minute,second];
    }else{
        str = [NSString stringWithFormat:@"%d秒",second];
    }
    return str;
}
+ (NSString *)countDaysFromNowToTime:(NSString *)endTime{
    
    if(endTime.length==0){
        return @"";
    }
    NSDateFormatter *date = [[NSDateFormatter alloc]init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *startD =[NSDate date];
    NSDate *endD = [date dateFromString:endTime];
    NSTimeInterval start = [startD timeIntervalSince1970]*1;
    NSTimeInterval end = [endD timeIntervalSince1970]*1;
    NSTimeInterval value = end - start;
//    int second = (int)value %60;//秒
//    int minute = (int)value /60%60;
//    int house = (int)value / (24 * 3600)%3600;
    int day = (int)value / (24 * 3600);
//    NSString *str;
    if (day > 0) {
        return [NSString stringWithFormat:@"%d",day];
    }else{
//        return @"今";
        return @"";

    }
    
}


//根据时间戳计算剩余时间
+ (NSString *)TheCountdown:(NSString *)timestamp {
    
    NSTimeInterval time=[timestamp doubleValue];
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *msEndDate = [dateFormatter stringFromDate: detaildate];
    
    NSRange Yearrange={0,4};
    NSRange Monthrange = {5,2};
    NSRange Dayrange = {8,2};
    NSRange Hourrange = {11,2};
    NSRange Minuterange = {14,2};
    NSRange Secondrange = {17,2};
    
    NSString *YearTimer=[msEndDate substringWithRange:Yearrange];
    NSString *MonthTimer=[msEndDate substringWithRange:Monthrange];
    NSString *DayTimer=[msEndDate substringWithRange:Dayrange];
    NSString *HourTimer=[msEndDate substringWithRange:Hourrange];
    NSString *MinuteTimer=[msEndDate substringWithRange:Minuterange];
    NSString *SecondTimer=[msEndDate substringWithRange:Secondrange];
    
    NSCalendar *cal = [NSCalendar currentCalendar];//定义一个NSCalendar对象
    NSDateComponents *shibo = [[NSDateComponents alloc] init];//初始化目标时间
    [shibo setYear:[YearTimer intValue]];
    [shibo setMonth:[MonthTimer intValue]];
    [shibo setDay:[DayTimer intValue]];
    [shibo setHour:[HourTimer intValue]];
    [shibo setMinute:[MinuteTimer intValue]];
    [shibo setSecond:[SecondTimer intValue]];
    
    [cal setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    NSDate *todate = [cal dateFromComponents:shibo];//把目标时间装载入date
    
    NSDate *today = [NSDate date];//得到当前时间
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    
    NSInteger interval = [zone secondsFromGMTForDate: today];
    
    NSDate *localDate = [today  dateByAddingTimeInterval: interval];
    
    //用来得到具体的时差
    unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour |NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *d = [cal components:unitFlags fromDate:localDate toDate:todate options:0];
    
    NSString *minute = [NSString stringWithFormat:@"%ld",(long)[d minute]];
    NSString *second = [NSString stringWithFormat:@"%ld",(long)[d second]];
    NSInteger hours = [d day] * 24 + [d hour];
    NSString *hour = [NSString stringWithFormat:@"%ld",(long)hours];
    
    //时
    if ([hour length] == 1){
        hour = [NSString stringWithFormat:@"0%@",hour];
    }
    //分
    if ([minute length] == 1){
        minute = [NSString stringWithFormat:@"0%@",minute];
    }
    //秒
    if ([second length] == 1){
        second = [NSString stringWithFormat:@"0%@",second];
    }
    
    
    NSString *theendtime = [NSString stringWithFormat:@"%@:%@:%@",hour,minute,second];
    return theendtime;
}

///产生随机字符串
+ (NSString *)generateTradeNO
{
    static int kNumber = 15;
    //    ABCDEFGHIJKLMNOPQRST
    NSString *sourceStr = @"0123456789abcdefghijklmnopqrst";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand(time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}
//字符串转图片
+(UIImage *)Base64StrToUIImage:(NSString *)_encodedImageStr
{
    NSData *_decodedImageData   = [[NSData alloc] initWithBase64Encoding:_encodedImageStr];
    UIImage *_decodedImage      = [UIImage imageWithData:_decodedImageData];
    return _decodedImage;
}
//设置label行间距
+ (void)setupLinePaceWithLabel:(UILabel *)label withLineSpace:(float)lineSpace
{
    if (label.text.length > 0) {
        NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc]initWithString:label.text];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        [paragraphStyle setLineSpacing:lineSpace];
        [attributeStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributeStr.length)];
        label.attributedText = attributeStr;
        //    NSDictionary *attributes = @{NSFontAttributeName:label.font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    }
    
}

//动态返回自定义样式label的高度
+ (CGFloat)getTextLabelHeight:(CGFloat)labelWith WithText:(NSString *)str WithFont:(UIFont *)font withLineSapce:(float)lineSapce

{
//    str = [PublicMethod builtDataString:str];
    if (str.length > 0) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWith, 0)];
        label.numberOfLines = 0;
        label.font = font;
        
        NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc]initWithString:str];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        [paragraphStyle setLineSpacing:lineSapce];
        
        //    [paragraphStyle setLineSpacing:10];//（此处指定行间距10，可以自定义）
            
        [attributeStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributeStr.length)];
        label.attributedText = attributeStr;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
        CGRect rect = [label.text boundingRectWithSize:label.frame.size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
        return rect.size.height;
    }else{
        return 0.0;
    }
    
    
}
//动态返回系统默认样式label的高度
+ (CGFloat)getLabelHeight:(CGFloat)labelWith WithText:(NSString *)str WithFont:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWith, 0)];
    label.numberOfLines = 0;
    label.font = font;
    label.text = str;
    NSDictionary *attributes = @{NSFontAttributeName:font};
    
    CGRect rect = [label.text boundingRectWithSize:label.frame.size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    return rect.size.height;
}
#pragma mark 去掉null等字符
+ (NSString *)builtDataString:(id)dataStr
{
    if ([dataStr isEqual:[NSNull null]]) {
        return @"";
    }else if ([dataStr isKindOfClass:[NSNull class]]){
        return @"";
    }else if (dataStr == nil){
        return @"";
    }else if ([dataStr isKindOfClass:[NSString class]]) {
        if ([dataStr isEqualToString:@"<null>"] || [dataStr isEqualToString:@"(null)"]) {
            return @"";
        }else{
            return  dataStr;
        }
    }else if ([dataStr isKindOfClass:[NSNumber class]])
    {
        return [NSString stringWithFormat:@"%@",dataStr];;
    }
    else{
        return dataStr;
    }
}
/**
 app版本比对
 

@param localVer 本地版本
@param appVer 服务器版本
@return appVer>localVer?Yes:No
*/
+ (BOOL)compareVerLocal:(NSString* )localVer app:(NSString* )appVer
{
    NSString* local = [localVer stringByReplacingOccurrencesOfString:@"." withString:@""];
    NSString* app = [appVer stringByReplacingOccurrencesOfString:@"." withString:@""];
    NSInteger num = abs(local.length-app.length);
    for(NSInteger i=0; i<num; i++){
        if(local.length>app.length){
            app = [app stringByAppendingString:@"0"];
        }else{
            local = [local stringByAppendingString:@"0"];
        }
    }
    return [app integerValue]>[local integerValue]?YES:NO;
}

@end
