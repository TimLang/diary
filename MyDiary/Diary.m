//
//  Diary.m
//  MyDiary
//
//  Created by 刘铭 on 12-11-7.
//  Copyright (c) 2012年 刘铭. All rights reserved.
//

#import "Diary.h"

@implementation Diary

+ (id)createDiary{
    Diary *newDiary = [[Diary alloc] init];
    
    return newDiary;
}

-(id)init
{
    return [self initWithTitle:@"" content:@""];
}

-(id)initWithTitle:(NSString *)theTitle content:(NSString *)theContent
{
    self = [super init];
    if (self) {
        [self setTitle:theTitle];
        [self setContent:theContent];
        _dateCreate = [[NSDate alloc] init];
    }
    return self;
}

@end
