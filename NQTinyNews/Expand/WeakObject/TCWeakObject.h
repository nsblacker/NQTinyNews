//
//  TCWeakObject.h
//  NQTinyNews
//
//  Created by NaQiang_iMac on 2017/8/15.
//  Copyright © 2017年 那强. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  为其他Object类添加弱引用外壳
 *  相等性的判断我不知是否有用，本类用于实现多重代理，将协议对象在此加弱引用壳
 *  然后添加到mutableSet中，相等性的实现明确了mutableSet的去重机制——传进来的objNeededWeaken（而非TCWeakObject）地址相同才算相同，不能被添加到代理集合中，满足需求。
 *  如果采用不把delegate封进这个类中的方法，那么MutableSet在添加时还是会检查被添加对象的相等性；如果使用MutableArray来存储delegate，需要使用containsObject:方法来去重，否则会抽个重复添加
 */
@interface TCWeakObject : NSObject

+ (instancetype)weakobjectWithObj:(id)obj;
- (instancetype)initWithObject:(id)obj;

@end
