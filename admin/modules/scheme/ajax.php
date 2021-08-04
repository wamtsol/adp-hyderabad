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
						"id" => (int)$r[ "id" ],
						"title" => unslash($r[ "title" ])
					);
				}
			}
			$response = $categories;
        break;
        case "get_sector":
			$rs = doquery( "select * from sector where status=1 order by title", $dblink );
			$sectors = array();
			if( numrows( $rs ) > 0 ) {
				while( $r = dofetch( $rs ) ) {
					$sectors[] = array(
						"id" => (int)$r[ "id" ],
						"title" => unslash($r[ "title" ])
					);
				}
			}
			$response = $sectors;
		break;
		case "get_subsector":
			$rs = doquery( "select * from sector where status=1 and parent_id !=0 order by title", $dblink );
			$subsectors = array();
			if( numrows( $rs ) > 0 ) {
				while( $r = dofetch( $rs ) ) {
					$subsectors[] = array(
						"id" => (int)$r[ "id" ],
						"parent_id" => (int)$r[ "parent_id" ],
						"title" => unslash($r[ "title" ])
					);
				}
			}
			$response = $subsectors;
        break;
        case "get_taluka":
			$rs = doquery( "select * from taluka where status=1 order by title", $dblink );
			$taluka = array();
			if( numrows( $rs ) > 0 ) {
				while( $r = dofetch( $rs ) ) {
					$taluka[] = array(
						"id" => (int)$r[ "id" ],
						"title" => unslash($r[ "title" ])
					);
				}
			}
			$response = $taluka;
		break;
		case "get_years":
			$rs = doquery( "select distinct(approval_year) from schemes where status=1", $dblink );
			$years = array();
			if( numrows( $rs ) > 0 ) {
				while( $r = dofetch( $rs ) ) {
					$years[] = array(
						//"id" => (int)$r[ "id" ],
						"approval_year" => $r[ "approval_year" ]
					);
				}
			}
			$response = $years;
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
        case "add_scheme":
            $schemes = json_decode($_POST["schemes"]);
            if( !empty( $schemes->adp_number ) ) {
                if( !empty( $schemes->id ) ) {
                    doquery("update schemes set sector_id = '".slash($schemes->sector_id)."', sub_sector_id = '".slash($schemes->sub_sector_id)."', taluka_id = '".slash($schemes->taluka_id)."', category_id = '".slash($schemes->category_id)."', adp_number = '".slash($schemes->adp_number)."', approval_year = '".slash($schemes->approval_year)."', project_description = '".slash($schemes->project_description)."', completion_date = '".date_dbconvert($schemes->completion_date)."', estim_cost = '".slash($schemes->estim_cost)."', actual_expenditure = '".slash($schemes->actual_expenditure)."', estim_expenditure = '".slash($schemes->estim_expenditure)."', capital = '".slash($schemes->capital)."', electric = '".slash($schemes->electric)."', rev = '".slash($schemes->rev)."' where id = '".$schemes->id."'", $dblink);
                }
                else{
                    doquery("insert into schemes(sector_id, sub_sector_id, taluka_id, category_id, adp_number, approval_year, project_description, completion_date, estim_cost, actual_expenditure, estim_expenditure, capital, electric, rev) values('".slash($schemes->sector_id)."', '".slash($schemes->sub_sector_id)."', '".slash($schemes->taluka_id)."', '".slash($schemes->category_id)."', '".slash($schemes->adp_number)."', '".slash($schemes->approval_year)."', '".slash($schemes->project_description)."', '".date_dbconvert($schemes->completion_date)."', '".slash($schemes->estim_cost)."', '".slash($schemes->actual_expenditure)."', '".slash($schemes->estim_expenditure)."', '".slash($schemes->capital)."', '".slash($schemes->electric)."', '".slash($schemes->rev)."')", $dblink);
                    $id = inserted_id();
                    $r = dofetch(doquery("select * from schemes where id ='".$id."'", $dblink));
                    $schemes = array(
                        "id" => $r[ "id" ],
						"sector_id" => $r[ "sector_id" ],
						"sub_sector_id" => $r[ "sub_sector_id" ],
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
        case "save_category":
			$box_err = array();
			$category = json_decode( $_POST[ "category" ] );
			if( empty( $category->title ) ) {
				$box_err[] = "Fields with * are mandatory";
			}
			if( count( $box_err ) == 0 ) {
				doquery( "insert into category (title) VALUES ('".slash($category->title)."')", $dblink);
				$id = inserted_id();
				$response = array(
					"status" => 1,
					"category" => array(
						"id" => $id,
						"title" => $category->title,
					)
				);
			}
			else {
				$response = array(
					"status" => 0,
					"error" => $box_err
				);
			}
        break;
        case "save_sector":
			$box_err = array();
			$sector = json_decode( $_POST[ "sector" ] );
			if( empty( $sector->title ) ) {
				$box_err[] = "Fields with * are mandatory";
			}
			if( count( $box_err ) == 0 ) {
				doquery( "insert into sector (title) VALUES ('".slash($sector->title)."')", $dblink);
				$id = inserted_id();
				$response = array(
					"status" => 1,
					"sector" => array(
						"id" => $id,
						"title" => $sector->title,
					)
				);
			}
			else {
				$response = array(
					"status" => 0,
					"error" => $box_err
				);
			}
		break;
		case "save_subsector":
			$box_err = array();
			$subsector = json_decode( $_POST[ "subsector" ] );
			$parent_id = $_POST[ "parent_id" ];
			if( empty( $subsector->title ) ) {
				$box_err[] = "Fields with * are mandatory";
			}
			if( count( $box_err ) == 0 ) {
				doquery( "insert into sector (parent_id, title) VALUES ($parent_id,'".slash($subsector->title)."')", $dblink);
				$id = inserted_id();
				$response = array(
					"status" => 1,
					"subsector" => array(
						"id" => $id,
						"parent_id" => $parent_id,
						"title" => $subsector->title,
					)
				);
			}
			else {
				$response = array(
					"status" => 0,
					"error" => $box_err
				);
			}
        break;
        case "save_taluka":
			$box_err = array();
			$taluka = json_decode( $_POST[ "taluka" ] );
			if( empty( $taluka->title ) ) {
				$box_err[] = "Fields with * are mandatory";
			}
			if( count( $box_err ) == 0 ) {
				doquery( "insert into taluka (title) VALUES ('".slash($taluka->title)."')", $dblink);
				$id = inserted_id();
				$response = array(
					"status" => 1,
					"taluka" => array(
						"id" => $id,
						"title" => $taluka->title,
					)
				);
			}
			else {
				$response = array(
					"status" => 0,
					"error" => $box_err
				);
			}
		break;
    }
    echo json_encode( $response );
    die;
}
