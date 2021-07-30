angular.module('scheme', ['ngAnimate', 'angularMoment', 'angularjs-datetime-picker', 'ui.bootstrap', 'localytics.directives']).controller('schemeController',
	function ($scope, $http, $interval, $filter, $timeout) {
		$scope.filters = {
			search: "",
			category: 0,
			page: 1,
			total: 0,
			rows: 25
		};
		$scope.maxSize = 5;
		$scope.schemes = [];
		$scope.errors = [];
		$scope.categories = [];
		$scope.sectors = [];
		$scope.talukas = [];
		$scope.processing = true;
		$scope.newScheme = {};
		$scope.defaultNewScheme = {
			id: 0,
			sector_id: 0,
			taluka_id: 0,
			category_id: "",
			adp_number: "",
			approval_year: "",
			project_description: "",
			completion_date: "",
			approved_cost: "",
			through_forward: "",
			original_budget: "",
			final_budget: "",
			progress_release: "",
			progress_expenditure: "",
			addingNewCategory: false,
			addingNewSector: false,
			addingNewTaluka: false,
		};
		$scope.category = {
			id: "",
			title: ""
		};
		$scope.category_placeholder = {
            id: "",
			title: ""
        };
		$scope.toggleCategory = function($index) {
			$scope.schemes[$index].addingNewCategory = !$scope.schemes[$index].addingNewCategory;
			setTimeout(function(){focus();}, 100);
		}
		$scope.closeAddNewCategory = function($index){
			$scope.schemes[$index].addingNewCategory = false;
			$scope.errors = [];
			$scope.processing = false;
		}
		$scope.save_category = function ($index) {
            $scope.box_errors = [];
            
                data = {action: 'save_category', category: JSON.stringify( $scope.category )};
                $scope.wctAJAX( data, function( response ){
                   
                    if( response.status == 1 ) {
						$scope.categories.push(response.category);
						$scope.schemes[$index].addingNewCategory = false;
						$scope.schemes[$index].category_id = response.category.id;
                        $scope.category = angular.copy( $scope.category_placeholder );
                    }
                    else{
                        $scope.box_errors = response.error;
                    }
                });
            
		}
		$scope.sector = {
			id: "",
			title: ""
		};
		$scope.sector_placeholder = {
            id: "",
			title: ""
        };
		$scope.toggleSector = function($index) {
			$scope.schemes[$index].addingNewSector = !$scope.schemes[$index].addingNewSector;
			setTimeout(function(){focus();}, 100);
		}
		$scope.closeAddNewSector = function($index){
			$scope.schemes[$index].addingNewSector = false;
			$scope.errors = [];
			$scope.processing = false;
		}
		$scope.save_sector = function ($index) {
            $scope.box_errors = [];
                data = {action: 'save_sector', sector: JSON.stringify( $scope.sector )};
                $scope.wctAJAX( data, function( response ){
                    if( response.status == 1 ) {
						$scope.sectors.push(response.sector);
						$scope.schemes[$index].addingNewSector = false;
						$scope.schemes[$index].sector_id = response.sector.id;
                        $scope.sector = angular.copy( $scope.sector_placeholder );
                    }
                    else{
                        $scope.box_errors = response.error;
                    }
                });
		}
		$scope.taluka = {
			id: "",
			title: ""
		};
		$scope.taluka_placeholder = {
            id: "",
			title: ""
        };
		$scope.toggleTaluka = function($index) {
			$scope.schemes[$index].addingNewTaluka = !$scope.schemes[$index].addingNewTaluka;
			setTimeout(function(){focus();}, 100);
		}
		$scope.closeAddNewTaluka = function($index){
			$scope.schemes[$index].addingNewTaluka = false;
			$scope.errors = [];
			$scope.processing = false;
		}
		$scope.save_taluka = function ($index) {
            $scope.box_errors = [];
                data = {action: 'save_taluka', taluka: JSON.stringify( $scope.taluka )};
                $scope.wctAJAX( data, function( response ){
                    if( response.status == 1 ) {
						$scope.talukas.push(response.taluka);
						$scope.schemes[$index].addingNewTaluka = false;
						$scope.schemes[$index].taluka_id = response.taluka.id;
                        $scope.taluka = angular.copy( $scope.taluka_placeholder );
                    }
                    else{
                        $scope.box_errors = response.error;
                    }
                });
            
        }
		$scope.add = function( ){
			$scope.schemes.push(angular.copy( $scope.defaultNewScheme ));
			init_datepicker();
			//$scope.newScheme = angular.copy($scope.defaultNewScheme);
		}
		$scope.remove = function( position ){
			if( $scope.schemes.length > 1 ){
				$scope.schemes.splice( position, 1 );
			}
			else {
				$scope.schemes = [];
				$scope.schemes.push( angular.copy( $scope.defaultNewScheme ) );
			}
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
		// $scope.updateDate = function(){
		// 	$scope.schemes.completion_date = $(".angular-datetimepicker").val();
		// 	$scope.$apply();
		// }
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
				$scope.talukas = response;
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
					init_datepicker();
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
		$scope.savePromise;
		$scope.update_record = function($index){
			if($scope.savePromise){
				$timeout.cancel($scope.savePromise);
			}
			$scope.savePromise = $timeout(function(){
				$scope.wctAJAX( {action: 'add_scheme', schemes: JSON.stringify($scope.schemes[$index])}, function( response ){
					$scope.schemes[$index].id = response.schemes.id;
				});
			}, 2000);
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
