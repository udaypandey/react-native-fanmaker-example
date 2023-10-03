import React from 'react';
import {Button, View} from 'react-native';

import NativeCalendarModule from './components/samples/NativeCalendarModule';
import NativeHelloModule from './components/samples/NativeHelloModule';
import FanMakerLocation from './components/fanMaker/FanMakerLocation';
import SampleWrapperView from './components/fanMaker/SampleWrapperView';
import FanMakerView from './components/fanMaker/FanMakerView';
import FanMaker from './components/fanMaker/FanMaker';

FanMaker.configure(
  'cd5424f8e4438b19a5238b53d813cf5f35e21851b91eb4662223057229060023',
);

const App = () => {
  const {createCalendarEvent} = NativeCalendarModule;
  const {hello} = NativeHelloModule;

  const onPress = () => {
    hello('Testing HelloModule!');
    console.log('We will invoke the native module here!');

    createCalendarEvent('testName', 'testLocation', eventId => {
      console.log(`Created a new event with id ${eventId}`);
    });

    FanMakerLocation.enableLocationTracking();
    FanMakerView.showFanMakerUI();
  };

  return (
    <View style={{justifyContent: 'center', alignItems: 'center', flex: 1}}>
      <Button
        title="Show FanMaker UI!"
        style={{color: 'dodgerblue', fontSize: 20, fontWeight: 'bold'}}
        onPress={onPress}
      />

      <SampleWrapperView />
    </View>
  );
};

export default App;
