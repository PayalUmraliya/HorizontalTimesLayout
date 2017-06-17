//
//  ViewController.h
//  PUCalender
//
//  Created by c196 on 06/03/17.
//  Copyright © 2017 checkmate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
- (IBAction)goRightClicked:(id)sender;
- (IBAction)goLeftClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *goRight;
@property (weak, nonatomic) IBOutlet UIButton *goLeft;
@property (strong, nonatomic) UICollectionView *collAllTimeList;
@property (strong, nonatomic) UICollectionView *collEventTimeHeader;

- (IBAction)btnExpnadCollapseClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *hideShowCalenderview;
@property (weak, nonatomic) IBOutlet UIButton *btnexpandCollapse;
@property (weak, nonatomic) IBOutlet UIButton *btnLeft;
@property (weak, nonatomic) IBOutlet UITableView *tblListOfResources;
@property (weak, nonatomic) IBOutlet UIButton *btnRight;

@end

