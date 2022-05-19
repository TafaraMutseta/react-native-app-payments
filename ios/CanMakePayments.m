#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(CanMakePayments, NSObject)

RCT_EXTERN_METHOD(canMakePayments:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

@end
