//
//  CalViewController.m
//  Cal
//
//  Created by Nguyen Hoang Tuan on 12/14/13.
//
//

#import "CalViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "CalMainCalc.h"
#import "CalProjectMarco.h"

@interface CalViewController ()

@end

@implementation CalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    viewCalLandscape.hidden = UIInterfaceOrientationIsPortrait(self.interfaceOrientation);
    viewCalPortrait.hidden = UIInterfaceOrientationIsLandscape(self.interfaceOrientation);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark UIButton Action

- (IBAction)btnNumberTouchUpInside:(id)sender {
    if (isFinishOneOperator == YES || [txtDisplay.text isEqualToString:@"0"]) {
        txtDisplay.text = @"";
        isFinishOneOperator = NO;
    }
    
    NSString *strInput = [(UIButton*)sender titleForState:UIControlStateNormal];
    txtDisplay.text = [txtDisplay.text stringByAppendingString:strInput];
}

- (IBAction)btnOperationTouchUpInside:(id)sender {
    // advance
    NSString *aOperator = [(UIButton*)sender titleForState:UIControlStateNormal];
    if ([@"sin, cos, tan, sinh, cosh, tanh, sin-1, cos-1, tan-1, sinh-1, cosh-1, tanh-1" rangeOfString:aOperator].location != NSNotFound) {
        double aNumber;
        if([[btnSwitchRadDegree titleForState:UIControlStateNormal] isEqualToString:@"Deg"])
            aNumber = DegreesToRadians([txtDisplay.text doubleValue]);
        else aNumber = [txtDisplay.text doubleValue];
        txtDisplay.text = [CalMainCalc processAdvanceCalculator:aOperator withNumber:aNumber];
        return;
    }
    
    // basic Operator
    if (!isFinishOneOperator) {
        strFirstNumber = txtDisplay.text;
        txtDisplay.text = @"";
    }
    strOperator = aOperator;

}

- (IBAction)btnShowResultTouchUpInside:(id)sender {
    if (strFirstNumber.length > 0 ) {
        txtDisplay.text = [CalMainCalc processBasicCalculator:strOperator firstNumber:strFirstNumber secondNumber:txtDisplay.text];
        
        strFirstNumber = nil;
        isFinishOneOperator = YES;
    }
}

- (IBAction)btnSwitchRadDegreeTouchUpInside:(id)sender {
    [(UIButton*)sender setTitle:[[(UIButton*)sender titleForState:UIControlStateNormal] isEqualToString:@"Rad"] ? @"Deg" : @"Rad" forState:UIControlStateNormal];
}

- (IBAction)btn2ndModeTouchUpInside:(id)sender {
    [(UIButton*)sender setSelected:![(UIButton*)sender isSelected]];
    
    if ([(UIButton*)sender isSelected]) {
        [btnSin setTitle:@"sin-1" forState:UIControlStateNormal];
        [btnCos setTitle:@"cos-1" forState:UIControlStateNormal];
        [btnTan setTitle:@"tan-1" forState:UIControlStateNormal];
        [btnSinh setTitle:@"sinh-1" forState:UIControlStateNormal];
        [btnCosh setTitle:@"cosh-1" forState:UIControlStateNormal];
        [btnTanh setTitle:@"tanh-1" forState:UIControlStateNormal];
    } else {
        [btnSin setTitle:@"sin" forState:UIControlStateNormal];
        [btnCos setTitle:@"cos" forState:UIControlStateNormal];
        [btnTan setTitle:@"tan" forState:UIControlStateNormal];
        [btnSinh setTitle:@"sinh" forState:UIControlStateNormal];
        [btnCosh setTitle:@"cosh" forState:UIControlStateNormal];
        [btnTanh setTitle:@"tanh" forState:UIControlStateNormal];
    }
    
}


#pragma mark -
#pragma mark Rotation support

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
        viewCalPortrait.hidden = YES;
        viewCalLandscape.hidden = NO;
        CGRect aRect = viewCalLandscape.frame;
        aRect.origin.y = txtDisplay.frame.origin.y + txtDisplay.frame.size.height - 15;
        viewCalLandscape.frame = aRect;
        
    } else {
        viewCalPortrait.hidden = NO;
        viewCalLandscape.hidden = YES;
    }

}

- (NSUInteger) supportedInterfaceOrientations
{
    return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight | UIInterfaceOrientationMaskPortraitUpsideDown);
}
@end
