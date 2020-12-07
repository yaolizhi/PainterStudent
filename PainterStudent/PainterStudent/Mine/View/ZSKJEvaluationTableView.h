//
//  ZSKJEvaluationTableView.h
//  PainterStudent
//
//  Created by 姚立志 on 2020/12/5.
//

#import "SSKJ_TableView.h"
#import "ZSKJEvaluationTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZSKJEvaluationTableView : SSKJ_TableView <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign) InitType type;  //!< 1 正式报告  2 测试报告









@end

NS_ASSUME_NONNULL_END
