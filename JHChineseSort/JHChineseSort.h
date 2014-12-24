//
//  JHChineseSort.h
//  ChineseSortDemo
//
//  Created by lijinhai on 12/24/14.
//  Copyright (c) 2014 gaussli. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @brief 关于中文排序的类
 */
@interface JHChineseSort : NSObject

/*!
 @brief 把中文字符串转换成拼音
 @params chineseString 中文字符串
 @return 中文字符串对应的拼音，当参数chineseString为nil时返回nil
 */
- (NSString*) chineseStringTransformPinyin: (NSString*)chineseString;

/*!
 @brief 对中文字符串数组进行排序。数组的元素是字符串（NSString）
 @params stringArray 未排序的中文字符串数组
 @return 返回已排序的中文字符串数组，当参数stringArray为nil或者并不是字符串数组时返回nil
 */
- (NSArray*) chineseSortWithStringArray: (NSArray*)stringArray;

/*!
 @brief 对包含中文字符串字段的字典数组进行排序。数组的元素是字典（NSDictionary），其中需要排序的中文字段是fieldKey
 @params dictionaryArray 包含中文字符串字段的字典数组
 @params fieldKey 需要排序的中文字段
 @return 返回已排序的包含中文字符串字段的字典数组，当参数dictionaryArray为nil或者并不是字典数组时返回nil
 */
- (NSArray*) chineseSortWithDictionaryArray: (NSArray*)dictionaryArray andFieldKey: (NSString*)fieldKey;

/*!
 @brief 对JHChineseInfo子类对象的数组进行排序。数组的元素是JHChineseInfo子类，需要排序的中文字段是JHChineseInfo中的JHChineseString字段，所以该字段必定要设置
 @params objectArray JHChineseInfo子类对象数组
 @return 返回已排序的JHChineseInfo子类对象数组，当参数objectArray为nil或者并不是JHChineseInfo子类对象数组时返回nil
 */
- (NSArray*) chineseSortWithObjectArray: (NSArray*)objectArray;

@end
