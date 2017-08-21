//
//  WeChatMineInfoCell.h
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/2/4.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZWCommonTableCellProtocol.h"
@interface WeChatMineInfoCell : UITableViewCell<ZWCommonTableCellProtocol>
@property (weak, nonatomic) IBOutlet UIImageView *mineHeaderImage;
@property (weak, nonatomic) IBOutlet UILabel *mineNickLabel;
@property (weak, nonatomic) IBOutlet UILabel *mineWeChatNumber;

@end
