//
//  main.m
//  lb_19_NSArray_1
//  IT_Step_Zaporogye
//  Created by admin on 4/8/17.
//  Copyright © 2017 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
/*
        const int sizeP = 7;
        const int size = 5;
        
        int **p;
        p = (int**)malloc(sizeof(int *) * sizeP);
        
        for (int i = 0; i < sizeP; i++) {
            p[i] = (int*)malloc(sizeof(int) * size);
        }
        for (int i = 0; i < sizeP; i++) {
            for (int j = 0; j < size; j++) {
                p[i][j] = 10 * (i + 1) +j;
            }
        }
        
        for (int i = 0; i < sizeP; i++) {
            for (int j = 0; j < size; j++) {
                printf("p[%i][%i] = %i", i , j, p[i][j]);
            }
        }
        
        for (int i = 0; i < sizeP; i++) {
                free(p[i]);
                p[i] = nil;
        }
        
        free(p);
        p = nil;
        
      */
         NSArray *A = [NSArray arrayWithObjects:@1, @2, @"Hello World", @"Apple", nil];
         
         //Перебор NSArray с помощью for(){}
         for(NSObject *obj in A){
         NSLog(@"%@", obj);
         }
         //или
         for(id object in A){
         NSLog(@"%@", object);
         }
            NSArray *prods = [NSArray arrayWithObjects:
                               [[Product alloc] initWithName:@"Snikers" price:12.5 weight:45],
                               [[Product alloc] initWithName:@"Mars" price:14.7 weight:55],
                               [[Product alloc] initWithName:@"Bounty" price:11.2 weight:40],
                               nil];
             
             for (Product *p in prods) {
                 NSLog(@"%@", p);
             }
 
        NSString *str[3];
        str[0] = @"First";
        str[1] = @"Second";
        str[1] = @"Third";
        
        NSArray *stringsArray = [NSArray arrayWithObjects:str count:2]; //count сколько элементов с начала мы хотим взять
        
        for (NSString *s in stringsArray){
            NSLog(@"%@", s);
        }
        
        NSArray *prods2 = [NSArray arrayWithArray:prods];
        for (Product *prod in prods2) {
            NSLog(@"prods2 - %@", prod);
        }
        
        //-----------------------------------------------------
        Product *a = [[Product alloc] initWithName:@"Snikers" price:12.5 weight:45];
        Product *b = [[Product alloc] initWithName:@"Mars" price:14.7 weight:55];
        Product *c = [[Product alloc] initWithName:@"Bounty" price:11.2 weight:40];
        
        NSArray *prodObj = [[NSArray alloc] initWithObjects: a, b, c, nil];
        BOOL result = [prodObj containsObject:a];
        
        if (result == true) {
            NSLog(@"object %@ in array", a);
        } else {
            NSLog(@"object %@ is not in array", a);
        }
        NSLog(@"Count elements in array %lu", prodObj.count);
        NSLog(@"%@", prodObj);
        
        //-----------------------------------------------------
        NSArray *months = [NSArray arrayWithObjects:
                           @"January", @"February", @"March",
                           @"April", @"May", @"June", nil];
        NSInteger index = [months indexOfObject:@"May"];
        
        if (index != NSNotFound) {
            NSLog(@"Element in array");
        } else {
            NSLog(@"object at index %lu not found", index);
        }
        
        //-----------------------------------------------------
        NSRange range = { 0, 3};
        index = [months indexOfObject:@"May" inRange:range];
        if (index != NSNotFound) {
            NSLog(@"Element in array");
        } else {
            NSLog(@"object at index %lu not found", index);
        }

        //-----------------------------------------------------
        NSArray *newMonths = [months arrayByAddingObject:@"June"];
        NSLog(@"newMounth - %@", newMonths);
        
        //-----------------------------------------------------
        range.location = 1;
        range.length = 4;
        NSArray *subArray = [months subarrayWithRange:range];
        NSLog(@"subArray %@", subArray);
        
        //-----Sort array with block---------------------------
        
        NSArray *numbers = [NSArray arrayWithObjects:@"10", @"2", @"20", @"34", nil];
        NSArray *array = [numbers sortedArrayUsingComparator: ^(id obj1, id obj2) {
            int number1 = [obj1 intValue];
            int number2 = [obj2 intValue];
            
            if (number1 > number2) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            
            if (number1 < number2) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            return (NSComparisonResult)NSOrderedSame;
        }];
        NSLog(@"sorted array %@", array);
        
        //---------Product sorted-------------------------------
        NSArray *prodsArray = [NSArray arrayWithObjects:
                          [[Product alloc] initWithName:@"Snickers" price:12.5 weight:45],
                          [[Product alloc] initWithName:@"Mars"     price:10.3 weight:50],
                          [[Product alloc] initWithName:@"Bounty"   price:8.9  weight:40],
                          [[Product alloc] initWithName:@"Twix"     price:15.0 weight:70],
                          [[Product alloc] initWithName:@"KitKat"   price:11.5 weight:15],
                          nil];
        NSArray *sortedArrayProdByPrice = [prodsArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            
            Product *prod1 = (Product*)obj1;
            Product *prod2 = (Product*)obj2;
           
            if (prod1.price > prod2.price) {
                return NSOrderedDescending;
            }
            
            if (prod1.price < prod2.price) {
                return NSOrderedAscending;
            }
            return NSOrderedSame;
            
        }];
        NSLog(@"sorted products array by price %@", sortedArrayProdByPrice);
        
        NSArray *sortedByWeight = [prodsArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            if (((Product*)obj1).weight > ((Product*)obj2).weight) {
                return NSOrderedDescending;
            }
            if (((Product*)obj1).weight < ((Product*)obj2).weight) {
                return NSOrderedAscending;
            }
            return NSOrderedSame;
        }];
        NSLog(@"sorted products array by weight %@", sortedByWeight);

        NSArray *sortedByName = [prods sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [((Product*)obj1).name compare:((Product*)obj2).name];
        }];
        NSLog(@"sorted products array by name %@", sortedByName);
        
        //Домашнее задание NSMutableArray объектов Product, у пользователя меню:
        // 1 - Add
        // 2 - Del
        // 3 - Sort By Name
        // 4 - Sort By Price
        // 5 - Sort By wweight
        // 6 - Product arraay show
        // 7 - program exit
        

    }
    return 0;
}
