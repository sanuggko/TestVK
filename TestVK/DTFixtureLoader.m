//
//  DTFixtureLoader.m
//  EmergencyRadio
//
//  Created by Denys Telezhkin on 05.11.13.
//
//

#import "DTFixtureLoader.h"

@implementation DTFixtureLoader

+(instancetype)loader
{
    return [self loaderInBundle:[NSBundle mainBundle]];
}

+(instancetype)loaderInBundle:(NSBundle *)bundle
{
    DTFixtureLoader * loader = [self new];
    
    loader.fileBundle = bundle;
    
    return loader;
}

-(void)dealloc
{
    self.error = nil;
    self.fileBundle = nil;
}

-(id)jsonObjectFromFileNamed:(NSString *)fileName
{
    NSError *error = nil;
    NSString *filePath = [self.fileBundle pathForResource:fileName
                                                   ofType:nil];
    NSLog(@"filePath are %@", filePath);
    NSData * data = [NSData dataWithContentsOfFile:filePath];
    
    id parsedObject = [NSJSONSerialization JSONObjectWithData:data
                                                      options:NSJSONReadingAllowFragments
                                                        error:&error];
    
    if (!parsedObject)
    {
        self.error = error;
        NSLog(@"error :%@ ",error);
    }

    return parsedObject;
}

@end
