//
//  ZWStaticOptionCell.h
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/8/19.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZWCommonTableCellProtocol.h"
@interface ZWStaticOptionCell : UITableViewCell<ZWCommonTableCellProtocol>
@property (weak, nonatomic) IBOutlet UILabel *optionTitleLab;
@property (weak, nonatomic) IBOutlet UILabel *optionDetailLab;

@end
