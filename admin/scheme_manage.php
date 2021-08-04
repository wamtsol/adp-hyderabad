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
                                            <div class="col-sm-2 col-xs-8">
                                                <input type="text" title="Enter String" data-ng-model="filters.search" data-ng-change="search_records()" id="search" class="form-control">
                                            </div>
                                            <div class="col-sm-2 col-xs-8">
                                                <select data-ng-model="filters.category" convert-to-number data-ng-change="search_records()">
                                                    <option value="0">Select Category</option>
                                                    <option data-ng-repeat="category in categories" value="{{ category.id }}">{{ category.title }}</option>
                                                </select>
                                            </div>
                                            <div class="col-sm-2 col-xs-8">
                                                <select data-ng-model="filters.sector" convert-to-number data-ng-change="search_records()">
                                                    <option value="0">Select Sector</option>
                                                    <option data-ng-repeat="sector in sectors" value="{{ sector.id }}">{{ sector.title }}</option>
                                                </select>
                                            </div>
                                            <div class="col-sm-2 col-xs-8">
                                                <select data-ng-model="filters.taluka" convert-to-number data-ng-change="search_records()">
                                                    <option value="0">Select Taluka</option>
                                                    <option data-ng-repeat="taluka in talukas" value="{{ taluka.id }}">{{ taluka.title }}</option>
                                                </select>
                                            </div>
                                            <div class="col-sm-2 col-xs-8">
                                                <select data-ng-model="filters.year" convert-to-number data-ng-change="search_records()">
                                                    <option value="0">Select Year</option>
                                                    <option data-ng-repeat="year in years" value="{{ year.approval_year }}">{{ year.approval_year }}</option>
                                                </select>
                                            </div>
                                        </form>
                                    </div>
                                </li>
                            </ul>
                            <div class="panel-body table-responsive" data-ng-if="!processing">
                                <table width="100%" class="table table-hover list">
                                    <tr>
                                        <th width="2%" class="text-center">SN</th>
                                        <th width="10%">ADP No</th>
                                        <th width="15%">Project Description</th>
										<th width="10%">Category</th>
                                        <th width="5%">Year of Approval</th>
                                        <th width="10%">Sector</th>
                                        <th width="10%">Taluka</th>
                                        <th width="6%">Completion Date</th>
                                        <th width="5%">Estim: Cost</th>
										<th width="5%">Acutal Exp:</th>
										<th width="5%">Estimated Expenditure</th>
										<th width="5%">Throwfwd as on</th>
										<th width="5%">Capi</th>
										<th width="5%">Electric</th>
										<th width="5%">Revenue</th>
										<th width="5%">Total</th>
										<th width="5%">2021-22</th>
                                    </tr>
                                    <tr data-ng-repeat="scheme in schemes">
                                        <td class="text-center">{{ $index+1 }}</td>
                                        <td><input type="text" data-ng-model="scheme.adp_number" data-ng-change="update_record($index);changed[$index]=false" class="form-control" /> </td>
                                        <td><textarea data-ng-model="scheme.project_description" data-ng-change="update_record($index);changed[$index]=false" class="form-control" rows="8">{{ scheme.project_description }}</textarea></td>
                                        <td>
											<select data-ng-model="scheme.category_id" data-ng-change="update_record($index);changed[$index]=false" chosen ng-options="category.id as category.title for category in categories">
												
                                            </select><br>
                                            <a href="" class="add_item" ng-click="toggleCategory($index)">Add New Category</a>
                                            <div class="new-item" ng-show="scheme.addingNewCategory">
                                                <input type="text" class="form-control" placeholder="Enter Category Name" ng-model="category.title">
                                                <a href="" class="btn btn-danger" ng-click="closeAddNewCategory($index)">Cancel</a>
                                                <a href="" ng-disabled="processing" ng-click="save_category($index)" class="btn btn-info">Save</a>
                                            </div>
										</td>
                                        <td><input type="text" data-ng-model="scheme.approval_year" data-ng-change="update_record($index);changed[$index]=false" class="form-control" /></td>
                                        <td>
                                            <select data-ng-model="scheme.sector_id" data-ng-change="update_record($index);changed[$index]=false" chosen ng-options="sector.id as sector.title for sector in sectors">
                                            </select><br>
                                            <a href="" class="add_item" ng-click="toggleSector($index)">Add New Sector</a>
                                            <div class="new-item" ng-show="scheme.addingNewSector">
                                                <input type="text" class="form-control" placeholder="Enter Sector Name" ng-model="sector.title">
                                                <a href="" class="btn btn-danger" ng-click="closeAddNewSector($index)">Cancel</a>
                                                <a href="" ng-disabled="processing" ng-click="save_sector($index)" class="btn btn-info">Save</a>
                                            </div>
                                        </td>
										<td>
                                            <select data-ng-model="scheme.taluka_id" data-ng-change="update_record($index);changed[$index]=false" chosen ng-options="talk.id as talk.title for talk in talukas">
                                            </select><br>
                                            <a href="" class="add_item" ng-click="toggleTaluka($index)">Add New Taluka</a>
                                            <div class="new-item" ng-show="scheme.addingNewTaluka">
                                                <input type="text" class="form-control" placeholder="Enter Taluka Name" ng-model="taluka.title">
                                                <a href="" class="btn btn-danger" ng-click="closeAddNewTaluka($index)">Cancel</a>
                                                <a href="" ng-disabled="processing" ng-click="save_taluka($index)" class="btn btn-info">Save</a>
                                            </div>
                                        </td>
										<td><input type="text" data-ng-model="scheme.completion_date" data-ng-change="update_record($index);changed[$index]=false" class="form-control date-picker" /></td>
										<td><input type="text" data-ng-model="scheme.estim_cost" data-ng-change="update_record($index);changed[$index]=false" class="form-control" /></td>
										<td><input type="text" data-ng-model="scheme.actual_expenditure" data-ng-change="update_record($index);changed[$index]=false" class="form-control" /></td>
										<td><input type="text" data-ng-model="scheme.estim_expenditure" data-ng-change="update_record($index);changed[$index]=false" class="form-control" /></td>
										<td>100%</td>
                                        <td><input type="text" data-ng-model="scheme.capital" data-ng-change="update_record($index);changed[$index]=false" class="form-control" /></td>
										<td><input type="text" data-ng-model="scheme.electric" data-ng-change="update_record($index);changed[$index]=false" class="form-control" /></td>
										<td><input type="text" data-ng-model="scheme.rev" data-ng-change="update_record($index);changed[$index]=false" class="form-control" /></td>
										<td>100.41%</td>
										<td style="position:relative">100.41% <br> <a href="" data-ng-click="deleteScheme($index)" class="deleteIcon" title="Delete Record"><i class="fa fa-trash"></i></a></td>
                                    </tr>
                                    <tr>
                                        <td colspan="17" class="bg-info"><a href="" data-ng-click="add()" class="btn-add-rec"><span class="btn btn-lg btn-default">Add New Record</span></a></td>
                                        <!-- <td colspan="2"><button type="submit" ng-disabled="processing" class="btn btn-lg btn-default" ng-click="saveScheme()" title="Submit Record"><i class="fa fa-spin fa-gear" ng-show="processing"></i> SUBMIT</button></td> -->
                                    </tr>
                                    <tr data-ng-if="schemes.length==0">
                                        <td colspan="17" class="danger">No Rocord found.</td>
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
                            <ul uib-pagination total-items="filters.total" ng-model="filters.page" max-size="maxSize" items-per-page="filters.rows" data-ng-change="get_records()"></ul>
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