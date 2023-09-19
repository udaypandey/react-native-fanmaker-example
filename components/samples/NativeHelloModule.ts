import {NativeModules} from 'react-native';
const {HelloModule} = NativeModules;

interface HelloInterface {
  hello(name: string): void;
}

export default HelloModule as HelloInterface;
