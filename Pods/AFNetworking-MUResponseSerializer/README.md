AFNetworking-MUResponseSerializer
=====================================

Automatically serialize JSON response to your object model. It also work with Core Data NSManagedObjects.

# Usage

### AFNetworking

```Objective-c
AFHTTPRequestOperationManager *operationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://graph.facebook.com/"]];
[operationManager setResponseSerializer:[[MUJSONResponseSerializer alloc] initWithResponseClass:[FBUser class]]];

[operationManager GET:@"me" 
		   parameters:nil
              success:^(AFHTTPRequestOperation *operation, id responseObject) 
{                                                
 	// response object is your FBUser object with all properties filled   
} 			  failure:^(AFHTTPRequestOperation *operation, NSError *error){}];
```

### NSObjects


```Objective-c
#import "MUJSONResponseSerializer.h"
#import "FBWork.h"

@interface FBUser : NSObject

@property (nonatomic, strong) NSString *ident;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSURL *link;

// array of FBWork objects
@property (nonatomic, strong) NSArray *work;

@property (nonatomic, strong) NSString *gender;
@property (nonatomic) NSInteger timezone;
@property (nonatomic, strong) NSString *locale;
@property (nonatomic, getter=isVerified) BOOL verified;
@property (nonatomic, strong) NSDate *updatedTime;
@property (nonatomic, strong) NSString *username;

@end
```

```Objective-c
#import "FBUser.h"

@implementation FBUser

- (NSDictionary *)propertyMap
{
    
    // There is no need to map all properties, only those which you want to have diffrent names;
    return  self.propertyMap = @{@"id":         @"ident",
                         @"first_name": @"firstName",
                         @"last_name":  @"lastName",
                         @"updated_time": @"updatedTime"};
}

- (Class)classForElementsInArrayProperty:(NSString *)propertyName
{
    return [FBWork class];
}

@end
```

### NSManagedObjects
We need implement initWithJSON into NSManagedObject. NSManagedObject+MUResponseObject.h category initialize NSManagedObject and fill it up with properties. 

```Objective-c
@implementation NSManagedObject (MUResponseObject)

- (NSManagedObject *)initWithJSON:(id)JSON
{
    NSManagedObjectContext *context = nil; // get your context if you want, e.g. from singleton object
    
    if(self = [self initWithContext:context])
    {
        [self fillWithJSON:JSON];
    }
    
    return self;
}

- (NSManagedObject *)initWithContext:(NSManagedObjectContext *)context
{
    NSString *entityName = NSStringFromClass([self class]);
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:context];
    
    if(self = [self initWithEntity:entity insertIntoManagedObjectContext:context])
    {
        
    }
    
    return self;
}

@end
```

### Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like AFNetworking in your projects. See the ["Cocoapod.org" guide for more information](http://cocoapods.org).

#### Podfile

```ruby
platform :ios, '7.0'
pod "AFNetworking-MUNResponseSerializer"
```

## Contact

* [@MartinUlianko](https://twitter.com/MartinUlianko) on Twitter
* [@Ulianko](https://github.com/Ulianko) on Github
* <a href="mailTo:martin@ulianko.com">martin@ulianko.com</a>
