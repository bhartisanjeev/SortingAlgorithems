//
//  ViewController.m
//  SelectionSort
//
//  Created by Sanjeev Bharti on 3/25/15.
//  Copyright (c) 2015 Sanjeev Bharti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
// quick sort methods

- (void)swapElementsWithStart:(NSInteger)start andEndIndex:(NSInteger)end ;
- (NSInteger)calculatePivotInArray:(NSMutableArray *)elementsList withStart:(NSInteger)start endIndex:(NSInteger)end andPivot:(NSInteger)pivot ;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - Selection Sort

- (void)performSelectionSortOnArray:(NSMutableArray *)listOfElements {

    for (int i = 0 ; i < listOfElements.count ; i++) {
        
        int pointer = i ;
        
        for (int j = i; j < listOfElements.count ; j++) {
            
            if ([listOfElements objectAtIndex:pointer] > [listOfElements objectAtIndex:j]) {
                
                pointer = j ;
            }
            
        } //inner for loop closed
        
        NSNumber *tempNumber = [listOfElements objectAtIndex:i];
        [listOfElements replaceObjectAtIndex:i withObject:[listOfElements objectAtIndex:pointer]];
        [listOfElements replaceObjectAtIndex:pointer withObject:tempNumber];
        
    } //outer loop closed

}


#pragma mark -
#pragma mark - Quick Sort To sort Array Elements

- (void)sortArray:(NSMutableArray *)elementsList withStart:(NSInteger)start andEnd:(NSInteger)end {
    
    if (start > end) return ;
    
    NSInteger pivot = [self calculatePivotInArray:elementsList withStart:start endIndex:end andPivot:start];
    
    [self sortArray:elementsList withStart:start andEnd:pivot - 1];
    [self sortArray:elementsList withStart:pivot+1 andEnd:end];
}

#pragma mark -
#pragma mark - Private Methods related to quick sort

- (NSInteger)calculatePivotInArray:(NSMutableArray *)elementsList withStart:(NSInteger)start endIndex:(NSInteger)end andPivot:(NSInteger)pivot {
    
    while (start != end) {
        
        if (pivot == start) {
            // we will start from right
            
            if ([[elementsList objectAtIndex:pivot] integerValue] < [[elementsList objectAtIndex:end] integerValue]) end-- ;
            
            else {
                
                [self swapElementsWithStart:pivot andEndIndex:end];
                start++ ;
                pivot = end ;
            }
            
        } else {
            // we will start from left
            
            if ([[elementsList objectAtIndex:pivot] integerValue] > [[elementsList objectAtIndex:start] integerValue]) start++ ;
            
            else {
                [self swapElementsWithStart:pivot andEndIndex:start];
                end-- ;
                pivot = start ;
            }
        }
    }
    
    return pivot ;
}

- (void)swapElementsWithStart:(NSInteger)start andEndIndex:(NSInteger)end {
    
    NSInteger valueOfStart  = [[arrListOfElementsToSort objectAtIndex:start] integerValue];
    NSInteger valueOfEnd    = [[arrListOfElementsToSort objectAtIndex:end] integerValue];
    
    valueOfStart    = valueOfStart + valueOfEnd ;
    valueOfEnd      = valueOfStart - valueOfEnd ;
    valueOfStart    = valueOfStart - valueOfEnd ;

    [arrListOfElementsToSort replaceObjectAtIndex:start withObject:[NSNumber numberWithInteger:valueOfStart]];
    [arrListOfElementsToSort replaceObjectAtIndex:end withObject:[NSNumber numberWithInteger:valueOfEnd]];
    
}

#pragma mark - 
#pragma mark - All Sorting Actions

- (IBAction)currentSorting:(UIButton *)sender {
    
    switch (sender.tag) {
            
        case 0:
            [self fillRandomElementsIntoArray];
            [self performSelectionSortOnArray:arrListOfElementsToSort];
            NSLog(@"\n\n Sorted array using selection sort = %@",arrListOfElementsToSort);

            break;
            
        case 1:
            
            [self fillRandomElementsIntoArray];
            [self sortArray:arrListOfElementsToSort withStart:0 andEnd:arrListOfElementsToSort.count - 1];
            NSLog(@"\n\n Sorted array using Quick Sort = %@",arrListOfElementsToSort);

        default:
            break;
    }
    
} //method closed

#pragma mark -
#pragma mark - Other methods

- (void)fillRandomElementsIntoArray {
    
    if (!arrListOfElementsToSort) {
        arrListOfElementsToSort = [[NSMutableArray alloc] init];
    }
    
    [arrListOfElementsToSort removeAllObjects];
    
    int n = 60000 ;
    
    while (n-- > 0) [arrListOfElementsToSort addObject:[NSNumber numberWithInteger:arc4random() % 26000]] ;
    
    NSLog(@"Unsorted array  = %@",arrListOfElementsToSort);
}



@end
