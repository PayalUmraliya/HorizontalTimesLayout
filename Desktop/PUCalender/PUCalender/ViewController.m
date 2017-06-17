//
//  ViewController.m
//  PUCalender
//
//  Created by c196 on 06/03/17.
//  Copyright © 2017 checkmate. All rights reserved.
//

#import "ViewController.h"
#import "CellCalenderEvent.h"
#import "CellAllTimes.h"
#import "CellHorizontalScroll.h"
@interface ViewController ()<HorizontalScrollCellDelegate>
{
    NSMutableDictionary *_eventsByDate;

    NSDate *_todayDate;
    NSDate *_minDate;
    NSDate *_maxDate;
    NSMutableArray *arrResourceList;
    NSMutableArray *arrAllTime;
     NSMutableArray *arrAllStartTime;
     NSMutableArray *arrAllEndTime;
     NSMutableArray *arrAllSatusList;
    NSDate *_dateSelected;
    CGFloat latestContentOffset;
    NSDictionary *someDictionary;
}
@property (nonatomic, strong) NSMutableDictionary *contentOffsetDictionary;
@end

@implementation ViewController
- (void)viewDidLoad 
{
    [super viewDidLoad];
    _tblListOfResources.delegate = self;
    arrResourceList=[NSMutableArray new];
    arrAllStartTime=[NSMutableArray new];
    arrAllEndTime=[NSMutableArray new];
    arrAllSatusList=[NSMutableArray new];
    [arrResourceList addObject:@"TH-1"];
    [arrResourceList addObject:@"TH-2"];
    [arrResourceList addObject:@"TH-3"];
    [arrResourceList addObject:@"TH-4"];
    [arrResourceList addObject:@"TH-5"];
  
    
    arrAllTime=[NSMutableArray new];
    for(int i=1 ;i <=24;i++)
    {
        NSString *strtime=[NSString stringWithFormat:@"%d:00",i];
        [arrAllTime addObject: strtime ];
    }
    
    
    UINib *nib = [UINib nibWithNibName:@"CellCalenderEvent" bundle:nil];
    [[self tblListOfResources] registerNib:nib forCellReuseIdentifier:@"CellCalenderEvent"];
    self.tblListOfResources.delegate=self;
    self.tblListOfResources.dataSource=self;
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.tblListOfResources.frame.size.width, 0)];
    self.tblListOfResources.tableFooterView = footer;
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.tblListOfResources.frame.size.width, 30)];
    UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(0,0,80, 30)];
    lbl.text=@"10/08/17";
    lbl.textAlignment = NSTextAlignmentCenter;
    [header addSubview:lbl];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0,0);
    layout.minimumLineSpacing=0;
    layout.minimumInteritemSpacing=0;
    layout.itemSize = CGSizeMake(60, 30);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collEventTimeHeader =[[UICollectionView alloc]initWithFrame:CGRectMake(80, 0,self.tblListOfResources.frame.size.width,30) collectionViewLayout:layout];
    
    self.collEventTimeHeader.backgroundColor=[UIColor clearColor];
    self.collEventTimeHeader.delegate=self;
    self.collEventTimeHeader.dataSource=self;
    [header addSubview:self.collEventTimeHeader];
    self.tblListOfResources.tableHeaderView = header;
    [self prepareStatusDic];
}
-(void)prepareStatusDic
{
    NSArray *arr=[NSArray arrayWithObjects:@"1:40",@"2:40",@"DJ-IL",@"1",nil];
    NSArray *arr1=[NSArray arrayWithObjects:@"4:00",@"7:20",@"PJ-IL", @"2",nil];
    NSArray *arr2=[NSArray arrayWithObjects:@"3:55",@"12:30",@"PR-IL",@"3", nil];
    NSArray *arr3=[NSArray arrayWithObjects:@"17:10",@"23:00",@"PU-IL",@"4", nil];
    someDictionary = @{@"0" : arr,@"2" : arr1,@"3" : arr2,@"4" : arr3};
}
#pragma mark - Table view delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrResourceList.count;    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    @try {
        CellCalenderEvent *cell = [_tblListOfResources dequeueReusableCellWithIdentifier:@"CellCalenderEvent"];

        for (id view in cell.subviews)
        {
            if ([view isKindOfClass:[UICollectionView class]])
            {
                [view removeFromSuperview];
            }
        }
    
    
        cell.collAllEvents.delegate = self;
        cell.collAllEvents.dataSource = self;
        cell.collAllEvents.tag=indexPath.row;
        cell.lblNameResoutce.text=[arrResourceList objectAtIndex:indexPath.row];
         cell.collAllEvents.contentOffset= CGPointMake(self.collEventTimeHeader.contentOffset.x,0.0);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } @catch (NSException *exception) {
        
    } 
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    @try
    {
        return 70;
    }
    @catch (NSException *exception) {
        
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - collectionview delegate
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{   
    if(collectionView == self.collEventTimeHeader)
    {
        return CGSizeMake(60,30);
    }
    else
    return CGSizeMake(1440,70);
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
{
    if(view == self.collEventTimeHeader)
    {
        return arrAllTime.count;
    }
    else
    {
          return 1;
    }
  
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section 
{
    
    return 0.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0,0,0,0);
}
- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    @try
    {
        if(cv == self.collEventTimeHeader)
        {
            [cv registerNib:[UINib nibWithNibName:@"CellAllTimes" bundle:nil] forCellWithReuseIdentifier:@"CellAllTimes"];
            CellAllTimes *cell = (CellAllTimes*)[cv dequeueReusableCellWithReuseIdentifier:@"CellAllTimes" forIndexPath:indexPath];
            cell.lblTimes.text=[arrAllTime objectAtIndex:indexPath.row];
            cv.userInteractionEnabled=NO;
            cell.tag=indexPath.row;
             return cell;
        }
        else
        {
            CellHorizontalScroll *hsc =[cv dequeueReusableCellWithReuseIdentifier:@"CellHorizontalScroll"
                                                                                 forIndexPath:indexPath];
            [hsc setBackgroundColor:[UIColor lightGrayColor]];
            [hsc setUpCellWithArray:[someDictionary objectForKey:[NSString stringWithFormat:@"%ld",(long)cv.tag]]];
            [hsc.scroll setFrame:CGRectMake(hsc.scroll.frame.origin.x, hsc.scroll.frame.origin.y, hsc.frame.size.width, 70 )];
           hsc.scroll.contentOffset= CGPointMake(self.collEventTimeHeader.contentOffset.x,0.0);
            return hsc;
        }      
    }
    @catch (NSException *exception) {
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (![scrollView isKindOfClass:[UICollectionView class]]) return;
      self.collEventTimeHeader.contentOffset=scrollView.contentOffset;
    latestContentOffset=scrollView.contentOffset.x;
    NSInteger rows =  [self.tblListOfResources numberOfRowsInSection:0];
    CGPoint translation = [scrollView.panGestureRecognizer translationInView:scrollView.superview];
    
    if(translation.y > 0 || translation.y < 0)
    {
        // react to dragging down
    } 
    else
    {
        for (int row = 0; row < rows; row++) 
        {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
            CellCalenderEvent *cell =  (CellCalenderEvent *)[self.tblListOfResources cellForRowAtIndexPath:indexPath];//**here, for those cells not in current screen, cell is nil**
            cell.collAllEvents.contentOffset = CGPointMake(scrollView.contentOffset.x, 0.0);
        }
    }
    
}
-(void)callSelected:(id)sender
{
    //code to call event
}
-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    @try
    {
    }
    @catch (NSException *exception) {
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)goRightClicked:(id)sender 
{
}

- (IBAction)goLeftClicked:(id)sender
{
   
}
- (IBAction)btnExpnadCollapseClicked:(id)sender {
}
@end
