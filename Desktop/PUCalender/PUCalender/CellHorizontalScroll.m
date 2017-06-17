//
//  CellHorizontalScroll.m
//  PUCalender
//
//  Created by c196 on 08/03/17.
//  Copyright © 2017 checkmate. All rights reserved.
//

#import "CellHorizontalScroll.h"
@implementation CellHorizontalScroll

- (void)awakeFromNib {
    [super awakeFromNib];
}
-(void)setUpCellWithArray:(NSArray *)array
{
    CGFloat xbase = 50;
    CGFloat width = 70;
    [self.scroll setScrollEnabled:YES];
    [self.scroll setShowsHorizontalScrollIndicator:NO];
    
  if(array.count > 0)
  {
      UIView *custom = [self createCustomView:array];
      [self.scroll addSubview:custom];
      [custom setFrame:[self formulawidthStartTime:[array objectAtIndex:0] andEndTime:[array objectAtIndex:1]]];
      xbase += 50 + width;  
  }
        
    
    //[self.scroll setContentSize:CGSizeMake(xbase, self.scroll.frame.size.height)];
   // self.scroll.delegate = self;
}
-(CGRect)formulawidthStartTime:(NSString*)t1 andEndTime:(NSString*)t2
{
    t1 = [t1 stringByReplacingOccurrencesOfString:@":"
                                         withString:@"."];
    NSArray *arr=[t1 componentsSeparatedByString:@"."];
    int s1=[[arr objectAtIndex:0] intValue];
    int s3=[[arr objectAtIndex:1] intValue];
    t2 = [t2 stringByReplacingOccurrencesOfString:@":"
                                       withString:@"."];
    NSArray *arr2=[t2 componentsSeparatedByString:@"."];
    int s2=[[arr2 objectAtIndex:0] intValue];
    int s4=[[arr2 objectAtIndex:1] intValue];
    CGFloat porigin,zorigin;
   
    if(s3==0)
    {
        porigin =((s1-1)*60);
    }
    else
    {
      porigin =((s1*60)-(60-s3));  
    }
    zorigin =((s2*60)-(60-s4));
    return CGRectMake(porigin, 0, zorigin-porigin, 70);
}
-(UIView *)createCustomView:(NSArray *)array
{
   
    UIView *custom = [[UIView alloc]initWithFrame:[self formulawidthStartTime:[array objectAtIndex:0] andEndTime:[array objectAtIndex:1]]];
    UILabel *lblleft= [[UILabel alloc]initWithFrame:CGRectMake(0, 0,custom.frame.size.width, 10)];
    UILabel *lblright= [[UILabel alloc]initWithFrame:CGRectMake(0, 0,custom.frame.size.width, 10)];
    UILabel *lblname= [[UILabel alloc]initWithFrame:CGRectMake(0, 12,custom.frame.size.width,50)];
    lblleft.font=[UIFont systemFontOfSize:10];
     lblright.font=[UIFont systemFontOfSize:10];
     lblname.font=[UIFont systemFontOfSize:12];
    lblname.textAlignment=NSTextAlignmentCenter;
     lblleft.textAlignment=NSTextAlignmentLeft;
     lblright.textAlignment=NSTextAlignmentRight;
    lblleft.text=[array objectAtIndex:0];
     lblright.text=[array objectAtIndex:1];
     lblname.text=[array objectAtIndex:2];
    [custom addSubview:lblleft];
    [custom addSubview:lblright];
    [custom addSubview:lblname];
    switch ([[array objectAtIndex:3] intValue]) {
        case 1:
        {
             [custom setBackgroundColor:[UIColor darkGrayColor]];
        }
        break;
        case 2:
        {
             [custom setBackgroundColor:[UIColor purpleColor]];
        }
            break;
        case 3:
        {
             [custom setBackgroundColor:[UIColor blueColor]];
        }
            break;
        case 4:
        {
             [custom setBackgroundColor:[UIColor greenColor]];
        }
        break;
        default:
            break;
    }
   
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [custom addGestureRecognizer:singleFingerTap];
    
    return custom;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{

}
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"clicked");
    
    UIView *selectedView = (UIView *)recognizer.view;
    if([_cellDelegate respondsToSelector:@selector(cellSelected:)])
    [_cellDelegate cellSelected:selectedView];
}
@end
