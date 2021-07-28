<?php
if(!defined("APP_START")) die("No Direct Access");
if(isset($_REQUEST["action"])){
    $response = array();
    switch($_REQUEST["action"]){
        case 'get_date':
            $response = date_convert( date( "Y-m-d" ) );
        break;
        case "get_categories":
			$rs = doquery( "select * from category where status=1 order by title", $dblink );
			$categories = array();
			if( numrows( $rs ) > 0 ) {
				while( $r = dofetch( $rs ) ) {
					$categories[] = array(
						"id" => $r[ "id" ],
						"title" => unslash($r[ "title" ])
					);
				}
			}
			$response = $categories;
		break;
        case "get_schemes":
            $sql = "select %s from schemes a where status=1 and adp_number like '%".$_REQUEST["search"]."%' order by ts desc";
            $rs = show_page( $rows, $pageNum, str_replace("%s", "a.*", $sql));
            $schemes = array();
            $total = dofetch(doquery( str_replace("%s", "count(*) as total", $sql), $dblink ));
            if( numrows( $rs ) > 0 ) {
                while( $r = dofetch( $rs ) ) {
                    $schemes[] = array(
                        "id" => $r[ "id" ],
                        "sector_id" => (int)$r[ "sector_id" ],
                        "taluka_id" => (int)$r[ "taluka_id" ],
                        "category_id" => (int)$r[ "category_id" ],
                        "adp_number" => unslash($r[ "adp_number" ]),
                        "project_description" => unslash($r[ "project_description" ]),
                        "completion_date" => date_convert($r[ "completion_date" ]),
                        "approved_cost" => $r[ "approved_cost" ],
                        "through_forward" => $r[ "through_forward" ],
                        "original_budget" => $r[ "original_budget" ],
                        "final_budget" => $r[ "final_budget" ],
                        "progress_release" => $r[ "progress_release" ],
                        "progress_expenditure" => $r[ "progress_expenditure" ],
                        "sector" => get_field($r[ "sector_id" ], "sector", "title"),
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
        case "add_scheme":
            $schemes = json_decode($_POST["schemes"]);
            if( !empty( $schemes->adp_number ) ) {
                if( !empty( $schemes->id ) ) {
                    doquery("update schemes set sector_id = '".slash($schemes->sector_id)."', taluka_id = '".slash($schemes->taluka_id)."', category_id = '".slash($schemes->category_id)."', adp_number = '".slash($schemes->adp_number)."', project_description = '".slash($schemes->project_description)."', completion_date = '".date_dbconvert($schemes->completion_date)."', approved_cost = '".slash($schemes->approved_cost)."', through_forward = '".slash($schemes->through_forward)."', original_budget = '".slash($schemes->original_budget)."', final_budget = '".slash($schemes->final_budget)."', progress_release = '".slash($schemes->progress_release)."', progress_expenditure = '".slash($schemes->progress_expenditure)."' where id = '".$schemes->id."'", $dblink);
                }
                else{
                    doquery("insert into schemes(sector_id, taluka_id, category_id, adp_number, project_description, completion_date, approved_cost, through_forward, original_budget, final_budget, progress_release, progress_expenditure) values('".slash($schemes->sector_id)."', '".slash($schemes->taluka_id)."', '".slash($schemes->category_id)."', '".slash($schemes->adp_number)."', '".slash($schemes->project_description)."', '".date_dbconvert($schemes->completion_date)."', '".slash($schemes->approved_cost)."', '".slash($schemes->through_forward)."', '".slash($schemes->original_budget)."', '".slash($schemes->final_budget)."', '".slash($schemes->progress_release)."', '".slash($schemes->progress_expenditure)."')", $dblink);
                    $id = inserted_id();
                    $r = dofetch(doquery("select * from schemes where id ='".$id."'", $dblink));
                    $schemes = array(
                        "id" => $r[ "id" ],
                        "sector_id" => $r[ "sector_id" ],
                        "taluka_id" => $r[ "taluka_id" ],
                        "category_id" => $r[ "category_id" ],
                        "adp_number" => unslash($r[ "adp_number" ]),
                        "project_description" => unslash($r[ "project_description" ]),
                        "completion_date" => date_convert($r[ "completion_date" ]),
                    );
                }
                $response = array(
                    "status" => 1,
                    "schemes" => $schemes
                );
            }
            else{
                $response = array(
                    "status" => 0,
                    "message" => "Enter ADP Number"
                );
            }
        break;
        case "delete_scheme":
            doquery( "delete from schemes where id = '".$_POST[ "id" ]."'", $dblink );
        break;
    }
    echo json_encode( $response );
    die;
}
