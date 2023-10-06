import {NativeModules} from 'react-native';
const {FanMakerWebViewControllerModule} = NativeModules;

interface FanMakerView {
  showFanMakerUI(): void;
}

export default FanMakerWebViewControllerModule as FanMakerView;
