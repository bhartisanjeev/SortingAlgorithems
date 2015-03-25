//
//  ViewController.m
//  SelectionSort
//
//  Created by Sanjeev Bharti on 3/25/15.
//  Copyright (c) 2015 Sanjeev Bharti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *listOfElements = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInteger:99],[NSNumber numberWithInteger:199],[NSNumber numberWithInteger:991],[NSNumber numberWithInteger:0],[NSNumber numberWithInteger:1],[NSNumber numberWithInteger:22],[NSNumber numberWithInteger:399],[NSNumber numberWithInteger:101], nil];
    
        NSLog(@"UnSorted Array = %@",listOfElements);
    
        [self performSelectionSortOnArray:listOfElements];
}

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
    
    NSLog(@"\n\n Sorted Array from selection sort = %@",listOfElements);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
