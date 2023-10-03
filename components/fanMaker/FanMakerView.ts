import {NativeModules} from 'react-native';
const {FanMakerWebViewControllerModule} = NativeModules;

interface FanMakerView {
  showFanMakerUI(): void;

  hideFanMakerUI(): void;
}

export default FanMakerWebViewControllerModule as FanMakerView;
