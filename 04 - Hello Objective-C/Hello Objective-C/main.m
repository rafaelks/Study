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
        Person *rafael = [[Person alloc] initWithLive:YES];
        [rafael setName:@"Rafael Kellermann Streit"];
        [rafael setIdPerson:30];
        NSLog(@"Nome da pessoa (%ld): %@", [rafael idPerson], [rafael name]);
        
        
        // NSArray
        NSArray *array = @[@"Rafael", @"Kellermann", @"Streit", @30, @{@"foo": @"bar"}];
        NSLog(@"%@", array);
        
        
        // NSDictionary
        NSDictionary *foo = @{@"foo": @"bar"};
        NSLog(@"%@", foo);
        
        [rafael isLive];
    }

    return 0;
}

