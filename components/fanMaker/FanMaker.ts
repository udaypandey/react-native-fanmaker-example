import {NativeModules} from 'react-native';
const {FanMakerSDKModule} = NativeModules;

interface FanMaker {
  configure(apiKey: string): void;
}

export default FanMakerSDKModule as FanMaker;
