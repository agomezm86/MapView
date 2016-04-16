//
//  MapOverlayView.m
//  7MapView
//
//  Created by Alejandro Gomez on 13/01/14.
//  Copyright (c) 2014 Intergrupo. All rights reserved.
//

#import "MapOverlayView.h"

@interface MapOverlayView ()

@property (nonatomic, strong) UIImage *overlayImage;

@end

@implementation MapOverlayView

@synthesize overlayImage;

- (id)initWithOverlay:(id<MKOverlay>)overlay overlayImage:(UIImage *)aImage
{
    if (self == [super init])
    {
        self.overlayImage = aImage;
    }
    return self;
}

- (void)drawMapRect:(MKMapRect)mapRect zoomScale:(MKZoomScale)zoomScale inContext:(CGContextRef)context
{
    CGImageRef imageReference = self.overlayImage.CGImage;
    MKMapRect theMapRect = self.overlay.boundingMapRect;
    CGRect theRect = [self rectForMapRect:theMapRect];
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextTranslateCTM(context, 0.0, -theRect.size.height);
    CGContextDrawImage(context, theRect, imageReference);
}

@end
