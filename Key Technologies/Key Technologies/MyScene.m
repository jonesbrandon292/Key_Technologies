//
//  MyScene.m
//  Key Technologies
//
//  Created by Brandon Scott Jones on 11/24/13.
//  Copyright (c) 2013 Brandon Scott Jones. All rights reserved.
//

#import "MyScene.h"
#import <CoreLocation/CoreLocation.h>

@implementation MyScene
{
    CLLocationManager* locationManager;
    SKLabelNode* locationLabel;
}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
        
        //GPS
        [self startStandardUpdates];
        
        locationLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        locationLabel.text = @"GPS Location: ";
        locationLabel.fontSize = 8;
        locationLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMaxY(self.frame) * 0.25f);
        
        [self addChild:locationLabel];
    }
    return self;
}

- (void)startStandardUpdates
{
    // Create the location manager if this object does not
    // already have one.
    if (nil == locationManager)
        locationManager = [[CLLocationManager alloc] init];
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    
    // Set a movement threshold for new events.
    locationManager.distanceFilter = 1; // meters
    
    [locationManager startUpdatingLocation];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
//    for (UITouch *touch in touches) {
//        CGPoint location = [touch locationInNode:self];
//        
//        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
//        
//        sprite.position = location;
//        
//        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
//        
//        [sprite runAction:[SKAction repeatActionForever:action]];
//        
//        [self addChild:sprite];
//    }
}

-(void)update:(CFTimeInterval)currentTime
{
    locationLabel.text = [NSString stringWithFormat:@"latitude %+.6f, longitude %+.6f\n", locationManager.location.coordinate.latitude, locationManager.location.coordinate.longitude];
}

@end
