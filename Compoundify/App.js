/**
 * Importing
 */

import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View, Button, TextInput, TouchableOpacity, Dimensions, ScrollView, SafeAreaView} from 'react-native';
import { useState } from 'react'
import {
	LineChart,
	BarChart,
	PieChart,
	ProgressChart,
	ContributionGraph,
	StackedBarChart
  } from "react-native-chart-kit";







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
		setCourseGoals(currentCourseGoals => [...courseGoals, enteredGoalText]); // recommended way to update your state
		// console.log(enteredGoalText) // for debugging
	};


	
	return (
		<ScrollView>
			<SafeAreaView style={styles.appContainer}>
				
				<View style={styles.inputContainer}>
					<TextInput 
						styles={styles.customInput}
						placeholder='Your course goal!!'
						onChangeText={goalInputHandler} />

					<AppButton onPress={addGoalHandler} title="Add Goal"></AppButton>
			
				</View>

				<View style={styles.goalsContainer}>
					{courseGoals.map((goal) => <Text key={goal} style={styles.individualGoalContainer}>{goal}</Text>)}
				</View>

				<LineChart
					data={data}
					width={300} // you can set this to screenWidth
					height={220}
					chartConfig={chartConfig}
					bezier
					style={{
					marginVertical: 8,
					borderRadius: 16
					}}
				/>
			</SafeAreaView>
		</ScrollView>
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

	individualGoalContainer: {
		margin: 8,
		padding: 8,
		borderRadius: 8,
		backgroundColor: '#5d9afc',
		color: 'white',
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