//
//  ViewController.m
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/1/21.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "ViewController.h"
#import "ZWCommonTable.h"
@interface ViewController ()
/** */
@property (nonatomic, strong) ZWCommonTableDelegate *adapter;
/** */
@property (nonatomic, strong) NSArray *dataSourceArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setData];
    [self setupTableView];
}
-(void)setupTableView{
    __weak typeof(self) weakSelf = self;
    _adapter = [[ZWCommonTableDelegate alloc] initWithTableData:^NSArray *{
        return weakSelf.dataSourceArr;
    }];
    UITableView *mTable = [[UITableView alloc] initWithFrame:self.view.bounds
                                                       style:UITableViewStylePlain];
    mTable.tableFooterView = [UIView new];
    mTable.delegate = _adapter;
    mTable.dataSource = _adapter;
    mTable.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.view addSubview:mTable];
}
-(void)setData{
    self.dataSourceArr = @[
                           @{
                               SectionRows           :@[
                                       @{
                                           CellTitle           :@"微信_事例一",
                                           CellPushVcClassName :@"WeChatMineCtr"
                                           },
                                       @{
                                           CellTitle           :@"微信_事例二",
                                           CellPushVcClassName :@"WeChatSettingCtr"
                                           },
                                       @{
                                           CellTitle           :@"通用",
                                           CellPushVcClassName :@"CommonTableCtr"
                                           },
                                       @{
                                           CellTitle           :@"多输入模式",
                                           CellPushVcClassName :@"InputSubmitCtr"
                                           },
                                       ]
                               },
                           ];
    self.dataSourceArr = [ZWCommonTableSection sectionsWithData:self.dataSourceArr];
}
-(void)textChange:(UITextField *)textField{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
