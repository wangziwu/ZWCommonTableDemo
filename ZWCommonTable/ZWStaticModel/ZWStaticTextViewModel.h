//
//  ZWStaticTextViewModel.h
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/8/19.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZWStaticModelProtocol.h"
/**
 *  输入改变
 */
typedef void(^BlockTextChange)(NSString *text);
@interface ZWStaticTextViewModel : NSObject<ZWStaticModelProtocol>
/** placeHolder*/
@property (nonatomic, copy) NSString *placeHolder;
/** content value*/
@property (nonatomic, copy) NSString *contentValue;
/** block*/
@property (nonatomic, copy) BlockTextChange blockTextChange;
@end
