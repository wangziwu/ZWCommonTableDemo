//
//  ZWStaticInputModel.h
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/8/18.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZWStaticModelProtocol.h"
/**
 *  输入改变
 */
typedef void(^BlockInputChange)(NSString *text);

@interface ZWStaticInputModel : NSObject<ZWStaticModelProtocol>
/** 输入框placeHolder*/
@property (nonatomic, copy) NSString *textFieldPlaceHolder;
/** cell title*/
@property (nonatomic, copy) NSString *title;
/** cell value*/
@property (nonatomic, copy) NSString *inputValue;
/** 输入字符最大长度:默认20*/
@property (nonatomic, assign) NSInteger inputValueMaxLength;
/** 键盘类型*/
@property (nonatomic, assign) UIKeyboardType keyboardType;
/** text change*/
@property (nonatomic, copy) BlockInputChange blockText;
@end
