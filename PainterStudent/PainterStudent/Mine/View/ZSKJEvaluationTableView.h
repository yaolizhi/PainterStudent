//
//  ZSKJEvaluationTableView.h
//  PainterStudent
//
//  Created by 姚立志 on 2020/12/5.
//

#import "SSKJ_TableView.h"
#import "ZSKJEvaluationTableViewCell.h"


@protocol ZSKJEvaluationTableViewDeletage <NSObject>

-(void)didSelectEvaluationItem:(ZSKJEvaluationModel*_Nullable)model;


@end



NS_ASSUME_NONNULL_BEGIN

@interface ZSKJEvaluationTableView : SSKJ_TableView <UITableViewDelegate,UITableViewDataSource>

-(void)setInitType:(InitType)type withDeletage:(id<ZSKJEvaluationTableViewDeletage>)deletage;













@end

NS_ASSUME_NONNULL_END
