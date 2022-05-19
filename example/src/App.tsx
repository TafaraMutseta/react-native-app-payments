import * as React from 'react';

import { StyleSheet, View, Text } from 'react-native';
import { canMakePayments } from 'react-native-can-make-payments';

export default function App() {
  const [canPayment, setCanPayment] = React.useState<boolean>();

  React.useEffect(() => {
    canMakePayments().then(setCanPayment);
  }, []);

  return (
    <View style={styles.container}>
      <Text>
        canMakePayments:
        {canPayment === undefined ? 'undefined' : canPayment ? 'true' : 'false'}
      </Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
