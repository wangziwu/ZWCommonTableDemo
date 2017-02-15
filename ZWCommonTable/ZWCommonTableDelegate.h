//
//  ZWCommonTableDelegate.h
//  YLTOA
//
//  Created by 王子武 on 2017/1/17.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NSArray * (^ReturnTableData)(void);

@interface ZWCommonTableDelegate : NSObject<UITableViewDelegate,UITableViewDataSource>

- (instancetype)initWithTableData:(ReturnTableData)tableData;
@end
