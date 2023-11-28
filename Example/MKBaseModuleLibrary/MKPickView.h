//
//  MKPickView.h
//  MKBaseModuleLibrary_Example
//
//  Created by aa on 2023/11/28.
//  Copyright © 2023 aadyx2007@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MKPickView : UIView

/// 显示pickView
/// @param dataList pickView的数据列表
/// @param selectedRow 列表显示的时候选中的row
/// @param block 用户点击了confirm按钮的选中回调
- (void)showPickViewWithDataList:(NSArray <NSString *>*)dataList
                     selectedRow:(NSInteger)selectedRow
                           block:(void (^)(NSInteger currentRow))block;

/// 让pickView消失
- (void)dismiss;

@end

NS_ASSUME_NONNULL_END
