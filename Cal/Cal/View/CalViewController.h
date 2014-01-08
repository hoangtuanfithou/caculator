//
//  CalViewController.h
//  Cal
//
//  Created by Nguyen Hoang Tuan on 12/14/13.
//
//

#import <UIKit/UIKit.h>

@interface CalViewController : UIViewController {
    NSString *strFirstNumber, *strOperator;
    BOOL isFinishOneOperator;
    __weak IBOutlet UITextField *txtDisplay;
    __weak IBOutlet UIView *viewCalPortrait;
    __weak IBOutlet UIView *viewCalLandscape;
    __weak IBOutlet UIButton *btnSwitchRadDegree;
    __weak IBOutlet UIButton *btn2ndModeTouchUpInside;
    
    __weak IBOutlet UIButton *btnSin;
    __weak IBOutlet UIButton *btnCos;
    __weak IBOutlet UIButton *btnTan;
    __weak IBOutlet UIButton *btnSinh;
    __weak IBOutlet UIButton *btnCosh;
    __weak IBOutlet UIButton *btnTanh;
}

- (IBAction)btnNumberTouchUpInside:(id)sender;
- (IBAction)btnOperationTouchUpInside:(id)sender;
- (IBAction)btnShowResultTouchUpInside:(id)sender;
- (IBAction)btnSwitchRadDegreeTouchUpInside:(id)sender;
- (IBAction)btn2ndModeTouchUpInside:(id)sender;
@end
