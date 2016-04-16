//
//  MapOverlay.m
//  7MapView
//
//  Created by Alejandro Gomez on 13/01/14.
//  Copyright (c) 2014 Intergrupo. All rights reserved.
//

#import "MapOverlay.h"

@interface MapOverlay ()

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, assign) MKMapRect rect;

@end

@implementation MapOverlay

@synthesize coordinate;
@synthesize rect;

- (id)initWithCoordinate:(CLLocationCoordinate2D)myCoordinate mapRect:(MKMapRect)boundingMapRect
{
    if (self == [super init])
    {
        self.coordinate = myCoordinate;
        self.rect = boundingMapRect;
    }
    return self;
}

- (CLLocationCoordinate2D)coordinate
{
    return self.coordinate;
}

- (MKMapRect)boundingMapRect
{
    return self.rect;
}

@end
