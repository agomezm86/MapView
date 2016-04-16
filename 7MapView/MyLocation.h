//
//  MyLocation.h
//  7MapView
//
//  Created by Alejandro Gomez on 13/01/14.
//  Copyright (c) 2014 Intergrupo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyLocation : NSObject <MKAnnotation>

- (id)initWithName:(NSString *)name address:(NSString *)address coordinates:(CLLocationCoordinate2D)coordinates;

@end
