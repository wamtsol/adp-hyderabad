angular.module('scheme', ['ngAnimate', 'angularMoment', 'angularjs-datetime-picker', 'ui.bootstrap', 'localytics.directives']).controller('schemeController',
	function ($scope, $http, $interval, $filter, $timeout) {
		$scope.filters = {
			search: "",
			responsible_user: "0",
			page: 1,
			total: 0,
			rows: 25
		};
		$scope.maxSize = 5;
		$scope.schemes = [];
		$scope.errors = [];
		$scope.categories = [];
		$scope.sectors = [];
		$scope.taluka = [];
		$scope.processing = true;
		$scope.newScheme = {};
		$scope.defaultNewScheme = {
			id: 0,
			sector_id: 0,
			taluka_id: 0,
			category_id: "",
			adp_number: "",
			project_description: "",
			completion_date: "",
			approved_cost: "",
			through_forward: "",
			original_budget: "",
			final_budget: "",
			progress_release: "",
			progress_expenditure: ""
		};
		// $scope.addingNewScheme = false;
		// $scope.addNewScheme = function(){
		// 	$scope.newScheme = angular.copy($scope.defaultNewScheme);
		// 	$scope.addingNewScheme = true;
		// }
		// $scope.closeAddNewScheme = function(){
		// 	$scope.addingNewScheme = false;
		// 	$scope.errors = [];
		// 	$scope.processing = false;
		// }
		$scope.add = function( ){
			$scope.schemes.push(angular.copy( $scope.defaultNewScheme ));
			//$scope.newScheme = angular.copy($scope.defaultNewScheme);
		}
		$scope.saveScheme = function(){
			//$scope.newScheme = angular.copy($scope.defaultNewScheme);
			if( $scope.processing == false ) {
				
					$scope.processing = true;
					$scope.wctAJAX( {action: 'add_scheme', schemes: JSON.stringify($scope.schemes)}, function( response ){
						$scope.processing = false;
						if( response.status == 1 ) {
							if( !$scope.newScheme.id ){
								$scope.schemes.unshift(response.schemes);
							}
							//$scope.addingNewScheme = false;
						}
						else{
							alert(response.message);
						}
					});
				
			}
		}
		$scope.editScheme = function( $index ){
			$scope.newScheme = $scope.schemes[ $index ];
			$scope.addingNewScheme = true;
			jQuery('html,body').animate({ scrollTop: 0 }, 'slow');
		}
		$scope.deleteScheme = function( $index ){
			if( confirm( "Confirm Delete?" ) ){
				$scope.wctAJAX( {action: 'delete_scheme', id: $scope.schemes[$index].id }, function(){});
				$scope.schemes.splice( $index, 1 );
			}
		}
		$scope.updateDate = function(){
			$scope.newIssue.date_time = $(".angular-datetimepicker").val();
			$scope.$apply();
		}
		angular.element(document).ready(function () {
			$scope.get_records();
			$scope.wctAJAX( {action: 'get_categories'}, function( response ){
				$scope.categories = response;
				console.log($scope.categories);
			});
			$scope.wctAJAX( {action: 'get_sector'}, function( response ){
				$scope.sectors = response;
			});
			$scope.wctAJAX( {action: 'get_taluka'}, function( response ){
				$scope.taluka = response;
			});
		});
		$scope.get_records = function () {
			$scope.processing = true;
			const data = angular.copy($scope.filters);
			data.action = 'get_schemes';
			$scope.schemes = [];
			$scope.wctAJAX( data, function( response ){
				if($scope.processing){
					$scope.schemes = response.data;
					$scope.filters.total = response.total;
					$scope.processing = false;
				}
			});
		}
		$scope.searchPromise;
		$scope.search_records = function(){
			$scope.filters.page = 1;
			if($scope.searchPromise){
				$timeout.cancel($scope.searchPromise);
			}
			$scope.searchPromise = $timeout(function(){
				$scope.get_records();
			}, 200);
		}
		
		$scope.update_record = function($index){
			$scope.wctAJAX( {action: 'add_issue', issues: JSON.stringify($scope.issues[$index])}, function( response ){});
		}
		$scope.wctAJAX = function( wctData, wctCallback ) {
			wctRequest = {
				method: 'POST',
				url: 'scheme_manage.php',
				headers: {'Content-Type': 'application/x-www-form-urlencoded'},
				transformRequest: function(obj) {
					var str = [];
					for(var p in obj){
						str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
					}
					return str.join("&");
				},
				data: wctData
			}
			$http(wctRequest).then(function(wctResponse){
				wctCallback(wctResponse.data);
			}, function () {
				console.log("Error in fetching data");
			});
		}
	}
).directive('convertToNumber', function() {
	return {
		require: 'ngModel',
		link: function(scope, element, attrs, ngModel) {
			ngModel.$parsers.push(function(val) {
				return val != null ? parseInt(val, 10) : null;
			});
			ngModel.$formatters.push(function(val) {
				return val != null ? '' + val : null;
			});
		}
	};
})
