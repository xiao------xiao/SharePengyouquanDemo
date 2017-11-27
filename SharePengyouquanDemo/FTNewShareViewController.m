//
//  FTNewShareViewController.m
//  taiwubroker
//
//  Created by aliviya on 2017/11/13.
//  Copyright © 2017年 房途信息科技. All rights reserved.
//

#import "FTNewShareViewController.h"


#import "PublicView.h"
#import "LJDynamicItem.h"
#import "ZYHeader.h"
typedef NS_ENUM(NSUInteger,ImageMode) {
    ImageModeBig,
    ImageModeSmall
};

typedef NS_ENUM(NSUInteger,FooterViewState) {
    FooterViewStateTop,
    FooterViewStateBottom
};

static CGFloat rubberBandDistance(CGFloat offset, CGFloat dimension) {
    
    const CGFloat constant = 0.8f;
    CGFloat result = (constant * fabs(offset) * dimension) / (dimension + constant * fabs(offset));
    // The algorithm expects a positive offset, so we have to negate the result if the offset was negative.
    return offset < 0.0f ? -result : result;
}
@interface FTNewShareViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate,UIDynamicAnimatorDelegate>
{
 
    
    ImageMode imageMode;
    UITextView *txtvDes;
    
    UIImage *imageErweima;
    UIImage *imageBigErweima;
    UIImage *imageSmallErweima;
    NSMutableArray *imgvContainer;
    NSMutableArray *imgContainer; //存储 选择的照片
    
    UILabel *lblNumCount; // 当前选择的图片张数
    int picCount;
    int selectedImageCount; //选择的图片张数
    
    NSString *pasteBoardText; // 剪贴板文字
    
    UIView *footerView;//可以上下滑动的 下半部分 图片
    UIScrollView *imageContentView;
    float _lastPosition;
    
    
    FooterViewState footerviewState;
     __block BOOL isVertical;//是否是垂直
    
    
    CGPoint topCenter;
    CGPoint bottomCenter;
}
//弹性和惯性动画
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, weak)   UIDynamicItemBehavior *decelerationBehavior;
@property (nonatomic, strong) LJDynamicItem *dynamicItem;
@property (nonatomic, weak)   UIAttachmentBehavior *springBehavior;
@end

@implementation FTNewShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"分享到朋友圈";
    
    
    
    
}
-(void)createDescription{
 
    
    pasteBoardText = @"ddddfjsdfjoiwnefowijgowkfwkfwddd";
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self setupView];
    
    
    
    
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    
    return YES;
}


-(void)setupView{
    [self createDescription];

    
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.userInteractionEnabled = YES;
   
    float xmargin = 17;
    float contentW = KScreenWidth;
    float contentH = 450;

    UIView *headerContentView = [[UIView alloc] initWithFrame:CGRectMake(0,0, contentW, contentH)];
     headerContentView.backgroundColor = FTColor(249,249,249) ;

    
    
    [self.view  addSubview:headerContentView];
    
    
    
    
    UIImageView *portrait = [[UIImageView alloc] init];
    portrait.frame = CGRectMake(xmargin*KX, xmargin*KX, 40*KX, 40*KX);
    
    
    portrait.layer.masksToBounds = YES;
    portrait.layer.cornerRadius = 20 *KX;
    portrait.image = [UIImage imageNamed:@"我的默认头像"];
    [headerContentView addSubview:portrait];
    //名字
    

    
    
    
    UIButton *btnCopy = [PublicView creatButton:CGRectMake(contentW-60*KX-100, 26, 60, 20) withFontSize:FontBig withBGColor:[UIColor clearColor] withTitle:@"复制" withTitleColor:FTDarkGray withsetImage:nil withLayerRound:0];
    
    [btnCopy addTarget:self action:@selector(copyAction) forControlEvents:UIControlEventTouchUpInside];
    btnCopy.userInteractionEnabled = YES;
    [headerContentView addSubview:btnCopy];
    
       //发布按钮
    UIButton *btnSend = [PublicView creatButton:CGRectMake(contentW-60*KX-10, 17*KX, 60*KX, 40*KX) withFontSize:FontBig withBGColor:FTBlue withTitle:@"发布" withTitleColor:FTWhite withsetImage:nil withLayerRound:3];
    
    [btnSend addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
    btnSend.userInteractionEnabled = YES;
    [headerContentView addSubview:btnSend];
    
    
   
    UITextView *txtvDescription = [PublicView creatTextView:CGRectMake(17*KX,  17*KX+ 40*KX+10, contentW-2*17*KX, 450 -(17*KX+ 40*KX+10) -15) withText:pasteBoardText withTextColor:FTDarkGray withFontSize:FontBig withBackgroundColor:FTColor(255,255,255) ];
    
    txtvDescription.editable = YES;
    txtvDescription.userInteractionEnabled = YES;
    txtvDescription.layer.cornerRadius = 5;
    txtvDescription.layer.borderColor = FTLightLightGray.CGColor;
    txtvDescription.layer.borderWidth = 1;
    txtvDescription.delegate = self;
    [headerContentView addSubview:txtvDescription];
    
    //    txtvDescription.text = @"随时方便看房 性价比高\n 随时方便看房 性价比高";
    txtvDes = txtvDescription;
    txtvDes.text = pasteBoardText;
    
  
 
    
//    *******************************图片部分************************************
    float topMargin = 60;
    float footerHeight =KScreenWidth-64-topMargin;
    footerView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(headerContentView.frame), KScreenWidth, footerHeight)];
    footerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:footerView];
    footerviewState = FooterViewStateBottom;
    topCenter = CGPointMake(KScreenWidth/2, (footerHeight)/2+topMargin);
    bottomCenter = CGPointMake(KScreenWidth/2, footerView.frame.origin.y+footerView.frame.size.height/2);
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureRecognizerAction:)];
    
    pan.delegate = self;
    [footerView addGestureRecognizer:pan];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:footerView];
//    self.animator.delegate = self;
    self.dynamicItem = [[LJDynamicItem alloc] init];

    
    UIView *imgTop = [[UIView alloc] init];
    imgTop.frame = CGRectMake((KScreenWidth-40)/2, 7, 40, 8);
    imgTop.backgroundColor = FTLightLightGray;
    imgTop.layer.masksToBounds = YES;
    imgTop.layer.cornerRadius = 5;
    
    [footerView addSubview:imgTop];
    float height = 20;
//    height += 10;
    lblNumCount = [PublicView setupLabel:CGRectMake(10, height, 200, 21) withText:@"当前选择0张图片" withFontSizde:FontBig withTextColor:FTDarkGray];
    [footerView addSubview:lblNumCount];
    
    
//    UIImage *imageSelected = [UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e65a", 14.6*KX, Redkcolor)];
//    UIImage *imageUnselected = [UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e65a", 14.6*KX, corlor221)];
//    
//    
//    smallErweimaButton = [[RadioButton alloc] initWithFrame:CGRectMake(KScreenWidth - 90,height, 80, 20) withTitleString:@"小二维码" selectedImage:imageSelected unselectedImage:imageUnselected];
//     smallErweimaButton.lblTitle.textColor = FTDarkGray;
//    [smallErweimaButton addTarget:self action:@selector(SmallerweimaClicked:) forControlEvents:UIControlEventTouchUpInside];
//
//    [footerView addSubview:smallErweimaButton];
//    
//    
//    bigErweimaButton =[[RadioButton alloc] initWithFrame: CGRectMake(CGRectGetMinX(smallErweimaButton.frame)-110,height, 100, 20) withTitleString:@"大二维码" selectedImage:imageSelected unselectedImage:imageUnselected];
//    [bigErweimaButton addTarget:self action:@selector(BigErweimaClicked:) forControlEvents:UIControlEventTouchUpInside];
//
//    bigErweimaButton.lblTitle.textColor = FTDarkGray;
//
//    [footerView addSubview:bigErweimaButton];
    
//    if(imageMode == ImageModeBig){
//        bigErweimaButton.selected = YES;
//    }else{
//        smallErweimaButton.selected = YES;
//    }
    
    height +=21;
    height +=15;

    float imageWidth = KScreenWidth/3.0;
    float imageHeight = imageWidth;
 
    picCount = self.imageArray.count;
    
    int colTotal = (picCount+2)/3;
    
    
    imageContentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,height, KScreenWidth, footerHeight-height)];
    imageContentView.userInteractionEnabled = YES;   // 手势被scrollview 截取了后就不能传递到下面的footerview
    imageContentView.delegate = self;
    imageContentView.scrollEnabled = YES;
    imageContentView.alwaysBounceVertical = YES;
    imageContentView.contentSize = CGSizeMake(KScreenWidth- 40, imageHeight * colTotal);
    [footerView addSubview:imageContentView];
    
    height += imageContentView.frame.size.height;
    height += 40;
    
    imgvContainer = [[NSMutableArray alloc] init];
    //有多少个照片自动生成多少个
    imageMode = ImageModeBig;
    
    float margin= 2;
    for (int i = 0; i < picCount; i++) {
        
        int row = i/3;   //行
        int col = i%3;   // 列
        
        UIImageView *imgv = [[UIImageView alloc] initWithFrame:CGRectMake(col*imageWidth+margin,row*imageHeight+margin, imageWidth-2*margin, imageHeight-2*margin)];
        
        
        
            
   
//        imgv.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.imageArray[i]]]];
                      
        imgv.image = [UIImage imageNamed:@"123"];
        imgv.contentMode = UIViewContentModeScaleToFill;
        imgv.tag = 100+i;  //  100 -108 tag VALUE
        [imageContentView addSubview:imgv];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageview:)];
        [imgv addGestureRecognizer:tap];
        [imgvContainer addObject:imgv];
    }
    
}

#pragma mark- 手势滑动
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        UIPanGestureRecognizer *recognizer = (UIPanGestureRecognizer *)gestureRecognizer;
        CGFloat currentY = [recognizer translationInView:footerView].y;
        CGFloat currentX = [recognizer translationInView:footerView].x;
        
        if (currentY == 0.0) {
            return YES; //代表手势向下传递
        } else {
            if (fabs(currentX)/currentY >= 5.0) {
                return YES;
            } else {
                return NO;//代表手势不向下传递
            }
        }
    }
    
    
    return NO;
}

- (void)panGestureRecognizerAction:(UIPanGestureRecognizer *)recognizer {
    switch (recognizer.state) {
            case UIGestureRecognizerStateBegan:
        {
            
            CGFloat currentY = [recognizer translationInView:footerView].y;
            CGFloat currentX = [recognizer translationInView:footerView].x;
            
            
            if (currentY == 0.0) {
                if (currentX!=0.0) {
                    isVertical = NO;
                }else{
                    isVertical = YES;
                }
            } else {
                if (fabs(currentX)/currentY >= 5.0) {
                    isVertical = NO;
                } else {
                    isVertical = YES;
                }
            }
            [self.animator removeAllBehaviors];
            
        }
            break;
            case UIGestureRecognizerStateChanged:
        {
            //locationInView:获取到的是手指点击屏幕实时的坐标点；
            //translationInView：获取到的是手指移动后，在相对坐标中的偏移量
            
            if (isVertical) {
                //往上滑为负数，往下滑为正数
                CGFloat currentY = [recognizer translationInView:footerView].y;
                
                
                [self controlScrollForVertical:currentY AndState:UIGestureRecognizerStateChanged];
                NSLog(@"UIGestureRecognizerStateChanged");
            }
        }
            break;
            case UIGestureRecognizerStateCancelled:
            
            break;
            case UIGestureRecognizerStateEnded:
        {
            NSLog(@"UIGestureRecognizerStateEnded");
            
            __weak typeof(self) weakSelf = self;
            
            //velocity是在手势结束的时候获取的竖直方向的手势速度

            
            
            CGPoint velocity = [recognizer velocityInView:footerView];
            UIAttachmentBehavior *springBehavior=nil;
            CGPoint newCenter = footerView.center;
            newCenter.x = KScreenWidth/2;
            
            self.dynamicItem.center = newCenter;
            

                if (footerviewState == FooterViewStateTop) {
                    if (velocity.y>=0) {
                        springBehavior = [[UIAttachmentBehavior alloc] initWithItem:self.dynamicItem attachedToAnchor:bottomCenter];
                        footerviewState = FooterViewStateBottom;
                    }else{
                        springBehavior = [[UIAttachmentBehavior alloc] initWithItem:self.dynamicItem attachedToAnchor:topCenter];
                        footerviewState = FooterViewStateTop;
                    }
                }else{
                    if (velocity.y<=0) {
                        springBehavior = [[UIAttachmentBehavior alloc] initWithItem:self.dynamicItem attachedToAnchor:topCenter];
                        footerviewState = FooterViewStateTop;
                    }else{
                        
                        //                    return;
                        springBehavior = [[UIAttachmentBehavior alloc] initWithItem:self.dynamicItem attachedToAnchor:bottomCenter];
                        footerviewState = FooterViewStateBottom;
                    }
                }
//            }
            
            springBehavior.length = 0;
            springBehavior.damping = 1;
            springBehavior.frequency = 2;
            springBehavior.action = ^{
                
                CGPoint newCenter = weakSelf.dynamicItem.center;
                newCenter.x = KScreenWidth/2;
                
                footerView.center  = newCenter;
                
            };
            [self.animator addBehavior:springBehavior];
            self.springBehavior = springBehavior;
            
       
          
        }
            break;
        default:
            break;
    }
    //保证每次只是移动的距离，不是从头一直移动的距离
    [recognizer setTranslation:CGPointZero inView:self.view];
}


- (void)controlScrollForVertical:(CGFloat)detal AndState:(UIGestureRecognizerState)state {
    //判断是主ScrollView滚动还是子ScrollView滚动,detal为手指移动的距离
//    NSLog(@"controlScrollForVertical");
    if(detal==0){
        return;
    }
    
    CGPoint oldCenter = footerView.center;
    oldCenter.y += detal;
    
    footerView.center =oldCenter;

}



-(void)tapImageview:(UITapGestureRecognizer *)gesture{
    
//    
//    UIImageView *imageview = (UIImageView *)gesture.view;
//    int shangxianCount = 0;
//    if (imageMode == ImageModeBig) {
//        shangxianCount = 8;
//    }else {
//        shangxianCount = 9;
//    }
//    if (selectedImageCount == shangxianCount &&!imageview.check) {
//        // 不能点击 点击达到上限
//        
//        [SVProgressManager showAlertError:[NSString stringWithFormat:@"选择图片的数量达到上限%d张",shangxianCount]];
//    }else{
//        if(!imageview.check){
//            imageview.check = YES;
//            selectedImageCount++;
//        }else{
//            imageview.check = NO;
//            selectedImageCount--;
//        }
//        lblNumCount.text = [NSString stringWithFormat:@"当前选择了%d张图片",selectedImageCount];
//    }
    
}


//点击复制的操作
-(void)copyAction{
    NSLog(@"copyAction");
//    
//    if(txtvDes.text.length >0){
//        UIPasteboard*pasteboard = [UIPasteboard generalPasteboard];
//        pasteboard.string= txtvDes.text;
//        [SVProgressManager showAlertInfo:@"已经复制到剪切板"];
//    }else{
//        [SVProgressManager showAlertInfo:@"当前没有内容可以复制到剪切板"];
//    }
    
    
    
    
    
}
//点击确定
-(void)sureAction{
    NSLog(@"copyAction");
    //没有选择图片时不能分享
    
//    
//    
//    if(selectedImageCount <= 0) {
//        [SVProgressManager showAlertInfo:@"当前未选择图片不能分享"];
//        return;
//    }
//    if(selectedImageCount >8&&imageMode == ImageModeBig){
//        [SVProgressManager showAlertInfo:@"大图模式下最多能选择8张图片进行分享"];
//        return;
//    }
//    int i = 0;
//    
//    imgContainer = [[NSMutableArray alloc] init];
//    
//    for (ErWeimaImageView *imgv in imgvContainer) {
//        i++;
//        BOOL imgvSelected = imgv.check;
//        if (imgvSelected) {
//            [imgContainer addObject:imgv.imgvErweima.image];
//        }
//        NSLog(@"i----%d---selected",i);
//    }
//    
//    if (imageMode == ImageModeBig) {
//        if (imageBigErweima) {
//            [imgContainer addObject:imageBigErweima];
//        }
//    }else{
//        imageSmallErweima = [ErWeiMaCreator createImage:[imgContainer lastObject] WithErweimaCode:imageErweima];
//        if (imageSmallErweima) {
//            [imgContainer removeLastObject];
//            [imgContainer addObject:imageSmallErweima];
//        }
//        
//    }
//    
//    //分享到朋友圈
    
//    
//    NSArray *activityItems = imgContainer;
//    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
//    activityVC.modalInPopover = YES;
//    activityVC.excludedActivityTypes = @[UIActivityTypeAssignToContact,
//                                         UIActivityTypePrint,
//                                         UIActivityTypeMessage,
//                                         UIActivityTypeMail,
//                                         UIActivityTypeCopyToPasteboard,
//                                         UIActivityTypeAirDrop,
//                                         UIActivityTypeSaveToCameraRoll,
//                                         UIActivityTypeAddToReadingList,
//                                         UIActivityTypePostToFlickr,
//                                         UIActivityTypePostToVimeo,
//                                         UIActivityTypeOpenInIBooks
//                                         ];
//    
//    
//    [self presentViewController:activityVC animated:TRUE completion:nil];
//    
//    
//    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
