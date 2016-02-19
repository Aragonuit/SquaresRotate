//
//  ViewController.m
//  SquaresRotare
//
//  Created by AragonUit on 2/19/16.
//  Copyright © 2016 AragonUit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [self drawNestedSquares];
    [self performSelector:@selector(rotateAllSquares) withObject:nil afterDelay:2.0];
}

-(void)drawNestedSquares{
    CGSize mainViewSize = self.view.bounds.size;
    CGFloat margin = 20 ;
    CGFloat recWith = mainViewSize.width - margin *2.0;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height ;
    CGPoint center = CGPointMake(mainViewSize.width * 0.5, (mainViewSize.height+statusNavigationBarHeight)*0.5);
    for (int i=0; i<=10; i++) {
        UIView* square;
        if (i%2==0) {
          square =[self drawSquaresByWith:recWith andRotate:NO atCenter:center];
        }else
        {
            square=[self drawSquaresByWith:recWith andRotate:YES atCenter:center];
        }
        [self.view addSubview:square];
        recWith=recWith*0.707;
    }
}
-(UIView*)drawSquaresByWith:(CGFloat)with
               andRotate:(BOOL)rotate
                atCenter:(CGPoint)center{
    UIView*square = [[UIView alloc]initWithFrame:CGRectMake(0, 0, with, with)];
    square.center = center;
   
    square.backgroundColor=rotate ? [UIColor whiteColor] : [UIColor darkGrayColor];
    square.transform=rotate ? CGAffineTransformMakeRotation(M_PI_4) : CGAffineTransformIdentity;
    
     return square;
}
-(void)rotateAllSquares{
    [UIView animateWithDuration:2.0 animations:^{
        for (int i=0; i<self.view.subviews.count;i++) {
            if (i%2==0) {
                ((UIView*)self.view.subviews[i]).transform=CGAffineTransformMakeRotation(M_PI_4);
            }else
            {
                ((UIView*)self.view.subviews[i]).transform=CGAffineTransformIdentity;
            }
        }
    }];
}
@end
