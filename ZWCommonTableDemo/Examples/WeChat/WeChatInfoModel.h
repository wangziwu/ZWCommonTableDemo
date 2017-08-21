//
//  WeChatInfoModel.h
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/2/8.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZWStaticModelProtocol.h"
@interface WeChatInfoModel : NSObject<ZWStaticModelProtocol>
/** headerImage*/
@property (nonatomic, copy) NSString *headerImage;
/** name*/
@property (nonatomic, copy) NSString *name;
/** weChatName*/
@property (nonatomic, copy) NSString *weChatName;
/** rightIcon*/
@property (nonatomic, copy) NSString *rightImageName;
@end
