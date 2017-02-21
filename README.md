# ZWCommonTableDemo
[![Version](https://img.shields.io/cocoapods/v/ZWCommonTable.svg?style=flat)](http://cocoadocs.org/docsets/ZWCommonTable)
[![License](https://img.shields.io/cocoapods/l/ZWCommonTable.svg?style=flat)](http://cocoadocs.org/docsets/ZWCommonTable)
[![Platform](https://img.shields.io/cocoapods/p/ZWCommonTable.svg?style=flat)](http://cocoadocs.org/docsets/ZWCommonTable)
![Language](https://img.shields.io/badge/Language-%20Objective%20C%20-blue.svg)
### 简介
* An easy way to build CommontableController.

### 框架整体介绍
* 该框架为一个通用Table页面展示的框架，旨在提供一种简单table页面规范书写的模板。
* 1.支持普通tableView界面.
	* [普通tableView效果图](#普通tableView效果图)
* 2.支持tableView中cell自定义.
	 * [tableViewCell自定义效果图](#tableViewCell自定义效果图)
* 3.框架中默认提供UITableViewCell,ZWCommonButtonCell, ZWCommonSwitchCell三种cell.
	* [tableViewCell自定义效果图](#tableViewCell自定义效果图)
* 4.框架支持默认点击cell,push到自定义的Controller中.也可拦截p点击事件，执行到自定义方法中.
	* [组合效果图](#组合效果图)

### 框架使用方法
- 直接把ZWCommonTable文件夹拖入到您的工程中.
  
  ```objc
  #import "ZWCommonTable.h"
  ``` 
  
- Cocoapods安装
  
  ```objc
  pod search ZWCommonTable
  pod 'ZWCommonTable',		'~> 0.0.4'
  ```
  
  ```objc
  #import <ZWCommonTable/ZWCommonTable.h>
  ```
  
  如果发现pod search ZWCommonTable,然后执行pod repo update --verbose命令更新本地spec缓存（可能需要几分钟），然后再搜索就可以了.
  
### 代码解析
配置UITableView的协议转发.
```objc
-(void)setupTableView{
    __weak typeof(self) weakSelf = self;
    _comDelegate = [[ZWCommonTableDelegate alloc] initWithTableData:^NSArray *{
        return weakSelf.dataSourceArr;
    }];
    self.mTable.tableFooterView = [UIView new];
    self.mTable.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.mTable.frame.size.width, CGFLOAT_MIN)];
    self.mTable.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.mTable.delegate = _comDelegate;
    self.mTable.dataSource = _comDelegate;
    [self.view addSubview:self.mTable];
}
```
```objc
-(void)setData{
    self.dataSourceArr = @[
                           @{
                               SectionHeaderTitle    :@"",
                               SectionHeaderHeight   :@"",
                               SectionFooterTitle    :@"",
                               SectionFooterHeight   :@"",
                               SectionRows           :@[
                                       @{
                                           CellTitle           :@"微信-事例一",
                                           CellPushVcClassName :@"WeChatMineCtr"
                                           },
                                       @{
                                           CellTitle           :@"微信_事例二",
                                           CellPushVcClassName :@"WeChatSettingCtr"
                                           },
                                       @{
                                           CellTitle           :@"通用",
                                           CellImageName       :@"icon_profile_depart",
                                           CellPushVcClassName :@"CommonTableCtr"
                                           }
                                       ]
                               },
                           ];
    self.dataSourceArr = [ZWCommonTableSection sectionsWithData:self.dataSourceArr];
}
```

###<a id="普通tableView效果图"></a>普通tableView效果图
![image](https://github.com/wangziwu/ZWCommonTableDemo/blob/master/预览图/普通tableView.png)
###<a id="tableViewCell自定义效果图"></a>tableViewCell自定义效果图
![image](https://github.com/wangziwu/ZWCommonTableDemo/blob/master/预览图/样例一.png)
![image](https://github.com/wangziwu/ZWCommonTableDemo/blob/master/预览图/样例二.png)
![image](https://github.com/wangziwu/ZWCommonTableDemo/blob/master/预览图/自定义cell.png)
###<a id="组合效果图"></a>组合效果图
![image](https://github.com/wangziwu/ZWCommonTableDemo/blob/master/预览图/ZWCommonTable.gif)
