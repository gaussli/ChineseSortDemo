//
//  JHChineseSort.m
//  ChineseSortDemo
//
//  Created by lijinhai on 12/24/14.
//  Copyright (c) 2014 gaussli. All rights reserved.
//

#import "JHChineseSort.h"
#import "JHChineseInfo.h"

@implementation JHChineseSort

// 中文字符串转换成拼音
- (NSString*) chineseStringTransformPinyin: (NSString*)chineseString {
    if (chineseString == nil) {
        return nil;
    }
    // 拼音字段
    NSMutableString *tempNamePinyin = [chineseString mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)tempNamePinyin, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)tempNamePinyin, NULL, kCFStringTransformStripDiacritics, NO);
    return tempNamePinyin.uppercaseString;
}

// 对中文字符串数组进行排序
- (NSArray*) chineseSortWithStringArray: (NSArray*)stringArray {
    if (stringArray == nil) {
        return nil;
    }
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < [stringArray count] ; i++) {
        if (![[stringArray objectAtIndex:i] isKindOfClass:[NSString class]]) {
            return nil;
        }
        NSDictionary *tempDic = [[NSDictionary alloc] initWithObjectsAndKeys:[stringArray objectAtIndex:i], @"chinese", [self chineseStringTransformPinyin:[stringArray objectAtIndex:i]], @"pinyin", nil];
        [tempArray addObject:tempDic];
    }
    // 排序
    [tempArray sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [[obj1 objectForKey:@"pinyin"] compare:[obj2 objectForKey:@"pinyin"]];
    }];
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    for (NSDictionary *tempDic in tempArray) {
        [resultArray addObject:[tempDic objectForKey:@"chinese"]];
    }
    return resultArray;
}

// 对包含中文字符串字段的字典数组进行排序
- (NSArray*) chineseSortWithDictionaryArray: (NSArray*)dictionaryArray andFieldKey: (NSString*)fieldKey {
    if (dictionaryArray == nil) {
        return nil;
    }
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < [dictionaryArray count] ; i++) {
        if (![[dictionaryArray objectAtIndex:i] isKindOfClass:[NSDictionary class]]) {
            return nil;
        }
        NSDictionary *tempDic = [[NSDictionary alloc] initWithObjectsAndKeys:[dictionaryArray objectAtIndex:i], @"info", [self chineseStringTransformPinyin:[[dictionaryArray objectAtIndex:i] objectForKey:fieldKey]], @"pinyin", nil];
        [tempArray addObject:tempDic];
    }
    // 排序
    [tempArray sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [[obj1 objectForKey:@"pinyin"] compare:[obj2 objectForKey:@"pinyin"]];
    }];
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    for (NSDictionary *tempDic in tempArray) {
        [resultArray addObject:[tempDic objectForKey:@"info"]];
    }
    return resultArray;
}

// 对JHChineseInfo子类对象的数组进行排序
- (NSArray*) chineseSortWithObjectArray: (NSArray*)objectArray {
    if (objectArray == nil) {
        return nil;
    }
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < [objectArray count] ; i++) {
        if (![[objectArray objectAtIndex:i] isKindOfClass:[JHChineseInfo class]]) {
            return nil;
        }
        NSDictionary *tempDic = [[NSDictionary alloc] initWithObjectsAndKeys:[objectArray objectAtIndex:i], @"info", [self chineseStringTransformPinyin:((JHChineseInfo*)[objectArray objectAtIndex:i]).JHChineseString], @"pinyin", nil];
        [tempArray addObject:tempDic];
    }
    // 排序
    [tempArray sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [[obj1 objectForKey:@"pinyin"] compare:[obj2 objectForKey:@"pinyin"]];
    }];
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    for (NSDictionary *tempDic in tempArray) {
        [resultArray addObject:[tempDic objectForKey:@"info"]];
    }
    return resultArray;
}

@end
