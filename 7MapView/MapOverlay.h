//
//  MapOverlay.h
//  7MapView
//
//  Created by Alejandro Gomez on 13/01/14.
//  Copyright (c) 2014 Intergrupo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapOverlay : NSObject <MKOverlay>

- (id)initWithCoordinate:(CLLocationCoordinate2D)myCoordinate mapRect:(MKMapRect)boundingMapRect;

@end
