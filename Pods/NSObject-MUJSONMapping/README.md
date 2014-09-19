NSObject-MUJSONMapping
======================

NSObject category which automatically fill properties in you object from JSON dictionary recursively. 

#### Implemetation

We have model like this
```Objective-c
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
We need to specify propertyMap keys for properties which called differently from the JSON structure

```Objective-c

//FBWork.m
- (NSDictionary *)propertyMap
{
    return @{@"id": @"ident",
             @"first_name": @"firstName",
             @"last_name":  @"lastName",
             @"updated_time": @"updatedTime"};
}
```

And we also need specify which type of objects contains array work. 

```Objective-c
//FBWork.m
- (Class)classForElementsInArrayProperty:(NSString *)propertyName
{
    return [FBWork class];
}
```

If the object implement `initWithJSON:` it is initialized by this way. If not it is initialized by its `init` method and after then it is filled by `fillWithJSON:` method.

#### NSManagedObjects

We need to create our NSManagedObjects with the right designated initializer so we add category to the NSManagedObject which implements `initWithJSON:` method.

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
```


If you are using AFNetworking give a look at  <a href="https://github.com/Ulianko/AFNetworking-MUResponseSerializer">AFNetworking-MUResponseSerializer</a> 

### Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like AFNetworking in your projects. See the ["Cocoapod.org" guide for more information](http://cocoapods.org).

#### Podfile

```ruby
platform :ios, '7.0'
pod "NSObject-MUJSONMapping"
```

## Contact

* [@MartinUlianko](https://twitter.com/MartinUlianko) on Twitter
* [@Ulianko](https://github.com/Ulianko) on Github
* <a href="mailTo:martin@ulianko.com">martin@ulianko.com</a>


