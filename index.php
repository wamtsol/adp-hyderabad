<?php 
include("admin/include/db.php");
include("admin/include/utility.php");
include("admin/include/paging.php");
define("APP_START", 1);
include("ajax.php");
?>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="images/favicon.png" />
<title>MIS System for Annual Development Program - District Hyderabad 2020-21</title>
<link type="text/css" rel="stylesheet" href="admin/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet" href="admin/css/font-awesome.css" />
<link type="text/css" rel="stylesheet"  href="admin/css/bootstrap.css" />
<link type="text/css" rel="stylesheet"  href="style.css" />
<script src="js/canvasjs.min.js"></script>
<script type="text/javascript" src="admin/js/jquery.js"></script>
<link href="admin/js/chosen/chosen.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="admin/js/chosen/chosen.jquery.js"></script>
<script>
window.onload = function() {

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
		dataPoints: [
			{y: 79.45, label: "Google"},
			{y: 7.31, label: "Bing"},
			{y: 7.06, label: "Baidu"},
			{y: 4.91, label: "Yahoo"},
			{y: 1.26, label: "Others"}
		]
	}]
});
var chartsector = new CanvasJS.Chart("sectorWiseUtilize", {
	animationEnabled: true,
	theme: "light2", // "light1", "light2", "dark1", "dark2"
	title:{
		text: "SECTOR WISE UTILIZATION CHART"
	},
	axisY: {
		title: "Reserves(MMbbl)"
	},
	data: [{        
		type: "column",  
		showInLegend: true, 
		legendMarkerColor: "grey",
		legendText: "MMbbl = one million barrels",
		dataPoints: [      
			{ y: 300878, label: "Venezuela" },
			{ y: 266455,  label: "Saudi" },
			{ y: 169709,  label: "Canada" },
			{ y: 158400,  label: "Iran" },
			{ y: 142503,  label: "Iraq" },
			{ y: 101500, label: "Kuwait" },
			{ y: 97800,  label: "UAE" },
			{ y: 80000,  label: "Russia" }
		]
	}]
});
chart.render();
chartsector.render();
}
</script>
</head>
<body>
<div ng-app="summary" ng-controller="summaryController" id="summaryController">
    <div class="container">
        <div class="main">
            <div class="header">
                <div class="row">
                    <div class="col-xs-2">
                        <div class="logo"><img src="images/logo.png"></div>
                    </div>
                    <div class="col-xs-10">
                        <div class="district">
                            <h1>ANNUAL DEVELOPMENT PROGRAMME</h1>
                            <h2>DISTRICT HYDERABAD</h2>
                            <span class="year">2020-2021</span>
                            
                        </div>
                        <div class="commisioner">
                            <h3>DEPUTY COMMISSIONER HYDERABAD</h3>
                            <h4>MIS System for Annual Development Program - District Hyderabad 2020-21</h4>
                        </div>
                    </div>
                </div>
                <div class="commisioner res">
                    <h3>DEPUTY COMMISSIONER HYDERABAD</h3>
                    <h4>MIS System for Annual Development Program - District Hyderabad 2020-21</h4>
                </div>
            </div>
            <div class="content">
                <div class="filters">
                    <div class="row margin-b-10">
                        <div class="col-md-3">
                            <a href="" class="btn btn-md btn-default" data-ng-click="showSummary(0)">Click here to main page</a>
                            <!-- <a href="#" class="btn btn-md btn-info">Summary</a> -->
                        </div>
                        <div class="col-md-3">
                            <a href="" class="btn btn-md btn-success" data-ng-click="showSummary(1)">Sector Wise Summary On-going</a>
                        </div>
                        <div class="col-md-3">
                            <a href="" class="btn btn-md btn-info" data-ng-click="showSummary(2)">Taluka Wise Summary On-going</a>
                        </div>
                        <div class="col-md-3">
                            <a href="" class="btn btn-md btn-warning" data-ng-click="showDetail(0)">Detailed Report On-going</a>
                        </div>
                    </div>
                    <div class="row margin-b-10">
                        <div class="col-md-3"></div>
                        <div class="col-md-3">
                            <a href="" class="btn btn-md btn-success" data-ng-click="showSummary(3)">Sector Wise Summary New Scheme</a>
                        </div>
                        <div class="col-md-3">
                            <a href="" class="btn btn-md btn-info" data-ng-click="showSummary(4)">Taluka Wise Summary New Scheme</a>
                        </div>
                        <div class="col-md-3">
                            <a href="" class="btn btn-md btn-warning" data-ng-click="showDetail(1)">Detailed Report New Scheme</a>
                        </div>
                    </div>
                    <div class="row" data-ng-if="currentScreen == 2">
                        <div class="col-md-3">
                            <label>Select Sector</label>
                            <select data-ng-model="filters.sector" ng-options="sector.id as sector.title for sector in sectors" chosen multiple>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label>Select Taluka</label>
                            <select data-ng-model="filters.taluka" ng-options="taluka.id as taluka.title for taluka in talukas" chosen multiple>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label>Select Category</label>
                            <select data-ng-model="filters.category" ng-options="category.id as category.title for category in categories" chosen multiple>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label>Select Year</label>
                            <select data-ng-model="filters.year" multiple chosen ng-options="year.approval_year as year.approval_year for year in years">
                            </select>
                        </div>
                    </div>
                </div>
                <div class="summary">
                    <div class="row clearfix" data-ng-if="currentScreen == 0">
                        <div class="col-md-12">
                            <h2>Summary</h2>
                            <h3>For District ADP 2020-2021</h3>
                        </div>
                        <div class="col-md-6">
                            <p>On-Going Scheme</p>
                            <div class="average">
                                <div class="row clearfix">
                                    <div class="col-md-5">
                                        <div class="av-val border-right">
                                            <div class="av-amount">{{ sum('estim_cost', onGoingSchemeFilter)|currency:'Rs. ' }}</div>
                                            <div class="av-title">Estimated Cost
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="av-val text-right row">
                                            <div class="col-md-7">
                                                <div class="av-amount">{{ sum('estim_expenditure', onGoingSchemeFilter)|currency:'Rs. ' }}</div>
                                                <div class="av-title">Estimated expenditure upto June 2021</div>
                                            </div>
                                            <div class="av-days col-md-5">
                                                <div class="percent"><i class="fa" data-ng-class="{'fa-caret-down text-green': (sum('estim_expenditure', onGoingSchemeFilter)-sum('estim_cost', onGoingSchemeFilter))<0, 'fa-caret-up text-red': (sum('estim_expenditure', onGoingSchemeFilter)-sum('estim_cost', onGoingSchemeFilter))>=0}"></i> <span>{{ (((sum('estim_expenditure', onGoingSchemeFilter)-sum('estim_cost', onGoingSchemeFilter))/sum('estim_cost', onGoingSchemeFilter))*100)|currency:'' }}%</span></div>
                                                <div class="last-month" data-ng-if="(sum('estim_expenditure', onGoingSchemeFilter)-sum('estim_cost', onGoingSchemeFilter))<0">vs {{ (sum('estim_cost', onGoingSchemeFilter)-sum('estim_expenditure', onGoingSchemeFilter))|currency:'Rs. ' }} less than the expected cost.</div>
                                                <div class="last-month" data-ng-if="(sum('estim_expenditure', onGoingSchemeFilter)-sum('estim_cost', onGoingSchemeFilter))>=0">vs {{ (sum('estim_expenditure', onGoingSchemeFilter)-sum('estim_cost', onGoingSchemeFilter))|currency:'Rs. ' }} greater than the expected cost.</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="border-btm"></div>
                                <div class="row clearfix">
                                    <div class="col-md-5">
                                        <div class="av-val border-right">
                                            <div class="av-amount">{{ sum('actual_expenditure', onGoingSchemeFilter)|currency:'Rs. ' }}</div>
                                            <div class="av-title">Actual Expenditure Upto June 2020</div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="av-val text-right row">
                                            <div class="col-md-7">
                                                <div class="av-amount">{{ sum('estim_cost', onGoingSchemeFilter)-sum('estim_expenditure', onGoingSchemeFilter)|currency:'Rs. ' }}</div>
                                                <div class="av-title">Through Forward as on 01/07/2020</div>
                                            </div>
                                            <div class="av-days col-md-5">
                                                <div class="percent"><i class="fa" data-ng-class="{'fa-caret-down text-green': (sum('estim_expenditure', onGoingSchemeFilter)-sum('estim_cost', onGoingSchemeFilter))<0, 'fa-caret-up text-red': (sum('estim_expenditure', onGoingSchemeFilter)-sum('estim_cost', onGoingSchemeFilter))>=0}"></i> <span>{{ (((sum('estim_expenditure', onGoingSchemeFilter)-sum('estim_cost', onGoingSchemeFilter))/sum('estim_cost', onGoingSchemeFilter))*100)|currency:'' }}%</span></div>
                                                <div class="last-month" data-ng-if="(sum('estim_expenditure', onGoingSchemeFilter)-sum('estim_cost', onGoingSchemeFilter))<0">vs {{ (sum('estim_cost', onGoingSchemeFilter)-sum('estim_expenditure', onGoingSchemeFilter))|currency:'Rs. ' }} less than the expected cost.</div>
                                                <div class="last-month" data-ng-if="(sum('estim_expenditure', onGoingSchemeFilter)-sum('estim_cost', onGoingSchemeFilter))>=0">vs {{ (sum('estim_expenditure', onGoingSchemeFilter)-sum('estim_cost', onGoingSchemeFilter))|currency:'Rs. ' }} greater than the expected cost.</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <p>New Scheme</p>
                            <div class="average">
                                <div class="row clearfix">
                                    <div class="col-md-5">
                                        <div class="av-val border-right">
                                            <div class="av-amount">{{ sum('estim_cost', newSchemeFilter)|currency:'Rs. ' }}</div>
                                            <div class="av-title">Estimated Cost
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="av-val text-right row">
                                            <div class="col-md-7">
                                                <div class="av-amount">{{ sum('estim_expenditure', newSchemeFilter)|currency:'Rs. ' }}</div>
                                                <div class="av-title">Estimated expenditure upto June 2021</div>
                                            </div>
                                            <div class="av-days col-md-5">
                                                <div class="percent"><i class="fa" data-ng-class="{'fa-caret-down text-green': (sum('estim_expenditure', newSchemeFilter)-sum('estim_cost', newSchemeFilter))<0, 'fa-caret-up text-red': (sum('estim_expenditure', newSchemeFilter)-sum('estim_cost', newSchemeFilter))>=0}"></i> <span>{{ (((sum('estim_expenditure', newSchemeFilter)-sum('estim_cost', newSchemeFilter))/sum('estim_cost', newSchemeFilter))*100)|currency:'' }}%</span></div>
                                                <div class="last-month" data-ng-if="(sum('estim_expenditure', onGoingSchemeFilter)-sum('estim_cost', onGoingSchemeFilter))<0">vs {{ (sum('estim_cost', newSchemeFilter)-sum('estim_expenditure', newSchemeFilter))|currency:'Rs. ' }} less than the expected cost.</div>
                                                <div class="last-month" data-ng-if="(sum('estim_expenditure', onGoingSchemeFilter)-sum('estim_cost', onGoingSchemeFilter))>=0">vs {{ (sum('estim_expenditure', newSchemeFilter)-sum('estim_cost', newSchemeFilter))|currency:'Rs. ' }} greater than the expected cost.</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="border-btm"></div>
                                <div class="row clearfix">
                                    <div class="col-md-5">
                                        <div class="av-val border-right">
                                            <div class="av-amount">{{ sum('actual_expenditure', newSchemeFilter)|currency:'Rs. ' }}</div>
                                            <div class="av-title">Actual Expenditure Upto June 2020</div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="av-val text-right row">
                                            <div class="col-md-7">
                                                <div class="av-amount">{{ sum('estim_cost', newSchemeFilter)-sum('estim_expenditure', newSchemeFilter)|currency:'Rs. ' }}</div>
                                                <div class="av-title">Through Forward as on 01/07/2020</div>
                                            </div>
                                            <div class="av-days col-md-5">
                                                <div class="percent"><i class="fa" data-ng-class="{'fa-caret-down text-green': (sum('estim_expenditure', newSchemeFilter)-sum('estim_cost', newSchemeFilter))<0, 'fa-caret-up text-red': (sum('estim_expenditure', newSchemeFilter)-sum('estim_cost', newSchemeFilter))>=0}"></i> <span>{{ (((sum('estim_expenditure', newSchemeFilter)-sum('estim_cost', newSchemeFilter))/sum('estim_cost', newSchemeFilter))*100)|currency:'' }}%</span></div>
                                                <div class="last-month" data-ng-if="(sum('estim_expenditure', onGoingSchemeFilter)-sum('estim_cost', newSchemeFilter))<0">vs {{ (sum('estim_cost', newSchemeFilter)-sum('estim_expenditure', newSchemeFilter))|currency:'Rs. ' }} less than the expected cost.</div>
                                                <div class="last-month" data-ng-if="(sum('estim_expenditure', onGoingSchemeFilter)-sum('estim_cost', newSchemeFilter))>=0">vs {{ (sum('estim_expenditure', newSchemeFilter)-sum('estim_cost', newSchemeFilter))|currency:'Rs. ' }} greater than the expected cost.</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div data-ng-if="currentScreen == 1">
                        <h2>{{ summaryType==1 || summaryType==3 ? "Sector":"Taluka" }} Wise Summary For {{ summaryType==1 || summaryType==2 ? "On-Going":"New" }} Schemes</h2>
                        <h3>Hyderabad District ADP 2020-2021</h3>
                        <div class="summary-list table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>{{ summaryType==1 || summaryType==3 ? "Sector":"Taluka" }}</th>
                                        <th class="bg-danger">No. Of Schemes</th>
                                        <th class="bg-primary">Estimated Cost</th>
                                        <th class="bg-primary">Actual Expense</th>
                                        <th class="bg-primary">Estimated Expense</th>
                                        <th class="bg-success">Throwforward as on 01-07-2020 </th>
                                        <th class="bg-info">Capital</th>
                                        <th class="bg-info">Electric</th>
                                        <th class="bg-info">Rev</th>
                                        <th class="bg-warning">Total</th>
                                    </tr>
                                </thead>
                                <tbody data-ng-if="summaryType==1 || summaryType==3">
                                    <tr data-ng-repeat="sector in sectors|filter:{parent_id: 0}:true" data-ng-show="(schemes|filter:summaryFilterWithSector(sector)).length > 0">
                                        <td>{{ sector.title }}</td>
                                        <td class="bg-danger">{{ (schemes|filter:summaryFilterWithSector(sector)).length }}</td>
                                        <td class="bg-primary">{{ sum('estim_cost', summaryFilterWithSector(sector))|currency:'' }}</td>
                                        <td class="bg-primary">{{ sum('actual_expenditure', summaryFilterWithSector(sector))|currency:'' }}</td>
                                        <td class="bg-primary">{{ sum('estim_expenditure', summaryFilterWithSector(sector))|currency:'' }}</td>
                                        <td class="bg-success">{{ sum('estim_cost', summaryFilterWithSector(sector))-sum('actual_expenditure', summaryFilterWithSector(sector))|currency:'' }}</td>
                                        <td class="bg-info">{{ sum('capital', summaryFilterWithSector(sector))|currency:'' }}</td>
                                        <td class="bg-info">{{ sum('electric', summaryFilterWithSector(sector))|currency:'' }}</td>
                                        <td class="bg-info">{{ sum('rev', summaryFilterWithSector(sector))|currency:'' }}</td>
                                        <td class="bg-warning">{{ sum('capital', summaryFilterWithSector(sector))+sum('electric', summaryFilterWithSector(sector))+sum('rev', summaryFilterWithSector(sector))|currency:'' }}</td>
                                    </tr>
                                </tbody>
                                <tbody data-ng-if="summaryType==2 || summaryType==4">
                                    <tr data-ng-repeat="taluka in talukas" data-ng-show="(schemes|filter:summaryFilterWithTaluka(taluka)).length > 0">
                                        <td>{{ taluka.title }}</td>
                                        <td class="bg-danger">{{ (schemes|filter:summaryFilterWithTaluka(taluka)).length }}</td>
                                        <td class="bg-primary">{{ sum('estim_cost', summaryFilterWithTaluka(taluka))|currency:'' }}</td>
                                        <td class="bg-primary">{{ sum('actual_expenditure', summaryFilterWithTaluka(taluka))|currency:'' }}</td>
                                        <td class="bg-primary">{{ sum('estim_expenditure', summaryFilterWithTaluka(taluka))|currency:'' }}</td>
                                        <td class="bg-success">{{ sum('estim_cost', summaryFilterWithTaluka(taluka))-sum('actual_expenditure', summaryFilterWithTaluka(taluka))|currency:'' }}</td>
                                        <td class="bg-info">{{ sum('capital', summaryFilterWithTaluka(taluka))|currency:'' }}</td>
                                        <td class="bg-info">{{ sum('electric', summaryFilterWithTaluka(taluka))|currency:'' }}</td>
                                        <td class="bg-info">{{ sum('rev', summaryFilterWithTaluka(taluka))|currency:'' }}</td>
                                        <td class="bg-warning">{{ sum('capital', summaryFilterWithTaluka(taluka))+sum('electric', summaryFilterWithTaluka(taluka))+sum('rev', summaryFilterWithTaluka(taluka))|currency:'' }}</td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>Total</th>
                                        <th class="bg-danger">{{ (schemes|filter:summaryFilter).length }}</th>
                                        <th class="bg-primary">{{ sum('estim_cost', summaryFilter)|currency:'' }}</th>
                                        <th class="bg-primary">{{ sum('actual_expenditure', summaryFilter)|currency:'' }}</th>
                                        <th class="bg-primary">{{ sum('estim_expenditure', summaryFilter)|currency:'' }}</th>
                                        <th class="bg-success">{{ sum('estim_cost', summaryFilter)-sum('actual_expenditure', summaryFilter)|currency:'' }}</th>
                                        <th class="bg-info">{{ sum('capital', summaryFilter)|currency:'' }}</th>
                                        <th class="bg-info">{{ sum('electric', summaryFilter)|currency:'' }}</th>
                                        <th class="bg-info">{{ sum('rev', summaryFilter)|currency:'' }}</th>
                                        <th class="bg-warning">{{ sum('capital', summaryFilter)+sum('electric', summaryFilter)+sum('rev', summaryFilter)|currency:'' }}</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div id="sectorWiseRelease" style="height: 300px; width: 100%;"></div>
                            </div>
                            <div class="col-md-6">
                                <div id="sectorWiseUtilize" style="height: 300px; width: 100%;"></div>
                            </div>
                        </div>
                    </div>
                    <div class="summary-list table-responsive" data-ng-if="currentScreen == 2">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th width="10%"><a data-ng-click="sortBy('sector')">Sector <i data-ng-if="orderByCol=='sector'" class="fa" data-ng-class="{'fa-caret-down': orderDirection, 'fa-caret-up': !orderDirection}"></i></a></th>
                                    <th width="8%"><a data-ng-click="sortBy('adp_number')">ADP No <i data-ng-if="orderByCol=='adp_number'" class="fa" data-ng-class="{'fa-caret-down': orderDirection, 'fa-caret-up': !orderDirection}"></i></a></th>
                                    <th><a data-ng-click="sortBy('project_description')">Description <i data-ng-if="orderByCol=='project_description'" class="fa" data-ng-class="{'fa-caret-down': orderDirection, 'fa-caret-up': !orderDirection}"></i></a></th>
                                    <th width="10%"><a data-ng-click="sortBy('approval_year')">Approval Year <i data-ng-if="orderByCol=='approval_year'" class="fa" data-ng-class="{'fa-caret-down': orderDirection, 'fa-caret-up': !orderDirection}"></i></a></th>
                                    <th width="10%"><a data-ng-click="sortBy('completion_date')">Target Date for Completion <i data-ng-if="orderByCol=='completion_date'" class="fa" data-ng-class="{'fa-caret-down': orderDirection, 'fa-caret-up': !orderDirection}"></i></a></th>
                                    <th width="6%" class="bg-primary"><a data-ng-click="sortBy('estim_cost')">Estimated Cost <i data-ng-if="orderByCol=='estim_cost'" class="fa" data-ng-class="{'fa-caret-down': orderDirection, 'fa-caret-up': !orderDirection}"></i></a></th>
                                    <th width="6%" class="bg-primary"><a data-ng-click="sortBy('actual_expenditure')">Acutal Expense <i data-ng-if="orderByCol=='actual_expenditure'" class="fa" data-ng-class="{'fa-caret-down': orderDirection, 'fa-caret-up': !orderDirection}"></i></a></th>
                                    <th width="6%" class="bg-primary"><a data-ng-click="sortBy('estim_expenditure')">Estimated Expense <i data-ng-if="orderByCol=='estim_expenditure'" class="fa" data-ng-class="{'fa-caret-down': orderDirection, 'fa-caret-up': !orderDirection}"></i></a></th>
                                    <th width="6%" class="bg-success">Throwforward as on 01-07-2020</th>
                                    <th width="6%" class="bg-info"><a data-ng-click="sortBy('capital')">Capital <i data-ng-if="orderByCol=='capital'" class="fa" data-ng-class="{'fa-caret-down': orderDirection, 'fa-caret-up': !orderDirection}"></i></a></th>
                                    <th width="6%" class="bg-info"><a data-ng-click="sortBy('electric')">Electric <i data-ng-if="orderByCol=='electric'" class="fa" data-ng-class="{'fa-caret-down': orderDirection, 'fa-caret-up': !orderDirection}"></i></a></th>
                                    <th width="6%" class="bg-info"><a data-ng-click="sortBy('rev')">Rev <i data-ng-if="orderByCol=='rev'" class="fa" data-ng-class="{'fa-caret-down': orderDirection, 'fa-caret-up': !orderDirection}"></i></a></th>
                                    <th width="6%" class="bg-info"><a>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr data-ng-repeat="scheme in (schemes|filter:detailFilter:true|orderBy:orderByCol:orderDirection).slice(((currentPage-1)*itemsPerPage), ((currentPage)*itemsPerPage))">
                                    <td>{{ scheme.sector_id > 0 ? (sectors|filter:{id: scheme.sector_id}:1)[0].title : "--" }}</td>
                                    <td>{{ scheme.adp_number }}</td>
                                    <td>{{ scheme.project_description }}</td>
                                    <td>{{ scheme.approval_year }}</td>
                                    <td>{{ scheme.completion_date|date }}</td>
                                    <td class="bg-primary">{{ scheme.estim_cost }}</td>
                                    <td class="bg-primary">{{ scheme.actual_expenditure }}</td>
                                    <td class="bg-primary">{{ scheme.estim_expenditure }}</td>
                                    <td class="bg-success">{{ scheme.estim_cost-scheme.actual_expenditure | number : 2 }}</td>
                                    <td class="bg-info">{{ scheme.capital }}</td>
                                    <td class="bg-info">{{ scheme.electric }}</td>
                                    <td class="bg-info">{{ scheme.rev }}</td>
                                    <td class="bg-info">{{ (scheme.capital + scheme.electric + scheme.rev) | currency:'' }}</td>
                                </tr>

                                <tr>
                                    <th colspan="5" class="text-right">Grand Total</th>
                                    <th class="bg-primary">{{ sum('estim_cost', detailFilter)|currency:'' }}</th>
                                    <th class="bg-primary">{{ sum('actual_expenditure', detailFilter)|currency:'' }}</th>
                                    <th class="bg-primary">{{ sum('estim_expenditure', detailFilter)|currency:'' }}</th>
                                    <th class="bg-success">{{ sum('estim_cost', detailFilter)-sum('actual_expenditure', detailFilter)|currency:'' }}</th>
                                    <th class="bg-info">{{ sum('capital', detailFilter)|currency:'' }}</th>
                                    <th class="bg-info">{{ sum('electric', detailFilter)|currency:'' }}</th>
                                    <th class="bg-info">{{ sum('rev', detailFilter)|currency:'' }}</th>
                                    <th class="bg-info">{{ sum('capital', detailFilter)+sum('electric', detailFilter)+sum('rev', detailFilter)|currency:'' }}</th>
                                </tr>
                            </tbody>
                        </table>
                        <ul uib-pagination total-items="(schemes|filter:detailFilter:true).length" ng-model="currentPage" items-per-page="itemsPerPage"></ul>
                    </div>
                </div>
            </div>
            <div class="footer">
                <div class="row">
                    <div class="col-md-6">
                        <p>District Development Information System - Hyderabad</p>
                    </div>
                    <div class="col-md-6">
                        <p class="text-right">Designed & Maintained By:- Wamtsol.com</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="admin/js/angular.min.js"></script>
<script type="text/javascript" src="admin/js/angular-animate.js"></script>
<script src="admin/js/angular-moment.min.js"></script>
<script type="text/javascript" src="admin/js/ui-bootstrap.min.js"></script>
<script type="text/javascript" src="js/summary.angular.js"></script>
<script type="text/javascript" src="admin/js/angular-chosen.js"></script>
</body>
</html>
