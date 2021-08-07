angular.module('summary', ['ngAnimate', 'angularMoment', 'ui.bootstrap', 'localytics.directives']).controller('summaryController',
	function ($scope, $http, $interval, $filter, $timeout) {
		$scope.schemes = [];
		$scope.talukas = [];
		$scope.sectors = [];
		$scope.filters = {
			sector: [],
			taluka: [],
			category: [],
			year: []
		}
		$scope.categories = [];
		$scope.years = [];
		$scope.processing = true;
		$scope.currentScreen = 0;
		$scope.summaryType = 1;
		$scope.detailType = 0;
		$scope.currentPage = 1;
		$scope.itemsPerPage = 10;
		$scope.orderByCol = 'id';
		$scope.orderDirection = false;
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
					$scope.years = response.years;
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
		$scope.showSummary = function(type){
			if(type === 0){
				$scope.currentScreen = 0;
			}
			else{
				$scope.summaryType = type;
				$scope.currentScreen = 1;
				let data = [];
				let data2 = [];
				if(type == 1 || type == 3){
					let sectors = $filter('filter')($scope.sectors, {parent_id: 0}, true);
					let sum = $scope.sum('estim_cost', $scope.summaryFilter);
					for(let i = 0; i < sectors.length; i++){
						if($filter('filter')($scope.schemes, $scope.summaryFilterWithSector(sectors[i]), true).length > 0){
							data.push({y: ($scope.sum('estim_cost', $scope.summaryFilterWithSector(sectors[i]))/sum)*100, label: sectors[i].title},);
							data2.push({y: $scope.sum('estim_expenditure', $scope.summaryFilterWithSector(sectors[i])), label: sectors[i].title},);
						}
					}
				}
				else {
					let sum = $scope.sum('estim_cost', $scope.summaryFilter);
					for(let i = 0; i < $scope.talukas.length; i++){
						if($filter('filter')($scope.schemes, $scope.summaryFilterWithTaluka($scope.talukas[i]), true).length > 0){
							data.push({y: ($scope.sum('estim_cost', $scope.summaryFilterWithTaluka($scope.talukas[i]))/sum)*100, label: $scope.talukas[i].title},);
							data2.push({y: $scope.sum('estim_expenditure', $scope.summaryFilterWithTaluka($scope.talukas[i])), label: $scope.talukas[i].title},);
						}
					}
				}
				setTimeout(function(){
					var chart = new CanvasJS.Chart("sectorWiseRelease", {
						animationEnabled: true,
						title: {
							text: "SECTOR WISE RELEASE CHART"
						},
						data: [{
							type: "pie",
							startAngle: 240,
							yValueFormatString: "##0.00\"%\"",
							indexLabel: "{label} {y}",
							dataPoints: data
						}]
					});
					var chartsector = new CanvasJS.Chart("sectorWiseUtilize", {
						animationEnabled: true,
						theme: "light2", // "light1", "light2", "dark1", "dark2"
						title:{
							text: "SECTOR WISE UTILIZATION CHART"
						},
						axisY: {
							title: "Estimated Expense (M)"
						},
						data: [{
							type: "column",
							showInLegend: true,
							legendMarkerColor: "grey",
							legendText: "M = one million rupees",
							dataPoints: data2
						}]
					});
					chart.render();
					chartsector.render();
				}, 500);
			}
		}
		$scope.showDetail = function(type){
			$scope.currentScreen = 2;
			$scope.currentPage = 1;
			$scope.itemsPerPage = 10;
			$scope.detailType = type;
		}
		$scope.summaryFilter = function(item){
			if($scope.summaryType <= 2){
				return item.approval_year < 2022;
			}
			else{
				return item.approval_year >= 2022;
			}
		}
		$scope.summaryFilterWithSector = function(sector) {
			return function(item) {
				let rtn = false;
				if($scope.summaryType <= 2){
					rtn = item.approval_year < 2022;
				}
				else{
					rtn = item.approval_year >= 2022;
				}
				return rtn && sector.id == item.sector_id;
			}
		}
		$scope.summaryFilterWithTaluka = function(taluka) {
			return function(item) {
				let rtn = false;
				if($scope.summaryType <= 2){
					rtn = item.approval_year < 2022;
				}
				else{
					rtn = item.approval_year >= 2022;
				}
				return rtn && taluka.id == item.taluka_id;
			}
		}
		$scope.detailFilter = function(item){
			let rtn = false;
			if($scope.detailType == 0){
				rtn =  item.approval_year < 2022
			}
			else{
				rtn = item.approval_year >= 2022;
			}
			return rtn && ($scope.filters.sector.length == 0 || $scope.filters.sector.indexOf(item.sector_id) !== -1)
				&& ($scope.filters.taluka.length == 0 || $scope.filters.taluka.indexOf(item.taluka_id) !== -1)
				&& ($scope.filters.category.length == 0 || $scope.filters.category.indexOf(item.category_id) !== -1)
				&& ($scope.filters.year.length == 0 || $scope.filters.year.indexOf(item.approval_year) !== -1);;
		}
		$scope.sortBy = function(col){
			if($scope.orderByCol == col){
				$scope.orderDirection = !$scope.orderDirection
			}
			else{
				$scope.orderByCol = col;
				$scope.orderDirection = false;
			}
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
