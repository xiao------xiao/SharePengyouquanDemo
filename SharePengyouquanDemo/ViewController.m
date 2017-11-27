//
//  ViewController.m
//  SharePengyouquanDemo
//
//  Created by aliviya on 2017/11/13.
//  Copyright © 2017年 aliviya. All rights reserved.
//

#import "ViewController.h"
#import "ShareTestViewController.h"
#import "FTNewShareViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIBarButtonItem *mapItem = [[UIBarButtonItem alloc] initWithTitle:@"地图" style:UIBarButtonItemStylePlain target:self action:@selector(mapAction)];
    self.navigationItem.rightBarButtonItem = mapItem;
    
}

-(void)mapAction{
  
//    ShareTestViewController *vc = [[ShareTestViewController alloc] init];
//    vc.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:vc animated:YES];
//    
    
    
    FTNewShareViewController *vc = [[FTNewShareViewController alloc] init];
    vc.imageArray = @[@"http://img.pacific.sh.cn/up/?width=1024&height=800&from=tpy&source=/home/prod/upload/photo/674FD4B0-4353-40E9-A10B-7600B62D99CC/2017/201708/20170807/csh/d14/a22/e8974/p999995693678125/tpy/3829f29f39534880873baba30f8c2913.jpg",
                      @"http://img.pacific.sh.cn/up/?width=1024&height=800&from=tpy&source=/home/prod/upload/photo/674FD4B0-4353-40E9-A10B-7600B62D99CC/2017/201708/20170807/csh/d14/a22/e8974/p999995693678125/tpy/b8113f6b99a44dc7b17f8f22aa3075ff.jpg",
                      @"http://img.pacific.sh.cn/up/?width=1024&height=800&from=tpy&source=/home/prod/upload/photo/674FD4B0-4353-40E9-A10B-7600B62D99CC/2017/201708/20170807/csh/d14/a22/e8974/p999995693678125/tpy/29e68dd7174f40dfbd82e131870afafe.jpg",
                      @"http://img.pacific.sh.cn/up/?width=1024&height=800&from=tpy&source=/home/prod/upload/photo/674FD4B0-4353-40E9-A10B-7600B62D99CC/2017/201708/20170807/csh/d14/a22/e8974/p999995693678125/tpy/554927344c4a46ca87542f02c1f71924.jpg",
                      @"http://img.pacific.sh.cn/up/?width=1024&height=800&from=tpy&source=/home/prod/upload/photo/674FD4B0-4353-40E9-A10B-7600B62D99CC/2017/201708/20170807/csh/d14/a22/e8974/p999995693678125/tpy/f2f954dbc3d742f297baec6aad9b35fd.jpg",
                      @"http://img.pacific.sh.cn/up/?width=1024&height=800&from=tpy&source=/home/prod/upload/photo/674FD4B0-4353-40E9-A10B-7600B62D99CC/2017/201708/20170807/csh/d14/a22/e8974/p999995693678125/tpy/d16853030d0349bc866fb82d15720d0d.jpg",
                      @"http://img.pacific.sh.cn/up/?width=1024&height=800&from=tpy&source=/home/prod/upload/photo/674FD4B0-4353-40E9-A10B-7600B62D99CC/2017/201708/20170807/csh/d14/a22/e8974/p999995693678125/tpy/392c6c64e6d744a7be9b29dba2dbe6e3.jpg",
                      @"http://img.pacific.sh.cn/up/?width=1024&height=800&from=tpy&source=/home/prod/upload/photo/674FD4B0-4353-40E9-A10B-7600B62D99CC/2017/201708/20170807/csh/d14/a22/e8974/p999995693678125/tpy/dec9da0a0de64ae68195fabc5d17cb21.jpg",
                      @"http://img.pacific.sh.cn/up/?width=1024&height=800&from=tpy&source=/home/prod/upload/photo/674FD4B0-4353-40E9-A10B-7600B62D99CC/2017/201708/20170807/csh/d14/a22/e8974/p999995693678125/tpy/01587c95c087430ab7a308344db30739.jpg",
                      @"http://img.pacific.sh.cn/up/?width=1024&height=800&from=tpy&source=/home/prod/upload/photo/674FD4B0-4353-40E9-A10B-7600B62D99CC/2017/201708/20170807/csh/d14/a22/e8974/p999995693678125/tpy/ac41d32c30f349f8a87505b5ebf29b6c.jpg",
                      @"http://img.pacific.sh.cn/up/?width=1024&height=800&from=tpy&source=/home/prod/upload/photo/674FD4B0-4353-40E9-A10B-7600B62D99CC/2017/201708/20170807/csh/d14/a22/e8974/p999995693678125/tpy/29e68dd7174f40dfbd82e131870afafe.jpg",
                      @"http://img.pacific.sh.cn/up/?width=1024&height=800&from=tpy&source=/home/prod/upload/photo/674FD4B0-4353-40E9-A10B-7600B62D99CC/2017/201708/20170807/csh/d14/a22/e8974/p999995693678125/tpy/554927344c4a46ca87542f02c1f71924.jpg",
                      @"http://img.pacific.sh.cn/up/?width=1024&height=800&from=tpy&source=/home/prod/upload/photo/674FD4B0-4353-40E9-A10B-7600B62D99CC/2017/201708/20170807/csh/d14/a22/e8974/p999995693678125/tpy/f2f954dbc3d742f297baec6aad9b35fd.jpg",
                      @"http://img.pacific.sh.cn/up/?width=1024&height=800&from=tpy&source=/home/prod/upload/photo/674FD4B0-4353-40E9-A10B-7600B62D99CC/2017/201708/20170807/csh/d14/a22/e8974/p999995693678125/tpy/d16853030d0349bc866fb82d15720d0d.jpg",
                      @"http://img.pacific.sh.cn/up/?width=1024&height=800&from=tpy&source=/home/prod/upload/photo/674FD4B0-4353-40E9-A10B-7600B62D99CC/2017/201708/20170807/csh/d14/a22/e8974/p999995693678125/tpy/392c6c64e6d744a7be9b29dba2dbe6e3.jpg",
                      @"http://img.pacific.sh.cn/up/?width=1024&height=800&from=tpy&source=/home/prod/upload/photo/674FD4B0-4353-40E9-A10B-7600B62D99CC/2017/201708/20170807/csh/d14/a22/e8974/p999995693678125/tpy/ac41d32c30f349f8a87505b5ebf29b6c.jpg",
                      @"http://img.pacific.sh.cn/up/?width=1024&height=800&from=tpy&source=/home/prod/upload/photo/674FD4B0-4353-40E9-A10B-7600B62D99CC/2017/201708/20170807/csh/d14/a22/e8974/p999995693678125/tpy/29e68dd7174f40dfbd82e131870afafe.jpg",
                      @"http://img.pacific.sh.cn/up/?width=1024&height=800&from=tpy&source=/home/prod/upload/photo/674FD4B0-4353-40E9-A10B-7600B62D99CC/2017/201708/20170807/csh/d14/a22/e8974/p999995693678125/tpy/554927344c4a46ca87542f02c1f71924.jpg",
                      @"http://img.pacific.sh.cn/up/?width=1024&height=800&from=tpy&source=/home/prod/upload/photo/674FD4B0-4353-40E9-A10B-7600B62D99CC/2017/201708/20170807/csh/d14/a22/e8974/p999995693678125/tpy/f2f954dbc3d742f297baec6aad9b35fd.jpg",
                      @"http://img.pacific.sh.cn/up/?width=1024&height=800&from=tpy&source=/home/prod/upload/photo/674FD4B0-4353-40E9-A10B-7600B62D99CC/2017/201708/20170807/csh/d14/a22/e8974/p999995693678125/tpy/d16853030d0349bc866fb82d15720d0d.jpg",
                      @"http://img.pacific.sh.cn/up/?width=1024&height=800&from=tpy&source=/home/prod/upload/photo/674FD4B0-4353-40E9-A10B-7600B62D99CC/2017/201708/20170807/csh/d14/a22/e8974/p999995693678125/tpy/392c6c64e6d744a7be9b29dba2dbe6e3.jpg",
                      @"http://img.pacific.sh.cn/up/?width=1024&height=800&from=tpy&source=/home/prod/upload/photo/674FD4B0-4353-40E9-A10B-7600B62D99CC/2017/201708/20170807/csh/d14/a22/e8974/p999995693678125/tpy/dec9da0a0de64ae68195fabc5d17cb21.jpg"
                      ];
    vc.houseId = @"1111";
    //    vc.houseInfo = self.houseInfo;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
