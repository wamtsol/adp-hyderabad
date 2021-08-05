<?php
if(!defined("APP_START")) die("No Direct Access");
if(isset($_REQUEST["action"])){
    $response = array();
    switch($_REQUEST["action"]){
        case 'get_date':
            $response = date_convert( date( "Y-m-d" ) );
        break;
		case "get_schemes":
			$category = $_REQUEST["category"];
			$sector = $_REQUEST["sector"];
			$taluka = $_REQUEST["taluka"];
			$extra="";
			if(!empty($category)){
            	$extra.=" and category_id = '".$category."'";
			}
			if(!empty($sector)){
            	$extra.=" and sector_id = '".$sector."'";
			}
			if(!empty($taluka)){
            	$extra.=" and taluka_id = '".$taluka."'";
			}
			$sql = "select %s from schemes a where 1 ".$extra." and status=1 and adp_number like '%".$_REQUEST["search"]."%' and approval_year like '%".$_REQUEST["year"]."%' order by ts desc";
			$rs = show_page( $rows, $pageNum, str_replace("%s", "a.*", $sql));
            $schemes = array();
            $total = dofetch(doquery( str_replace("%s", "count(*) as total", $sql), $dblink ));
            if( numrows( $rs ) > 0 ) {
                while( $r = dofetch( $rs ) ) {
                    $schemes[] = array(
                        "id" => $r[ "id" ],
						"sector_id" => (int)$r[ "sector_id" ],
						"sub_sector_id" => (int)$r[ "sub_sector_id" ],
                        "taluka_id" => (int)$r[ "taluka_id" ],
						"category_id" => (int)$r[ "category_id" ],
						"approval_year" => (int)$r[ "approval_year" ],
                        "adp_number" => unslash($r[ "adp_number" ]),
                        "project_description" => unslash($r[ "project_description" ]),
                        "completion_date" => date_convert($r[ "completion_date" ]),
                        "estim_cost" => $r[ "estim_cost" ],
                        "actual_expenditure" => $r[ "actual_expenditure" ],
                        "estim_expenditure" => $r[ "estim_expenditure" ],
                        "capital" => $r[ "capital" ],
                        "electric" => $r[ "electric" ],
                        "rev" => $r[ "rev" ],
						"sector" => get_field($r[ "sector_id" ], "sector", "title"),
						"subsector" => get_field($r[ "sub_sector_id" ], "sector", "title"),
                        "taluka" => get_field($r[ "taluka_id" ], "taluka", "title"),
                        "category" => get_field($r[ "category_id" ], "category", "title"),
                    );
                }
            }
            $response = [
                "data" => $schemes,
                "total" => $total["total"],
            ];
        break;
    }
    echo json_encode( $response );
    die;
}
