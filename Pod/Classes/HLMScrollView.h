//
//  HLMScrollView.h
//  Pods
//
//  Created by Alex Quinlivan on 11/05/15.
//
//

#import "HLMLayout.h"
#import "HLMLayoutInflator.h"

@interface HLMScrollView : UIScrollView <HLMLayoutInflationListener, HLMKeyboardAware>

@property (nonatomic) BOOL hlm_resizesForKeyboard;

@end
