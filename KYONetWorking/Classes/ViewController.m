//
//  ViewController.m
//  KYONetWorking
//
//  Created by 张起哲 on 2017/12/6.
//  Copyright © 2017年 Dcamper. All rights reserved.
//

#import "ViewController.h"
#import "DcampRequestApi.h"

@interface ViewController (){
    DcampRequestApi *_dcampApi;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.frame = [UIScreen mainScreen].bounds;
    self.view.backgroundColor = [UIColor whiteColor];
    
    _dcampApi = [[DcampRequestApi alloc] initWithPage:1 pageSize:10];
}

- (IBAction)dcamRequestEvent:(id)sender {
    [_dcampApi resetPage];
    [self dcampApiLoadData];
}

- (IBAction)nextPageEvent:(id)sender {
    [_dcampApi loadNextPage];
    [self dcampApiLoadData];
}

- (IBAction)loadCachEvent:(id)sender {
    [self loadCacheData];
}

- (void)dcampApiLoadData{
    //1.block方式
    //    NSLog(@"%@",dcampApi.requestHeaderFieldValueDictionary);
    [_dcampApi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        // 你可以直接在这里使用 self
                NSLog(@"%@",_dcampApi.responseJSONObject);
//        NSLog(@"%@",request.responseHeaders);
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        // 你可以直接在这里使用 self
        NSLog(@"failed");
    }];
    
    //delegate方式
//    _dcampApi.delegate = self;
//    [_dcampApi start];
}

- (void)loadCacheData {
    //1.有缓存，取缓存，没有就请求
    //2.先取缓存显示，并且发送请求
    if ([_dcampApi loadCacheWithError:nil]) {
        NSDictionary *json = [_dcampApi responseJSONObject];
        NSLog(@"cachJson = %@", json);
        // show cached data
    }else{
        [self dcampApiLoadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
