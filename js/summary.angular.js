angular.module('summary', ['ngAnimate', 'angularMoment', 'ui.bootstrap']).controller('summaryController',
	function ($scope, $http, $interval, $filter, $timeout) {
		$scope.schemes = [];
		$scope.talukas = [];
		$scope.sectors = [];
		$scope.categories = [];
		$scope.processing = true;
		$scope.currentScreen = 0;
		angular.element(document).ready(function () {
			$scope.get_records();
		});
		$scope.get_records = function () {
			$scope.processing = true;
			$scope.schemes = [];
			$scope.wctAJAX( {action: 'get_records'}, function( response ){
				if($scope.processing){
					$scope.schemes = response.schemes;
					$scope.talukas = response.talukas;
					$scope.sectors = response.sectors;
					$scope.categories = response.categories;
					$scope.processing = false;
				}
			});
		}
		$scope.sum = function(key, filter){
			let schemes = $filter('filter')($scope.schemes, filter, true);
			let total = 0;
			for(let i = 0; i < schemes.length; i++){
				total += schemes[i][key];
			}
			return total
		}
		$scope.onGoingSchemeFilter = function(item){
			return item.approval_year < 2022;
		}
		$scope.newSchemeFilter = function(item){
			return item.approval_year >= 2022;
		}
		$scope.wctAJAX = function( wctData, wctCallback ) {
			wctRequest = {
				method: 'POST',
				url: 'index.php',
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
)
