//
//  Product.h
//  urok_19
//
//  Created by Master on 11.01.16.
//  Copyright (c) 2016 Master. All rights reserved.
//

@interface Product : NSObject{
    NSString *name;
    double price;
    int weight;
}

@property (readonly) double price;

-(id) initWithName : (NSString *) nm price : (double) pr weight : (int) wg;
-(NSString *) description;

@end