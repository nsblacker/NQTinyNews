//
//  TCWeakObject.m
//  NQTinyNews
//
//  Created by NaQiang_iMac on 2017/8/15.
//  Copyright © 2017年 那强. All rights reserved.
//

#import "TCWeakObject.h"
@interface TCWeakObject()
@property(nonatomic ,readonly ,weak)id objNeededWeaken;
@end

@implementation TCWeakObject
+ (instancetype)weakobjectWithObj:(id)obj{
    return [[TCWeakObject alloc]initWithObject:obj];
}

- (instancetype)initWithObject:(id)obj{
    if(self = [super init]){
        _objNeededWeaken = obj;
    }
    return self;
}


- (BOOL)isEqual:(id)object{
    if(object == self){
        return YES;
    }
    if(![object isKindOfClass:[self class]]){
        return NO;
    }
    BOOL match = [self isEqualToWeakObject:(TCWeakObject *)object];
    return match;
}

- (BOOL)isEqualToWeakObject:(TCWeakObject *)object{
    if(!object){
        return NO;
    }
    
    BOOL sameObj = [self.objNeededWeaken isEqual:object.objNeededWeaken];
    //BOOL sameObj = self.objNeededWeaken == object.objNeededWeaken;
    return sameObj;
}

- (NSUInteger)hash{
    return [self.objNeededWeaken hash];
}

@end
