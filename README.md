# HorizontalTimesLayout

TO DISPLAY TIME SLOTS IN 24 HOUR FORMAT

PROJECT CONTAINS IDEA TO DEVELOP A CALENDAR TYPE LAYOUT USING TABLEVIEW IN WHICH IF REQUIREMENTS ARE  TO SHOW TIME IN HORIZONTAL LAYOUT AND EVENTS IN VERTICAL LAYOUT.

PROJECT EXAMPLE SHOWING LIST OF RESOURCES USAGE IN 24 HOUR FORMAT.

USAGE

````
-(void)prepareStatusDic
{
    NSArray *arr=[NSArray arrayWithObjects:@"1:40",@"2:40",@"DJ-IL",@"1",nil];
    NSArray *arr1=[NSArray arrayWithObjects:@"4:00",@"7:20",@"PJ-IL", @"2",nil];
    NSArray *arr2=[NSArray arrayWithObjects:@"3:55",@"12:30",@"PR-IL",@"3", nil];
    NSArray *arr3=[NSArray arrayWithObjects:@"17:10",@"23:00",@"PU-IL",@"4", nil];
    someDictionary = @{@"0" : arr,@"2" : arr1,@"3" : arr2,@"4" : arr3};
}
````
Above method will add event with different color in cell

````
NSArray *arr=[NSArray arrayWithObjects:@"1:40",@"2:40",@"DJ-IL",@"1",nil];
````
Arr Element
1 - start time
2 - End time
3 - Text to display on event
4 - Color of event

````
someDictionary = @{@"0" : arr,@"2" : arr1,@"3" : arr2,@"4" : arr3};
````

Key - index of row at which you want to add event
value - event data

````
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
CellHorizontalScroll *hsc =[cv dequeueReusableCellWithReuseIdentifier:@"CellHorizontalScroll"
                                                                                 forIndexPath:indexPath];
          //  [hsc setBackgroundColor:[UIColor whiteColor]];
            [hsc setUpCellWithArray:[someDictionary objectForKey:[NSString stringWithFormat:@"%ld",(long)cv.tag]]];
            hsc.cellDelegate = self;
            [hsc.scroll setFrame:CGRectMake(hsc.scroll.frame.origin.x, hsc.scroll.frame.origin.y, hsc.frame.size.width, 70 )];
           hsc.scroll.contentOffset= CGPointMake(self.collEventTimeHeader.contentOffset.x,0.0);
            return hsc;
    }
}

````

This displat event call this method in collection view cell for row at index path delegate method
````
[hsc setUpCellWithArray:[someDictionary objectForKey:[NSString stringWithFormat:@"%ld",(long)cv.tag]]];
````

To manage event click event use below custom delegate method of calender cell
````
-(void)callSelected:(id)sender
{
  //Handle click event
}

````

To customize UI for event use below method

````
-(UIView *)createCustomView:(NSArray *)array
{
}
````

Sample project output

<img src="https://github.com/PayalUmraliya/HorizontalTimesLayout/blob/master/pucalender.gif" width="320" height="564"/>
