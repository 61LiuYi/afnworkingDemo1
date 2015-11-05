//
//  ViewController.m
//  afnworkingDemo1
//
//  Created by lmj on 15/11/5.
//  Copyright © 2015年 lmj. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <AFNetworking.h>
@interface ViewController ()
{

    AppDelegate * myDelegate;
    __weak IBOutlet UILabel *testTest;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testWorking];
    //[testTest.text]
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)testWorking
{

    /*
     
     http://www.bigheadh.com/webapp/NewsServlet?newsId＝10
     
     newsTitle
     
     */
    myDelegate=[UIApplication sharedApplication].delegate;
    NSDictionary * parameter=@{@"newsId":@"10"};//拼接参数  类型为字典  @[]
    [myDelegate.mySession GET:@"http://www.bigheadh.com/webapp/NewsServlet" parameters:parameter success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSDictionary * rootDict=responseObject;
        NSDictionary * newsDict=[rootDict objectForKey:@"news"];
        NSString * titleStr=[newsDict objectForKey:@"newsTitle"];
        [testTest setText:titleStr];
      
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
    
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
