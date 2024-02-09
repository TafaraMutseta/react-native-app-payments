import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-can-make-payments' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

const CanMakePayments = NativeModules.CanMakePayments
  ? NativeModules.CanMakePayments
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function canMakePayments(): Promise<boolean> {
  return CanMakePayments.canMakePayments();
}

export function openExternalPurchaseLink(): Promise<string> {
  return CanMakePayments.openExternalPurchaseLink();
}
