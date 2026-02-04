prompt --application/shared_components/user_interface/lovs/systems_system_name
begin
--   Manifest
--     SYSTEMS.SYSTEM_NAME
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
 p_id=>wwv_flow_imp.id(8833042480825447)
,p_lov_name=>'SYSTEMS.SYSTEM_NAME'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SYSTEMS'
,p_return_column_name=>'SYSTEM_ID'
,p_display_column_name=>'SYSTEM_NAME'
,p_default_sort_column_name=>'SYSTEM_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>21620673718
);
wwv_flow_imp.component_end;
end;
/
