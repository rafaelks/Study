//
//  main.m
//  Hello Objective-C
//
//  Created by Rafael Kellermann Streit on 12/5/13.
//  Copyright (c) 2013 Rafael Kellermann Streit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        // NSNumber
        NSNumber *number = @30;
        NSLog(@"%@", number);
        
        
        // NSString
        NSString *name = @"Rafael";
        name = [name stringByAppendingString:@" Kellermann Streit"];
        NSLog(@"Nome é: %@", name);
        
        
        // Person
        Person *rafael = [[Person alloc] init];
        [rafael setName:@"Rafael Kellermann Streit"];
        [rafael setId:30];
        NSLog(@"Nome da pessoa (%ld): %@", [rafael getId], [rafael getName]);
        
        
        // NSArray
        NSArray *array = @[@"Rafael", @"Kellermann", @"Streit", @30, @{@"foo": @"bar"}, [NSNull null]];
        NSLog(@"%@", array);
        
        
        // NSDictionary
        NSDictionary *foo = @{@"foo": @"bar"};
        NSLog(@"%@", foo);
    }

    return 0;
}

