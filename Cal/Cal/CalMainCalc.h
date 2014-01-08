//
//  CalMainCalc.h
//  Cal
//
//  Created by Nguyen Hoang Tuan on 12/14/13.
//
//

#import <Foundation/Foundation.h>

@interface CalMainCalc : NSObject
+ (CalMainCalc *)sharedInstance;


/**
 *	@brief processBasicCalculator
 *
 *	@param 	_operator 	a operator (+, -, x, :)
 *	@param 	_firstNumber 	first number
 *	@param 	_secondNumber 	second number
 *
 *	@return	result
 */
+ (NSString*)processBasicCalculator:(NSString*)_operator firstNumber:(NSString*)_firstNumber secondNumber:(NSString*)_secondNumber;


/**
 *	@brief	processAdvanceCalculator
 *
 *	@param 	_operator 	a _operator
 *	@param 	_inputNumber 	a input number
 *
 *	@return	result
 */
+ (NSString*)processAdvanceCalculator:(NSString*)_operator withNumber:(double)_inputNumber;
@end
