//
//  MyLocation.m
//  7MapView
//
//  Created by Alejandro Gomez on 13/01/14.
//  Copyright (c) 2014 Intergrupo. All rights reserved.
//

#import "MyLocation.h"

@interface MyLocation ()

@property (nonatomic, copy) NSString *aName;
@property (nonatomic, copy) NSString *aAddress;
@property (nonatomic, assign) CLLocationCoordinate2D aCoordinate;

@end

@implementation MyLocation

@synthesize aName;
@synthesize aAddress;
@synthesize aCoordinate;

- (id)initWithName:(NSString *)name address:(NSString *)address coordinates:(CLLocationCoordinate2D)coordinates
{
    if (self == [super init])
    {
        self.aName = name;
        self.aAddress = address;
        self.aCoordinate = coordinates;
    }
    return self;
}

- (NSString *)title
{
    return self.aName;
}

- (NSString *)subtitle
{
    return self.aAddress;
}

- (CLLocationCoordinate2D)coordinate
{
    return self.aCoordinate;
}

@end
