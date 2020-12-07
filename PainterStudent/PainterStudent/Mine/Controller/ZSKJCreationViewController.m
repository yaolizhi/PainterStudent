//
//  ZSKJCreationViewController.m
//  PainterStudent
//
//  Created by 姚立志 on 2020/12/2.
//

#import "ZSKJCreationViewController.h"
#import "ZSKJCreationCollectionViewCell.h"


@interface ZSKJCreationViewController () <UICollectionViewDelegate,UICollectionViewDataSource>


@property (nonatomic, strong) ZSKJCollectionView *creationCollectionView; //!< 我的作品



@end

@implementation ZSKJCreationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"我的作品"];
}





-(void)addSubVies:(BOOL)views
{
    if (views)
    {
        [self.view addSubview:self.creationCollectionView];
        
    }
}


-(void)headerRefresh
{
    [self setPage:1];
    [self getMyworksWithType:HeaderType];
}






-(void)footerRefresh
{
    [self getMyworksWithType:FooterType];
}


#pragma mark - NetWork Method 网络请求
-(void)getMyworksWithType:(RefreshType)type
{
    
    NSDictionary *parameters = @{@"token":[ZSKJUserinfoModel shareUserinfo].token,@"limit":@"10",@"page":[NSString stringWithFormat:@"%d",self.page]};
    
    [[ZSKJAFHTTPManager shareManager] postUrl:Myworks_URL parameters:parameters success:^(id  _Nonnull responseObject) {
        
        ZSKJNetworkModel *netWorkModel = [ZSKJNetworkModel mj_objectWithKeyValues:responseObject];
        if (netWorkModel.code.integerValue == 1)
        {
            NSArray *array  = [ZSKJCreationModel mj_objectArrayWithKeyValuesArray:[netWorkModel.data objectForKey:@"rows"]];
            
            switch (type)
            {
                case HeaderType:
                {
                    [self.itemArray setArray:array];
                }
                    break;
                case FooterType:
                {
                    [self.itemArray addObjectsFromArray:array];
                }
                    break;
            }
            
            if ([array count] >= PageSize)
            {
                [self setPage:(self.page+1)]; // self.page++;
                [self.creationCollectionView endRefresh];
            }
            else
            {
                [self.creationCollectionView endNoMoreData];
            }
        }
        else
        {
            [self.creationCollectionView endNoMoreData];
        }
        
    } failure:^(NSError * _Nonnull error) {
        
        [self.creationCollectionView endNoMoreData];
    }];
    
    
    
    
}



#pragma mark - Deletage Method
- (NSInteger)collectionView:(ZSKJCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    [collectionView setItemsArray:self.itemArray];
    return [self.itemArray count];
}



- (ZSKJCreationCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZSKJCreationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZSKJCreationCollectionViewCell" forIndexPath:indexPath];
    [cell setModel:[self.itemArray objectAtIndex:indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
}


#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((ScreenWidth-60)/3.0, 270);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(15, 15, 15, 15);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}





#pragma mark - Getter / Setter
-(ZSKJCollectionView *)creationCollectionView
{
    if (!_creationCollectionView)
    {
        _creationCollectionView = [[ZSKJCollectionView alloc]initWithFrame:CGRectMake(0, self.navbarHeight, ScreenWidth, ScreenHeight-self.navbarHeight) withType:VerticalType];
        [_creationCollectionView setBackgroundColor:KWhiteColor];
        [_creationCollectionView registerClass:[ZSKJCreationCollectionViewCell class] forCellWithReuseIdentifier:@"ZSKJCreationCollectionViewCell"];
        [_creationCollectionView setDelegate:self];
        [_creationCollectionView setDataSource:self];
        [_creationCollectionView headerTarget:self action:@selector(headerRefresh)];
        [_creationCollectionView footerTarget:self action:@selector(footerRefresh)];
        [_creationCollectionView beginRefreshing];
    }
    return _creationCollectionView;
}







@end
