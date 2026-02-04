prompt --application/shared_components/user_interface/lovs/app_users_password_hash
begin
--   Manifest
--     APP_USERS.PASSWORD_HASH
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.13'
,p_default_workspace_id=>8678148786708790
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'WKSP_THESISWS'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(9546222445646759)
,p_lov_name=>'APP_USERS.PASSWORD_HASH'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'APP_USERS'
,p_return_column_name=>'USERNAME'
,p_display_column_name=>'PASSWORD_HASH'
,p_default_sort_column_name=>'PASSWORD_HASH'
,p_default_sort_direction=>'ASC'
,p_version_scn=>21752139952
);
wwv_flow_imp.component_end;
end;
/
