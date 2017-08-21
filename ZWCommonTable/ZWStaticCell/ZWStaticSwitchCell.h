//
//  ZWStaticSwitchCell.h
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/8/18.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZWCommonTableCellProtocol.h"
@interface ZWStaticSwitchCell : UITableViewCell<ZWCommonTableCellProtocol>
@property (weak, nonatomic) IBOutlet UILabel *zw_switchTextLab;
@property (weak, nonatomic) IBOutlet UISwitch *zw_mSwitch;

@end
