//
//  WeChatMineCtr.m
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/1/21.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "WeChatMineCtr.h"
#import "ZWCommonTable.h"
#import "WeChatInfoModel.h"
@interface WeChatMineCtr ()<UIScrollViewDelegate>
/** */
@property (nonatomic, strong) ZWCommonTableDelegate *tableAdapter;
/** */
@property (nonatomic, strong) NSArray *dataSourceArr;
@end

@implementation WeChatMineCtr

#define headerHeight     @"20"
#define footerHeight     @"0.01"

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setData];
    [self setupTableView];
}
-(void)setupTableView{
    UITableView *mTable = [[UITableView alloc] initWithFrame:self.view.bounds
                                                       style:UITableViewStyleGrouped];
    mTable.tableFooterView = [UIView new];
    mTable.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, mTable.frame.size.width, CGFLOAT_MIN)];
    mTable.backgroundColor = [UIColor groupTableViewBackgroundColor];
    mTable.delegate = self.tableAdapter;
    mTable.dataSource = self.tableAdapter;
    [self.view addSubview:mTable];
}
-(void)setData{
    //custom cell info
    WeChatInfoModel *infoModel  = [[WeChatInfoModel alloc] init];
    infoModel.headerImage       = @"WechatIMG2";
    infoModel.name              = @"Kingzzz";
    infoModel.weChatName        = @"KingWeChat";
    self.dataSourceArr = @[
                           @{
                               SectionHeaderHeight   :headerHeight,
                               SectionFooterHeight   :footerHeight,
                               SectionRows           :@[
                                       @{
                                           CellRowHeight       :@"100",
                                           IsHiddenAccessory   :@(NO),
                                           CellExtraInfo       :infoModel
                                           }
                                       ]
                               },
                           @{
                               SectionHeaderHeight   :headerHeight,
                               SectionFooterHeight   :footerHeight,
                               SectionRows           :@[
                                       @{
                                           CellTitle           :@"相册",
                                           CellImageName       :@"MoreMyAlbum_25x25_",
                                           CellPushVcClassName :@"UIViewController",
                                           IsHiddenAccessory   :@(NO),
                                           },
                                       @{
                                           CellTitle           :@"收藏",
                                           CellImageName       :@"MoreMyFavorites_25x25_",
                                           IsHiddenAccessory   :@(NO),
                                           },
                                       @{
                                           CellTitle           :@"钱包",
                                           CellImageName       :@"MoreMyBankCard_25x25_",
                                           IsHiddenAccessory   :@(NO),
                                           },
                                       @{
                                           CellTitle           :@"卡包",
                                           CellImageName       :@"MyCardPackageIcon_25x25_",
                                           IsHiddenAccessory   :@(NO),
                                           
                                           }
                                       ]
                               },
                           @{
                               SectionHeaderHeight   :headerHeight,
                               SectionFooterHeight   :footerHeight,
                               SectionRows           :@[
                                       @{
                                           CellTitle           :@"表情",
                                           CellImageName       :@"MoreExpressionShops_25x25_",
                                           IsHiddenAccessory   :@(NO),
                                           }
                                       ]
                               },
                           @{
                               SectionHeaderHeight   :headerHeight,
                               SectionRows           :@[
                                       @{
                                           CellTitle           :@"设置",
                                           CellImageName       :@"MoreSetting_25x25_",
                                           CellPushVcClassName :@"WeChatSettingCtr",
                                           IsHiddenAccessory   :@(NO),
                                           }
                                       ]
                               },
                           ];
    self.dataSourceArr = [ZWCommonTableSection sectionsWithData:self.dataSourceArr];
}
-(ZWCommonTableDelegate *)tableAdapter{
    if (!_tableAdapter) {
        _tableAdapter = [[ZWCommonTableDelegate alloc] initWithTableData:^NSArray *{
            return self.dataSourceArr;;
        }];
    }
    return _tableAdapter;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
