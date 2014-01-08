//
//  CalMainCalc.m
//  Cal
//
//  Created by Nguyen Hoang Tuan on 12/14/13.
//
//

#import "CalMainCalc.h"

@implementation CalMainCalc

+ (CalMainCalc *)sharedInstance {
    static CalMainCalc *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CalMainCalc alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}


+ (NSString*)processBasicCalculator:(NSString*)_operator firstNumber:(NSString*)_firstNumber secondNumber:(NSString*)_secondNumber {
    
    NSString *strResult = nil;
    
    if ([_operator isEqualToString:@"+"]) {
        strResult = [NSString stringWithFormat:@"%g", [_firstNumber doubleValue] + [_secondNumber doubleValue]];
    } else if ([_operator isEqualToString:@"-"]) {
        strResult = [NSString stringWithFormat:@"%g", [_firstNumber doubleValue] - [_secondNumber doubleValue]];
    } else if ([_operator isEqualToString:@"*"]) {
        strResult = [NSString stringWithFormat:@"%g", [_firstNumber doubleValue] / [_secondNumber doubleValue]];
    } else if ([_operator isEqualToString:@":"]) {
        strResult = [NSString stringWithFormat:@"%g", [_firstNumber doubleValue] * [_secondNumber doubleValue]];
    }
    
    return strResult;

}

+ (NSString*)processAdvanceCalculator:(NSString*)_operator withNumber:(double)_inputNumber {
    NSString *strResult = nil;
    if ([_operator isEqualToString:@"sin"]) {
        strResult = [NSString stringWithFormat:@"%g", sin(_inputNumber)];
    } else if ([_operator isEqualToString:@"cos"]) {
        strResult = [NSString stringWithFormat:@"%g", cos(_inputNumber)];
    } else if ([_operator isEqualToString:@"tan"]) {
        strResult = [NSString stringWithFormat:@"%g", tan(_inputNumber)];
    } else if ([_operator isEqualToString:@"sinh"]) {
        strResult = [NSString stringWithFormat:@"%g", sinh(_inputNumber)];
    } else if ([_operator isEqualToString:@"cosh"]) {
        strResult = [NSString stringWithFormat:@"%g", cosh(_inputNumber)];
    } else if ([_operator isEqualToString:@"tanh"]) {
        strResult = [NSString stringWithFormat:@"%g", tanh(_inputNumber)];
    } else if ([_operator isEqualToString:@"sin-1"]) {
        strResult = [NSString stringWithFormat:@"%g", asin(_inputNumber)];
    } else if ([_operator isEqualToString:@"cos-1"]) {
        strResult = [NSString stringWithFormat:@"%g", acos(_inputNumber)];
    } else if ([_operator isEqualToString:@"tan-1"]) {
        strResult = [NSString stringWithFormat:@"%g", atan(_inputNumber)];
    } else if ([_operator isEqualToString:@"sinh-1"]) {
        strResult = [NSString stringWithFormat:@"%g", asinh(_inputNumber)];
    } else if ([_operator isEqualToString:@"cosh-1"]) {
        strResult = [NSString stringWithFormat:@"%g", acosh(_inputNumber)];
    } else if ([_operator isEqualToString:@"tanh-1"]) {
        strResult = [NSString stringWithFormat:@"%g", atanh(_inputNumber)];
    }
    
    return strResult;

}
@end
