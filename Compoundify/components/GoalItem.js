/**
 * GoalItem.js
 * This is a separate component for the goal item itself
 */

import { StyleSheet, View, Text } from 'react-native';

function GoalItem(props) {
    return ( 
        <View style={styles.goalItem}>
            <Text style={styles.goalText}>
                {props.text}
            </Text>
        </View>
    );
}

export default GoalItem;

const styles = StyleSheet.create({
    goalItem: {
		margin: 8,
		padding: 8,
		borderRadius: 8,
		backgroundColor: '#5d9afc',
		color: 'white',
	},

	goalText: {
		color: 'white'
	},
});

