//
//  KyoUrlArgumentsFilter.h
//  KYONetWorking
//
//  Created by 张起哲 on 2017/12/6.
//  Copyright © 2017年 Dcamper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTKNetworkConfig.h"
#import "YTKBaseRequest.h"

/// 给url追加arguments，用于全局参数，比如AppVersion, ApiVersion等
@interface KyoUrlArgumentsFilter : NSObject<YTKUrlFilterProtocol>
+ (KyoUrlArgumentsFilter *)filterWithArguments:(NSDictionary *)arguments;

- (NSString *)filterUrl:(NSString *)originUrl withRequest:(YTKBaseRequest *)request;
@end
