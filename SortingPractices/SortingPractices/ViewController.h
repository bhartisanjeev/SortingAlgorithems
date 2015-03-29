//
//  ViewController.h
//  SelectionSort
//
//  Created by Sanjeev Bharti on 3/25/15.
//  Copyright (c) 2015 Sanjeev Bharti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    NSMutableArray *arrListOfElementsToSort ;
    
}

// methods
- (IBAction)currentSorting:(UIButton *)sender ;

- (void)performSelectionSortOnArray:(NSMutableArray *)listOfElements ;
- (void)sortArray:(NSMutableArray *)elementsList withStart:(NSInteger)start andEnd:(NSInteger)end ;

@end

