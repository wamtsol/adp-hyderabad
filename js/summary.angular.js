angular.module('summary', ['ngAnimate', 'angularMoment', 'ui.bootstrap']).controller('summaryController',
	function ($scope, $http, $interval, $filter, $timeout) {
		$scope.filters = {
			search: "",
			category: 0,
			sector: 0,
			taluka: 0,
			year: 0,
			detail: 0,
			summary: 0,
			page: 1,
			total: 0,
			rows: 25
		};
		$scope.maxSize = 5;
		$scope.schemes = [];
		$scope.processing = true;
		angular.element(document).ready(function () {
			$scope.get_records();
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
