//
//  HLMLayout.m
//  Helium
//
//  Created by Alex Quinlivan on 13/03/15.
//
//

#import "HLMLayout.h"
#import "HLMAssociatedObjects.h"

#define ASSOCIATE_NUMBER_SET_NEEDS_LAYOUT(_type, _name, _camel, _nsvalueaccessor) \
ASSOCIATE_VALUE_NO_SETTER(_type, _name, _camel, _nsvalueaccessor)\
-(void) set##_camel:(_type) val {\
    objc_setAssociatedObject(self, &k##_camel##AssociationKey, @(val), OBJC_ASSOCIATION_RETAIN_NONATOMIC);\
    [self setNeedsLayout];\
}\

static uint32_t const HLMMeasureSpecModeMask = 0x3 << HLMMeasureSpecModeShift;

@implementation UIView (HLMLayoutProperties)

ASSOCIATE_VALUE_NO_SETTER(UIEdgeInsets, hlm_margins, Hlm_margins, UIEdgeInsetsValue);
-(void) setHlm_margins:(UIEdgeInsets) margins {
    objc_setAssociatedObject(self, &kHlm_marginsAssociationKey,
                             [NSValue valueWithUIEdgeInsets:margins], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setNeedsLayout];
}

-(void) setHlm_marginLeft:(CGFloat) marginLeft {
    UIEdgeInsets margins = self.hlm_margins;
    margins.left = marginLeft;
    self.hlm_margins = margins;
}

-(void) setHlm_marginTop:(CGFloat) marginTop {
    UIEdgeInsets margins = self.hlm_margins;
    margins.top = marginTop;
    self.hlm_margins = margins;
}

-(void) setHlm_marginRight:(CGFloat) marginRight {
    UIEdgeInsets margins = self.hlm_margins;
    margins.right = marginRight;
    self.hlm_margins = margins;
}

-(void) setHlm_marginBottom:(CGFloat) marginBottom {
    UIEdgeInsets margins = self.hlm_margins;
    margins.bottom = marginBottom;
    self.hlm_margins = margins;
}

-(CGFloat) hlm_marginLeft {
    return self.hlm_margins.left;
}

-(CGFloat) hlm_marginTop {
    return self.hlm_margins.top;
}

-(CGFloat) hlm_marginRight {
    return self.hlm_margins.right;
}

-(CGFloat) hlm_marginBottom {
    return self.hlm_margins.bottom;
}

ASSOCIATE_VALUE_NO_SETTER(UIEdgeInsets, hlm_padding, Hlm_padding, UIEdgeInsetsValue);
-(void) setHlm_padding:(UIEdgeInsets) hlm_padding {
    objc_setAssociatedObject(self, &kHlm_paddingAssociationKey,
                             [NSValue valueWithUIEdgeInsets:hlm_padding], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setNeedsLayout];
}

-(void) setHlm_paddingLeft:(CGFloat) paddingLeft {
    UIEdgeInsets padding = self.hlm_padding;
    padding.left = paddingLeft;
    self.hlm_padding = padding;
}

-(void) setHlm_paddingTop:(CGFloat) paddingTop {
    UIEdgeInsets padding = self.hlm_padding;
    padding.top = paddingTop;
    self.hlm_padding = padding;
}

-(void) setHlm_paddingRight:(CGFloat) paddingRight {
    UIEdgeInsets padding = self.hlm_padding;
    padding.right = paddingRight;
    self.hlm_padding = padding;
}

-(void) setHlm_paddingBottom:(CGFloat) paddingBottom {
    UIEdgeInsets padding = self.hlm_padding;
    padding.bottom = paddingBottom;
    self.hlm_padding = padding;
}

-(CGFloat) hlm_paddingLeft {
    return self.hlm_padding.left;
}

-(CGFloat) hlm_paddingTop {
    return self.hlm_padding.top;
}

-(CGFloat) hlm_paddingRight {
    return self.hlm_padding.right;
}

-(CGFloat) hlm_paddingBottom {
    return self.hlm_padding.bottom;
}

ASSOCIATED_PROPERTY(hlm_baselineAligned, Hlm_baselineAligned);
-(void) setHlm_baselineAligned:(BOOL) hlm_baselineAligned {
    objc_setAssociatedObject(self, &kHlm_baselineAlignedAssociationKey,
                             @(hlm_baselineAligned), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setNeedsLayout];
}

-(BOOL) hlm_baselineAligned {
    NSNumber* hlm_baselineAligned = objc_getAssociatedObject(self, &kHlm_baselineAlignedAssociationKey);
    return (hlm_baselineAligned)? hlm_baselineAligned.boolValue : YES;
}

ASSOCIATED_PROPERTY(hlm_baselineAlignedChildIndex, Hlm_baselineAlignedChildIndex);
-(void) setHlm_baselineAlignedChildIndex:(NSInteger) hlm_baselineAlignedChildIndex {
    objc_setAssociatedObject(self, &kHlm_baselineAlignedChildIndexAssociationKey,
                             @(hlm_baselineAlignedChildIndex), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setNeedsLayout];
}

-(NSInteger) hlm_baselineAlignedChildIndex {
    NSNumber* hlm_baselineAlignedChildIndex = objc_getAssociatedObject(self, &kHlm_baselineAlignedChildIndexAssociationKey);
    return (hlm_baselineAlignedChildIndex)? hlm_baselineAlignedChildIndex.integerValue : -1;
}

ASSOCIATED_PROPERTY(hlm_weightSum, Hlm_weightSum);
-(void) setHlm_weightSum:(CGFloat) hlm_weightSum {
    objc_setAssociatedObject(self, &kHlm_weightSumAssociationKey,
                             @(hlm_weightSum), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setNeedsLayout];
}

-(CGFloat) hlm_weightSum {
    NSNumber* hlm_weightSum = objc_getAssociatedObject(self, &kHlm_weightSumAssociationKey);
    return (hlm_weightSum)? hlm_weightSum.floatValue : -1.f;
}

ASSOCIATE_NUMBER_SET_NEEDS_LAYOUT(CGFloat, hlm_translationX, Hlm_translationX, floatValue);
ASSOCIATE_NUMBER_SET_NEEDS_LAYOUT(CGFloat, hlm_translationY, Hlm_translationY, floatValue);
ASSOCIATE_NUMBER_SET_NEEDS_LAYOUT(CGFloat, hlm_minWidth, Hlm_minWidth, floatValue);
ASSOCIATE_NUMBER_SET_NEEDS_LAYOUT(CGFloat, hlm_minHeight, Hlm_minHeight, floatValue);
ASSOCIATE_NUMBER_SET_NEEDS_LAYOUT(CGFloat, hlm_layoutWidth, Hlm_layoutWidth, floatValue);
ASSOCIATE_NUMBER_SET_NEEDS_LAYOUT(CGFloat, hlm_layoutHeight, Hlm_layoutHeight, floatValue);
ASSOCIATE_NUMBER_SET_NEEDS_LAYOUT(CGFloat, hlm_layoutWeight, Hlm_layoutWeight, floatValue);
ASSOCIATE_NUMBER_SET_NEEDS_LAYOUT(HLMGravity, hlm_layoutGravity, Hlm_layoutGravity, intValue);
ASSOCIATE_NUMBER_SET_NEEDS_LAYOUT(HLMGravity, hlm_gravity, Hlm_gravity, intValue);
ASSOCIATE_NUMBER_SET_NEEDS_LAYOUT(HLMLayoutOrientation, hlm_orientation, Hlm_orientation, integerValue);
ASSOCIATE_NUMBER(CGFloat, hlm_measuredWidth, Hlm_measuredWidth, floatValue);
ASSOCIATE_NUMBER(CGFloat, hlm_measuredHeight, Hlm_measuredHeight, floatValue);
ASSOCIATE_OBJECT(NSObject, hlm_layoutManager, Hlm_layoutManager);

@end


@implementation UILabel (HLMLayoutProperties)

-(void) setHlm_textSize:(CGFloat) hlm_textSize {
    self.font = [self.font fontWithSize:hlm_textSize];
    [self setNeedsLayout];
}

-(CGFloat) hlm_textSize {
    return self.font.pointSize;
}

@end


@implementation UIImageView (HLMLayoutProperties)

ASSOCIATE_VALUE_NO_SETTER(UIImageRenderingMode, hlm_imageRenderingMode, Hlm_imageRenderingMode, integerValue);
-(void) setHlm_imageRenderingMode:(UIImageRenderingMode) hlm_imageRenderingMode {
    objc_setAssociatedObject(self, &kHlm_imageRenderingModeAssociationKey,
                             @(hlm_imageRenderingMode), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    UIImage* image = self.image;
    UIImage* highlightedImage = self.highlightedImage;
    if (image) {
        self.image = [image imageWithRenderingMode:hlm_imageRenderingMode];
    }
    if (highlightedImage) {
        self.highlightedImage = [highlightedImage imageWithRenderingMode:hlm_imageRenderingMode];
    }
}

ASSOCIATED_PROPERTY(hlm_image, Hlm_image)
ASSOCIATED_ACCESSOR(UIImage*, hlm_image, self, &kHlm_imageAssociationKey);
-(void) setHlm_image:(UIImage *) hlm_image {
    UIImageRenderingMode renderingMode = self.hlm_imageRenderingMode;
    if (renderingMode != UIImageRenderingModeAutomatic) {
        hlm_image = [hlm_image imageWithRenderingMode:renderingMode];
    }
    objc_setAssociatedObject(self, &kHlm_imageAssociationKey,
                             hlm_image, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

ASSOCIATED_PROPERTY(hlm_highlightedImage, Hlm_highlightedImage)
ASSOCIATED_ACCESSOR(UIImage*, hlm_highlightedImage, self, &kHlm_highlightedImageAssociationKey);
-(void) setHlm_highlightedImage:(UIImage *) hlm_highlightedImage {
    UIImageRenderingMode renderingMode = self.hlm_imageRenderingMode;
    if (renderingMode != UIImageRenderingModeAutomatic) {
        hlm_highlightedImage = [hlm_highlightedImage imageWithRenderingMode:renderingMode];
    }
    objc_setAssociatedObject(self, &kHlm_highlightedImageAssociationKey,
                             hlm_highlightedImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end


@implementation HLMLayout

#pragma mark - MeasureSpec impl

+(HLMMeasureSpec) measureSpecWithSize:(uint32_t) size mode:(HLMMeasureSpecMode) mode {
    return (size & ~HLMMeasureSpecModeMask) | (mode & HLMMeasureSpecModeMask);
}

+(HLMMeasureSpecMode) measureSpecMode:(HLMMeasureSpec) measureSpec {
    return measureSpec & HLMMeasureSpecModeMask;
}

+(uint32_t) measureSpecSize:(HLMMeasureSpec) measureSpec {
    return measureSpec & ~HLMMeasureSpecModeMask;
}

+(HLMMeasureSpec) childMeasureSpec:(HLMMeasureSpec) spec
                           padding:(int32_t) padding
                         dimension:(HLMLayoutParam) childDimension {
    uint32_t specMode = [HLMLayout measureSpecMode:spec];
    uint32_t specSize = [HLMLayout measureSpecSize:spec];
    uint32_t size = MAX(0, specSize - padding);
    uint32_t resultSize = 0;
    uint32_t resultMode = 0;
    switch (specMode) {
        case HLMMeasureSpecExactly: {
            if (childDimension >= 0) {
                resultSize = childDimension;
                resultMode = HLMMeasureSpecExactly;
            } else if (childDimension == HLMLayoutParamMatch) {
                resultSize = size;
                resultMode = HLMMeasureSpecExactly;
            } else if (childDimension == HLMLayoutParamWrap) {
                resultSize = size;
                resultMode = HLMMeasureSpecAtMost;
            }
            break;
        }
        case HLMMeasureSpecAtMost: {
            if (childDimension >= 0) {
                resultSize = childDimension;
                resultMode = HLMMeasureSpecExactly;
            } else if (childDimension == HLMLayoutParamMatch) {
                resultSize = size;
                resultMode = HLMMeasureSpecAtMost;
            } else if (childDimension == HLMLayoutParamWrap) {
                resultSize = size;
                resultMode = HLMMeasureSpecAtMost;
            }
            break;
        }
        case HLMMeasureSpecUnspecified: {
            if (childDimension >= 0) {
                resultSize = childDimension;
                resultMode = HLMMeasureSpecExactly;
            } else if (childDimension == HLMLayoutParamMatch) {
                resultSize = 0;
                resultMode = HLMMeasureSpecUnspecified;
            } else if (childDimension == HLMLayoutParamWrap) {
                resultSize = 0;
                resultMode = HLMMeasureSpecUnspecified;
            }
            break;
        }
    }
    return [HLMLayout measureSpecWithSize:resultSize mode:resultMode];
}

+(uint32_t) defaultSize:(uint32_t) size spec:(HLMMeasureSpec) measureSpec {
    HLMMeasureSpecMode specMode = [self measureSpecMode:measureSpec];
    switch (specMode) {
        case HLMMeasureSpecUnspecified:
            return size;
        default:
            return [self measureSpecSize:measureSpec];
    }
}

+(uint32_t) resolveSize:(uint32_t) size spec:(HLMMeasureSpec) measureSpec {
    uint32_t result = size;
    HLMMeasureSpecMode specMode = [HLMLayout measureSpecMode:measureSpec];
    switch (specMode) {
        case HLMMeasureSpecUnspecified:
            return size;
        case HLMMeasureSpecAtMost:
            return MIN(size, [HLMLayout measureSpecSize:measureSpec]);
        case HLMMeasureSpecExactly:
            return [HLMLayout measureSpecSize:measureSpec];
    }
    return result;
}

#pragma mark - Measure specific impl

+(void) measureChildWithMargins:(UIView *) childView
                       ofParent:(UIView *) parentView
                parentWidthSpec:(HLMMeasureSpec) parentWidthMeasureSpec
                      widthUsed:(NSInteger) widthUsed
               parentHeightSpec:(HLMMeasureSpec) parentHeightMeasureSpec
                     heightUsed:(NSInteger) heightUsed {
    UIEdgeInsets padding = parentView.hlm_padding;
    int32_t paddingLeft = padding.left;
    int32_t paddingRight = padding.right;
    int32_t paddingTop = padding.top;
    int32_t paddingBottom = padding.bottom;
    UIEdgeInsets margins = childView.hlm_margins;
    int32_t marginLeft = margins.left;
    int32_t marginRight = margins.right;
    int32_t marginTop = margins.top;
    int32_t marginBottom = margins.bottom;
    HLMMeasureSpec childWidthMeasureSpec = [self childMeasureSpec:parentWidthMeasureSpec
                                                          padding:paddingLeft + paddingRight + marginLeft + marginRight + ((int32_t) widthUsed)
                                                        dimension:childView.hlm_layoutWidth];
    HLMMeasureSpec childHeightMeasureSpec = [self childMeasureSpec:parentHeightMeasureSpec
                                                           padding:paddingTop + paddingBottom + marginTop + marginBottom + ((int32_t) heightUsed)
                                                         dimension:childView.hlm_layoutHeight];
    [self measureView:childView
            widthSpec:childWidthMeasureSpec
           heightSpec:childHeightMeasureSpec];
}

+(void) measureView:(UIView *) view
          widthSpec:(HLMMeasureSpec) widthMeasureSpec
         heightSpec:(HLMMeasureSpec) heightMeasureSpec {
    id<HLMLayoutManager> layoutManager = view.hlm_layoutManager;
    if (layoutManager) {
        [layoutManager measure:view
                     widthSpec:widthMeasureSpec
                    heightSpec:heightMeasureSpec];
    } else {
        view.hlm_measuredWidth = [self defaultSize:view.hlm_minWidth spec:widthMeasureSpec];
        view.hlm_measuredHeight = [self defaultSize:view.hlm_minHeight spec:heightMeasureSpec];
    }
}

+(void) setChild:(UIView *) child frame:(CGRect) frame {
    id<HLMLayoutManager> layoutManager = child.hlm_layoutManager;
    if (layoutManager) {
        [layoutManager layout:child
                         left:frame.origin.x
                          top:frame.origin.y
                        right:frame.origin.x + frame.size.width
                       bottom:frame.origin.y + frame.size.height];
    } else {
        child.frame = frame;
    }
}

#pragma mark - Gravity impl

typedef struct {
    NSInteger left;
    NSInteger right;
    NSInteger top;
    NSInteger bottom;
} HLMGravityRect;

+(CGRect) applyGravity:(HLMGravity) gravity
           toContainer:(CGRect) container
                 width:(NSUInteger) width
                height:(NSUInteger) height {
    return [self applyGravity:gravity
                  toContainer:container
                        width:width
                       height:height
                      xAdjust:0
                      yAdjust:0];
}

+(CGRect) applyGravity:(HLMGravity) gravity
           toContainer:(CGRect) containerSource
                 width:(NSUInteger) width
                height:(NSUInteger) height
               xAdjust:(NSInteger) xAdjust
               yAdjust:(NSInteger) yAdjust {
    HLMGravityRect outRect = (HLMGravityRect) {0, 0, 0, 0};
    HLMGravityRect container = (HLMGravityRect) {containerSource.origin.x, containerSource.origin.y,
        containerSource.origin.y + containerSource.size.width, containerSource.origin.y + containerSource.size.height};
    switch (gravity & ((HLMGravityAxisPullBefore | HLMGravityAxisPullAfter) << HLMGravityAxisXShift)) {
        case 0:
            outRect.left = container.left
            + ((container.right - container.left - width)/2) + xAdjust;
            outRect.right = outRect.left + width;
            if ((gravity & (HLMGravityAxisClip << HLMGravityAxisXShift))
                == (HLMGravityAxisClip << HLMGravityAxisXShift)) {
                if (outRect.left < container.left) {
                    outRect.left = container.left;
                }
                if (outRect.right > container.right) {
                    outRect.right = container.right;
                }
            }
            break;
        case HLMGravityAxisPullBefore << HLMGravityAxisXShift:
            outRect.left = container.left + xAdjust;
            outRect.right = outRect.left + width;
            if ((gravity & (HLMGravityAxisClip << HLMGravityAxisXShift))
                == (HLMGravityAxisClip << HLMGravityAxisXShift)) {
                if (outRect.right > container.right) {
                    outRect.right = container.right;
                }
            }
            break;
        case HLMGravityAxisPullAfter << HLMGravityAxisXShift:
            outRect.right = container.right - xAdjust;
            outRect.left = outRect.right - width;
            if ((gravity & (HLMGravityAxisClip << HLMGravityAxisXShift))
                == (HLMGravityAxisClip << HLMGravityAxisXShift)) {
                if (outRect.left < container.left) {
                    outRect.left = container.left;
                }
            }
            break;
        default:
            outRect.left = container.left + xAdjust;
            outRect.right = container.right + xAdjust;
            break;
    }
    
    switch (gravity & ((HLMGravityAxisPullBefore | HLMGravityAxisPullAfter) << HLMGravityAxisYShift)) {
        case 0:
            outRect.top = container.top
            + ((container.bottom - container.top - height)/2) + yAdjust;
            outRect.bottom = outRect.top + height;
            if ((gravity & (HLMGravityAxisClip << HLMGravityAxisYShift))
                == (HLMGravityAxisClip << HLMGravityAxisYShift)) {
                if (outRect.top < container.top) {
                    outRect.top = container.top;
                }
                if (outRect.bottom > container.bottom) {
                    outRect.bottom = container.bottom;
                }
            }
            break;
        case HLMGravityAxisPullBefore << HLMGravityAxisYShift:
            outRect.top = container.top + yAdjust;
            outRect.bottom = outRect.top + height;
            if ((gravity & (HLMGravityAxisClip << HLMGravityAxisYShift))
                == (HLMGravityAxisClip << HLMGravityAxisYShift)) {
                if (outRect.bottom > container.bottom) {
                    outRect.bottom = container.bottom;
                }
            }
            break;
        case HLMGravityAxisPullAfter << HLMGravityAxisYShift:
            outRect.bottom = container.bottom - yAdjust;
            outRect.top = outRect.bottom - height;
            if ((gravity & (HLMGravityAxisClip << HLMGravityAxisYShift))
                == (HLMGravityAxisClip << HLMGravityAxisYShift)) {
                if (outRect.top < container.top) {
                    outRect.top = container.top;
                }
            }
            break;
        default:
            outRect.top = container.top + yAdjust;
            outRect.bottom = container.bottom + yAdjust;
            break;
    }
    CGRect outCGRect = (CGRect) {outRect.left, outRect.top,
        outRect.right - outRect.left, outRect.bottom - outRect.top};
    return outCGRect;
}

@end
