import {requireNativeComponent} from 'react-native';

// requireNativeComponent automatically resolves 'FanMakerWebView' to 'FanMakerWebViewManager'
const SampleWrapperView = requireNativeComponent('FanMakerWebView');

export default SampleWrapperView;
