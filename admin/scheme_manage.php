<?php 
include("include/db.php");
include("include/utility.php");
include("include/session.php");
include("include/paging.php");
define("APP_START", 1);
include("modules/scheme/ajax.php");
$page="scheme_manage";
?>
<?php include("include/header.php");?>
    <div ng-app="scheme" ng-controller="schemeController" id="schemeController">
       <div class="page-header">
            <h1 class="title">Schemes</h1>
            <ol class="breadcrumb">
                <li class="active">Schemes Manage</li>
            </ol>
           <div class="right" style="text-align: left">
               <div class="row" role="group" aria-label="...">
                   <div class="btn-group" role="group" aria-label="...">
                       <!-- <a data-ng-click="addNewIssue()" class="btn btn-light" ng-if="admin_type.can_add==1">Add New Issue</a> -->
                       <a id="topstats" class="btn btn-light" href="#"><i class="fa fa-search"></i></a>
                   </div>
               </div>
           </div>
        </div>
        <div class="container-widget row">
            <div class="col-md-12">
                <div id="total-sale">
                    <h2 class="total-heading" style="margin-top:0"></h2>
                    <div class="clearfix row margin-btm-10">
                        <div class="col-md-12">
                            <ul class="topstats clearfix search_filter">
                                <li class="col-xs-12 col-lg-12 col-sm-12">
                                    <div>
                                        <form class="form-horizontal" action="" method="get">
                                            <div class="col-sm-3 col-xs-8">
                                                <input type="text" title="Enter String" data-ng-model="filters.search" data-ng-change="search_records()" id="search" class="form-control" >
                                            </div>
                                            <!-- <div class="col-sm-3 col-xs-8">
                                                <select data-ng-model="filters.responsible_user" data-ng-change="search_records()">
                                                    <option value="0">Select Responsible User</option>
                                                    <option data-ng-repeat="user in users" value="{{ user.id }}">{{ user.name }}</option>
                                                </select>
                                            </div> -->
                                        </form>
                                    </div>
                                </li>
                            </ul>
                            <div class="panel-body table-responsive" data-ng-if="!processing">
                                <table width="100%" class="table table-hover list">
                                    <tr>
                                        <th width="2%" class="text-center">SN</th>
                                        <th width="12%">ADP No</th>
                                        <th width="20%">Project Description</th>
										<th width="10%">Category</th>
                                        <th width="6%">Year of Approval</th>
                                        <th width="10%">Sector</th>
                                        <th width="10%">Taluka</th>
                                        <th width="6%">Completion Date</th>
                                        <th width="6%">Approved Cost</th>
										<th width="6%">Throw Forward</th>
										<th width="6%">Original Budget</th>
										<th width="6%">Final Budget</th>
										<th width="6%">Prog release</th>
										<th width="6%">Prog expenditure</th>
										<th width="10%">Prog Rel as % of Final Budget</th>
										<th width="10%">Prog Exp as % of Final Budget</th>
										<th width="10%">% Utilization of Released Amount</th>
                                    </tr>
                                    <tr data-ng-repeat="scheme in schemes">
                                        <td class="text-center">{{ $index+1 }}</td>
                                        <td><input type="text" data-ng-model="scheme.adp_number" class="form-control" /> </td>
                                        <td><textarea data-ng-model="scheme.project_description" class="form-control" rows="8">{{ scheme.project_description }}</textarea></td>
                                        <td>
											<select data-ng-model="scheme.category_id" chosen ng-options="category.id as category.title for category in categories">
												
											</select>
										</td>
                                        <td>2016</td>
                                        <td>
                                            <select data-ng-model="scheme.sector_id" chosen ng-options="sector.id as sector.title for sector in sectors">
											</select>
                                        </td>
										<td>
                                            <select data-ng-model="scheme.taluka_id" chosen ng-options="talk.id as talk.title for talk in taluka">
											</select>
                                        </td>
										<td><input type="text" data-ng-model="scheme.completion_date" class="form-control date-picker" /></td>
										<td><input type="text" data-ng-model="scheme.approved_cost" class="form-control" /></td>
										<td><input type="text" data-ng-model="scheme.through_forward" class="form-control" /></td>
										<td><input type="text" data-ng-model="scheme.original_budget" class="form-control" /></td>
										<td><input type="text" data-ng-model="scheme.final_budget" class="form-control" /></td>
										<td><input type="text" data-ng-model="scheme.progress_release" class="form-control" /></td>
										<td><input type="text" data-ng-model="scheme.progress_expenditure" class="form-control" /></td>
										<td>100%</td>
										<td>100.41%</td>
										<td>100.41%</td>
                                    </tr>
                                    <tr>
										<td colspan="13"><span class="danger" data-ng-if="schemes.length==0">No Rocord found.</span></td>
                                        <td colspan="2"><a href="" class="btn btn-lg btn-default" data-ng-click="add()">Add New</a></td>
                                        <td colspan="2"><button type="submit" ng-disabled="processing" class="btn btn-lg btn-default" ng-click="saveScheme()" title="Submit Record"><i class="fa fa-spin fa-gear" ng-show="processing"></i> SUBMIT</button></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="text-center" data-ng-if="processing">
                                <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 50 50">
                                    <path fill="#C779D0" d="M25,5A20.14,20.14,0,0,1,45,22.88a2.51,2.51,0,0,0,2.49,2.26h0A2.52,2.52,0,0,0,50,22.33a25.14,25.14,0,0,0-50,0,2.52,2.52,0,0,0,2.5,2.81h0A2.51,2.51,0,0,0,5,22.88,20.14,20.14,0,0,1,25,5Z">
                                        <animateTransform attributeName="transform" type="rotate" from="0 25 25" to="360 25 25" dur="0.5s" repeatCount="indefinite"/>
                                    </path>
                                </svg>
                            </div>
                            <ul uib-pagination total-items="filters.total" ng-model="filters.page" max-size="maxSize" items-per-page="filters.rows" ng-change="get_records()"></ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</div>
<style>
    input,select{ width:100%;}
    .wct-popup {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: 99999;
    }

    .wct-popup-bg {
        background-color: rgba(0,0,0,0.3);
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        z-index: 99998;
        height: 100%;
    }

    .wct-popup-content {
        position: absolute;
        top: 50%;
        left: 50%;
        padding: 20px;
        background: #fff;
        z-index: 99999;
        width: 90%;
        max-width: 640px;
        transform: translate(-50%,-50%);
    }

    span.wct-popup-close {
        position: absolute;
        top: 5px;
        right: 5px;
        width: 30px;
        height: 30px;
        text-align: center;
        line-height: 30px;
        font-size: 24px;
        cursor: pointer;
    }
    .bootstrap-datetimepicker-widget{
        top: 0 !important;
    }
    .textarea{
        width: 100%;
        resize: vertical;
    }
</style>
<?php include("include/footer.php");?>