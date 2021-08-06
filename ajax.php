<?php
if(!defined("APP_START")) die("No Direct Access");
if(isset($_REQUEST["action"])){
    $response = array();
    switch($_REQUEST["action"]){
		case "get_records":
			$sql = "select * from schemes order by ts desc";
			$rs = doquery( $sql, $dblink);
            $schemes = array();
            if( numrows( $rs ) > 0 ) {
                while( $r = dofetch( $rs ) ) {
                    $schemes[] = array(
                        "id" => (int)$r[ "id" ],
						"sector_id" => (int)$r[ "sector_id" ],
						"sub_sector_id" => (int)$r[ "sub_sector_id" ],
                        "taluka_id" => (int)$r[ "taluka_id" ],
						"category_id" => (int)$r[ "category_id" ],
						"approval_year" => (int)$r[ "approval_year" ],
                        "adp_number" => unslash($r[ "adp_number" ]),
                        "project_description" => unslash($r[ "project_description" ]),
                        "completion_date" => strtotime($r[ "completion_date" ])*1000,
                        "estim_cost" => (float)$r[ "estim_cost" ],
                        "actual_expenditure" => (float)$r[ "actual_expenditure" ],
                        "estim_expenditure" => (float)$r[ "estim_expenditure" ],
                        "capital" => (float)$r[ "capital" ],
                        "electric" => (float)$r[ "electric" ],
                        "rev" => (float)$r[ "rev" ],
                    );
                }
            }
            $rs = doquery( "select * from sector", $dblink);
            $sectors = array();
            if( numrows( $rs ) > 0 ) {
                while( $r = dofetch( $rs ) ) {
                    $sectors[] = array(
                        "id" => (int)$r[ "id" ],
                        "parent_id" => (int)$r[ "parent_id" ],
                        "title" => unslash($r[ "title" ]),
                    );
                }
            }
            $rs = doquery( "select * from taluka", $dblink);
            $talukas = array();
            if( numrows( $rs ) > 0 ) {
                while( $r = dofetch( $rs ) ) {
                    $talukas[] = array(
                        "id" => (int)$r[ "id" ],
                        "title" => unslash($r[ "title" ]),
                    );
                }
            }
            $rs = doquery( "select * from category", $dblink);
            $categories = array();
            if( numrows( $rs ) > 0 ) {
                while( $r = dofetch( $rs ) ) {
                    $categories[] = array(
                        "id" => (int)$r[ "id" ],
                        "title" => unslash($r[ "title" ]),
                    );
                }
            }
            $rs = doquery( "select distinct(approval_year) from schemes where status=1 and approval_year > 0 order by approval_year desc", $dblink );
			$years = array();
			if( numrows( $rs ) > 0 ) {
				while( $r = dofetch( $rs ) ) {
					$years[] = array(
						"approval_year" => (int)$r[ "approval_year" ]
					);
				}
			}
            $response = [
                "schemes" => $schemes,
                "talukas" => $talukas,
                "categories" => $categories,
                "sectors" => $sectors,
                "years" => $years,
            ];
        break;
    }
    echo json_encode( $response );
    die;
}
