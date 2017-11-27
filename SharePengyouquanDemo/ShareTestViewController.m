//
//  ShareTestViewController.m
//  taiwubroker
//
//  Created by aliviya on 2017/11/10.
//  Copyright © 2017年 房途信息科技. All rights reserved.
//

#import "ShareTestViewController.h"
#define kScreen_width  [UIScreen mainScreen].bounds.size.width
@interface ShareTestViewController ()
@property (nonatomic,retain) UIView *subview;
@end

@implementation ShareTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.subview = [[UIView alloc] init];
    self.subview.frame = CGRectMake(0, 300, kScreen_width, 400);
   
    
    self.subview.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.subview];
    
    UISwipeGestureRecognizer *swipegesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeupSubview:)];
    swipegesture.direction = UISwipeGestureRecognizerDirectionUp;
    [self.subview addGestureRecognizer:swipegesture];
    
    UISwipeGestureRecognizer *swipedowngesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipedownSubview:)];
    swipedowngesture.direction = UISwipeGestureRecognizerDirectionDown;
    [self.subview addGestureRecognizer:swipedowngesture];

    float Image_Height = kScreen_width/3;
    float Image_Width = 100;
    for (int i = 0; i<9; i++) {
        int col = i%3;
        int row = i/3;
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(col*Image_Width, row*Image_Height, Image_Width, Image_Height)];
        imgView.tag =100+i;
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i+1]];
        [self.subview addSubview:imgView];
        imgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTaped:)];
        [imgView addGestureRecognizer:tap];
    }
    
    
    
}


-(void)swipeupSubview:(UISwipeGestureRecognizer *)swipe{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect oldFrame = self.subview.frame;
        oldFrame.origin.y = 0;
        
        self.subview.frame = oldFrame;
    } completion:nil];
  
//    [UIView animateWithDuration:0.3 animations:^{
//        CGRect oldFrame = self.subview.frame;
//        oldFrame.origin.y = 0;
//
//        self.subview.frame = oldFrame;
//    }];
}
-(void)swipedownSubview:(UISwipeGestureRecognizer *)swipe{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect oldFrame = self.subview.frame;
        oldFrame.origin.y = 200;
        
        self.subview.frame = oldFrame;
    } completion:nil];
   
}
-(void)imageTaped:(UITapGestureRecognizer *)gesture{
    UIImageView *imgv = (UIImageView *)gesture.view;
    NSLog(@"当前点击到imageview --tag- %ld",imgv.tag);
    
    
}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UITouch *touch = [touches anyObject];
//
//
//    CGPoint point = [touch  locationInView:self.view];
//    if(CGRectContainsPoint(self.subview.frame, point)){
//        NSLog(@"点击到了iamge");
//    }else{
//
//    }
//
//
//
//}
//-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UITouch *touch = [touches anyObject];
//    CGPoint point = [touch  locationInView:self.view];
//    self.subview.center = point;
////    self.subview.frame.origin = point;
//
//}
//-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
//    UITouch *touch = [touches anyObject];
//    CGPoint point = [touch  locationInView:self.view];
//    self.subview.center = point;
//
//}
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
