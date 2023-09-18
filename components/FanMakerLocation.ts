import {NativeModules} from 'react-native';
const {FanMakerLocationModule} = NativeModules;

interface FanMakerLocation {
  disableLocationTracking(): void;

  enableLocationTracking(): void;
}

export default FanMakerLocationModule as FanMakerLocation;
