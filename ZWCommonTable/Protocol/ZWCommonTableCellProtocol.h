//
//  ZWCommonTableCellProtocol.h
//  YLTOA
//
//  Created by 王子武 on 2017/1/18.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

//------------------------redmine-----------------------//
//使用自定义cell，必须实现该协议。

#import <Foundation/Foundation.h>

@class ZWCommonTableRow;

@protocol ZWCommonTableCellProtocol <NSObject>
@required
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@optional
//custom cell need override func
- (void)refreshCellData:(ZWCommonTableRow *)rowData tableView:(UITableView *)tableView;

@end
