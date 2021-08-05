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
<title>DDIS-Hyderabad-2020-21</title>
<link type="text/css" rel="stylesheet" href="admin/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet" href="admin/css/font-awesome.css" />
<link type="text/css" rel="stylesheet"  href="admin/css/bootstrap.css" />
<link type="text/css" rel="stylesheet"  href="style.css" />
<script src="js/canvasjs.min.js"></script>
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
                    <div class="col-md-2">
                        <div class="logo"><img src="images/logo.png"></div>
                    </div>
                    <div class="col-md-10">
                        <div class="district">
                            <h1>ANNUAL DEVELOPMENT PROGRAMME</h1>
                            <h2>District Hyderabad</h2>
                            <span class="year">2020-2021</span>
                            
                        </div>
                        <div class="commisioner">
                            <h3>DEPUTY COMMISSIONER Hyderabad</h3>
                            <h4>ADP Information System</h4>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content">
                <div class="filters">
                    <div class="row margin-b-10">
                        <div class="col-md-3">
                            <a href="#" class="btn btn-md btn-default">Click here to main page</a>
                            <!-- <a href="#" class="btn btn-md btn-info">Summary</a> -->
                        </div>
                        <div class="col-md-3">
                            <a href="#" class="btn btn-md btn-success">Sector Wise Summary On-going</a>
                        </div>
                        <div class="col-md-3">
                            <a href="#" class="btn btn-md btn-info">Taluka Wise Summary On-going</a>
                        </div>
                        <div class="col-md-3">
                            <a href="#" class="btn btn-md btn-warning">Detailed Report On-going</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <a href="#" class="btn btn-md btn-default">Summary</a>
                            <!-- <a href="#" class="btn btn-md btn-info">Summary</a> -->
                        </div>
                        <div class="col-md-3">
                            <a href="#" class="btn btn-md btn-success">Sector Wise Summary New Scheme</a>
                        </div>
                        <div class="col-md-3">
                            <a href="#" class="btn btn-md btn-info">Taluka Wise Summary New Scheme</a>
                        </div>
                        <div class="col-md-3">
                            <a href="#" class="btn btn-md btn-warning">Detailed Report New Scheme</a>
                        </div>
                    </div>
                </div>
                <div class="summary">
                    <div class="row clearfix">
                        <div class="col-md-7" style="float:right">
                            <div class="average">
                                <div class="av-head">
                                    <h4>Xero Current AR and AP</h4>
                                    <div class="av-icons">
                                        <ul>
                                            <li><i class="fa fa-exclamation-circle"></i></li>
                                            <li><i class="fa fa-comment"></i></li>
                                            <li><i class="fa fa-ellipsis-v"></i></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <div class="col-md-5">
                                        <div class="av-val border-right">
                                            <div class="av-amount">$0</div>
                                            <div class="av-title">Accounts Receivable</div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="av-val text-right">
                                            <div class="col-md-7">
                                                <div class="av-amount">27</div>
                                                <div class="av-title">Average debtors days</div>
                                            </div>
                                            <div class="av-days col-md-5">
                                                <div class="percent"><i class="fa fa-caret-up"></i> <span>80%</span></div>
                                                <div class="last-month">vs 15 last month</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="border-btm"></div>
                                <div class="row clearfix">
                                    <div class="col-md-5">
                                        <div class="av-val border-right">
                                            <div class="av-amount">$0</div>
                                            <div class="av-title">Accounts Payable</div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="av-val text-right">
                                            <div class="col-md-7">
                                                <div class="av-amount">15</div>
                                                <div class="av-title">Average creditors days</div>
                                            </div>
                                            <div class="av-days col-md-5">
                                                <div class="percent"><i class="fa fa-caret-up"></i> <span>95%</span></div>
                                                <div class="last-month">vs 8 last month</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <h2 style="margin: 44% 0 0 0;">Summary</h2>
                            
                        </div>
                    </div>
                    <h3>For District ADP 2020-2021</h3>
                            <p>On-Going Scheme</p>
                    <div class="summary-list">
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <!-- <th>Sector <i class="fa fa-caret-down"></i></th> -->
                                    <th>ADP No <i class="fa fa-caret-down"></i></th>
                                    <th>Description</th>
                                    <th>Target Date for Completion</th>
                                    <th class="bg-primary">Estim: Cost </th>
                                    <th class="bg-primary">Acutal Exp:</th>
                                    <th class="bg-primary">Estim Exp:</th>
                                    <th class="bg-success">Throwfwd as on  </th>
                                    <th class="bg-info">Capi</th>
                                    <th class="bg-info">Electric</th>
                                    <th class="bg-info">Rev</th>
                                    <th class="bg-info">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr data-ng-repeat="scheme in schemes">
                                    <!-- <td>C.C BLOCK / DRAIN</td> -->
                                    <td>{{ scheme.adp_number }}</td>
                                    <td>{{ scheme.project_description }}</td>
                                    <td>{{ scheme.completion_date }}</td>
                                    <td class="bg-primary">{{ scheme.estim_cost }}</td>
                                    <td class="bg-primary">{{ scheme.actual_expenditure }}</td>
                                    <td class="bg-primary">{{ scheme.estim_expenditure }}</td>
                                    <td class="bg-success">454</td>
                                    <td class="bg-info">{{ scheme.capital }}</td>
                                    <td class="bg-info">{{ scheme.electric }}</td>
                                    <td class="bg-info">{{ scheme.rev }}</td>
                                    <td class="bg-info">3434</td>
                                </tr>
                                
                                <tr>
                                    <th>Grand Total</th>
                                    <!-- <th>445</th> -->
                                    <th>2,920.920</th>
                                    <th>1,259.249</th>
                                    <th class="bg-primary">433.577</th>
                                    <th class="bg-primary">619.664</th>
                                    <th class="bg-primary">551.478</th>
                                    <th class="bg-success">551.478</th>
                                    <th class="bg-info">503.586</th>
                                    <th class="bg-info">89.00%</th>
                                    <th class="bg-info">81.27%</th>
                                    <th class="bg-info">91.32%</th>
                                </tr>
                            </tbody>
                        </table>
                        <ul uib-pagination total-items="filters.total" ng-model="filters.page" max-size="maxSize" items-per-page="filters.rows" data-ng-change="get_records()"></ul>
                        <div class="row">
                            <div class="col-md-6">
                                <div id="sectorWiseRelease" style="height: 300px; width: 100%;"></div>
                            </div>
                            <div class="col-md-6">
                                <div id="sectorWiseUtilize" style="height: 300px; width: 100%;"></div>
                            </div>
                        </div>
                    </div>
                    <h2>Summary</h2>
                    <h3>For District ADP 2020-2021</h3>
                    <p>New Scheme</p>
                    <div class="summary-list">
                        <table class="table table-responsive">
                            <thead>
                                    <tr>
                                        <th>Sector <i class="fa fa-caret-down"></i></th>
                                        <th>ADP No <i class="fa fa-caret-down"></i></th>
                                        <th>Description</th>
                                        <th>Target Date for Completion</th>
                                        <th>Estim: Cost </th>
                                        <th>Acutal Exp:</th>
                                        <th>Throwfwd as on  </th>
                                        <th>Capi</th>
                                        <th>Electric</th>
                                        <th>Rev</th>
                                        <th>Total</th>
                                    </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>2,920.92</td>
                                    <td>1,259.249</td>
                                    <td>445</td>
                                    <td>433.577</td>
                                    <td>619.664</td>
                                    <td>551.478</td>
                                    <td>503.586</td>
                                    <td>89%</td>
                                    <td>81.27%</td>
                                    <td>91.32%</td>
                                </tr>
                                <tr>
                                    <td>2,920.92</td>
                                    <td>1,259.249</td>
                                    <td>445</td>
                                    <td>433.577</td>
                                    <td>619.664</td>
                                    <td>551.478</td>
                                    <td>503.586</td>
                                    <td>89%</td>
                                    <td>81.27%</td>
                                    <td>91.32%</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="footer">
                <div class="row">
                    <div class="col-md-6">
                        <p>District Development Information System - Jamshoro</p>
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
</body>
</html>