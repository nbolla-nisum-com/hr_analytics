var app = angular.module('myApp', ['ngMaterial']);
app.controller('homeCtrl', function($scope,$mdDialog) {
	
	 $scope.jobRoles = ["Manufacturing Director", "Manager", "Sales Executive","Healthcare Representative",
		 "Research Director","Research Scientist","Laboratory Technician","Human Resources","Sales Representative"];
	 $scope.businessTravels = ["Travel_Rarely", "Travel_Frequently", "Non-Travel"];
	 $scope.educationFields = ["Life Sciences", "Medical", "Marketing","Technical Degree","Human Resources","Other"];
	 $scope.departments = ["Sales","Research & Development","Human Resources"];
	 $scope.maritalStatuses = ["Single","Married","Divorced"];

	 $scope.data = {};
	 
	 $scope.predict = function(event){
		
		//Write a function to send data to AWS, based on the result we will show the pop up 
	    $mdDialog.show(
	      $mdDialog.alert()
	        .parent(angular.element(document.querySelector('#popupContainer')))
	        .clickOutsideToClose(true)
	        .textContent('signs it\'s near to quit  😐')
	        .ok('Got it!')
	        .targetEvent(event)
	    );
			    
	    
	   //We should clear data 
	    $scope.data = {};
			    
	 };
	
});