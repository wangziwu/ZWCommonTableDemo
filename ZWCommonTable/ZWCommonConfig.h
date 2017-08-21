//
//  ZWCommonConfig.h
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/8/19.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//
//------------------------redmine-----------------------//
//配置cell基本默认值
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define ZWCommonShareConfig     [ZWCommonConfig sharedConfig]
@interface ZWCommonConfig : NSObject
+ (instancetype)sharedConfig;
/** 
 *  cell 默认高度
 */
@property (nonatomic, assign) CGFloat commonCellHeight;
/** 
 *  title 字体大小
 */
@property (nonatomic, assign) CGFloat titleFontSize;
/** 
 *  detailTitle 字体大小
 */
@property (nonatomic, assign) CGFloat detailTitleFontSize;
/** 
 *  textView 内边距
 */
@property (nonatomic, assign)  UIEdgeInsets textContainerInset;
@end
