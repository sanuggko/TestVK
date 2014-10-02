//
//  DTFixtureLoader.h
//  EmergencyRadio
//
//  Created by Denys Telezhkin on 05.11.13.
//
//

#import <Foundation/Foundation.h>

@interface DTFixtureLoader : NSObject

+(instancetype)loader;

+(instancetype)loaderInBundle:(NSBundle *)bundle;

/**
 [NSBundle mainBundle] by default
 */
@property (nonatomic, retain) NSBundle * fileBundle;

@property (nonatomic, retain) NSError * error;

-(id)jsonObjectFromFileNamed:(NSString *)fileName;

@end
