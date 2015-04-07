//
//  HLMLayoutInflator.h
//  Helium
//
//  Created by Alex Quinlivan on 13/03/15.
//
//

#import <Foundation/Foundation.h>
#import "HLMLayout.h"

@interface HLMLayoutInflator : NSObject

-(instancetype) initWithLayout:(NSString *) layoutResource;

-(UIView *) inflate;

@end