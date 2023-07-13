/**
 * Importing from libraries
 */

import { StyleSheet, Text, View, TextInput, TouchableOpacity, Dimensions, FlatList} from 'react-native';
import { useState } from 'react'


/**
 * Importing from components
 */
import GoalItem from './components/GoalItem';




// Main Function
export default function App() {

	// for keeping the state of the content
	const [enteredGoalText, setEnteredGoalText] = useState('');
	const [courseGoals, setCourseGoals] = useState([]);

	/**
	 * Chart related operations
	 */
	const screenWidth = Dimensions.get("window").width;
	const width_proportion = '80%';
	const height_proportion = '40%';

	
	// Dummy data for testing purposes
	const data = {
		labels: ["January", "February", "March", "April", "May", "June"],
		datasets: [
		  {
			data: [20, 45, 28, 80, 99, 43],
			strokeWidth: 2 // optional
		  }
		],
		legend: ["Rainy Days"] // optional
	  };

	  const chartConfig = {
		backgroundGradientFrom: "#eeeeee",
		backgroundGradientTo: "#fafafa",
		color: (opacity = 1) => `rgba(60, 60, 60, ${opacity})`,
		strokeWidth: 2, // optional, default 3
		barPercentage: 0.5,
		useShadowColorFromDataset: false // optional
	  };



	// Touchable Opacity Button
	const AppButton = ({ onPress, title }) => (
		<TouchableOpacity
		  activeOpacity={0.8}
		  onPress={onPress}
		  style={styles.appButtonContainer}
		>
		  <Text style={styles.appButtonText}>{title}</Text>
		</TouchableOpacity>
	  );

	// the input handler
	function goalInputHandler(enteredText) {
		setEnteredGoalText(enteredText)

		// console.log(enteredText); // for debugging 
	};

	// add button hander
	function addGoalHandler() {
		setCourseGoals(currentCourseGoals => 
			[...courseGoals, 
				{text: enteredGoalText, id: Math.random().toString()}]); // recommended way to update your state
		// console.log(enteredGoalText) // for debugging
	};


	return (
		<View style={styles.appContainer}>
			
			<View style={styles.inputContainer}>

				<TextInput 
					styles={styles.customInput}
					placeholder='Your course goal!!'
					onChangeText={goalInputHandler} />

				<AppButton onPress={addGoalHandler} title="Add Goal"></AppButton>
		
			</View>

			<View style={styles.goalsContainer}> 
				<FlatList 
					data={courseGoals} 
					renderItem={(itemData) => {
						return <GoalItem text={itemData.item.text}/>;
					}}
					keyExtractor={(item, index) => {
						return item.id;
					}}
				/>
			</View>

		</View>
	);
}


// Our stylesheet object
const styles = StyleSheet.create({

	// the main container
	appContainer: {
		flex: 1,
		gap: 30,
		padding: 30,
		paddingVertical: 60,
		paddingHorizontal: 30,
	},

	// the input container
	inputContainer: { 
		flex: 1,
		backgroundColor: "#eeeeee",
		flexDirection: 'row',
		justifyContent: 'space-between',
		paddingHorizontal: 10,
		padding: 15,
		alignItems: 'center',
		borderRadius: 20,
		borderBottomColor: '#cccccc',
		
	},

	// for text input container
	customInput: {
		borderWidth: 2,
		borderColor: '#cccccc',
		width: '80%',
		marginRight: 8,
		padding: 8
	},

	// goals container
	goalsContainer: {
		flex: 5,
		padding: 20,
		backgroundColor: "#eeeeee",
		borderRadius: 8,
	},

	/**
	 * Button styles go here
	 */
	appButtonContainer: {
		elevation: 8,
		backgroundColor: "#009688",
		borderRadius: 10,
		paddingVertical: 10,
		paddingHorizontal: 12
	},
	appButtonText: {
		fontSize: 18,
		color: "#fff",
		fontWeight: "bold",
		alignSelf: "center",
		textTransform: "uppercase"
	}
});