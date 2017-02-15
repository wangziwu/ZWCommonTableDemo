//
//  ZWCommonSwitchCell.h
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/2/7.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZWCommonTableCellProtocol.h"
@interface ZWCommonSwitchCell : UITableViewCell<ZWCommonTableCellProtocol>
@property (weak, nonatomic) IBOutlet UISwitch *mSwitch;

@end
