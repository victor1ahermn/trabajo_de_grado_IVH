prompt --application/shared_components/logic/application_settings
begin
--   Manifest
--     APPLICATION SETTINGS: 100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.13'
,p_default_workspace_id=>8678148786708790
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'WKSP_THESISWS'
);
wwv_flow_imp_shared.create_app_setting(
 p_id=>wwv_flow_imp.id(9281363411958972)
,p_name=>'API_BASE_URL'
,p_value=>'https://tesis-api-production-8a73.up.railway.app'
,p_is_required=>'N'
,p_version_scn=>21738170974
);
wwv_flow_imp_shared.create_app_setting(
 p_id=>wwv_flow_imp.id(9281599871963388)
,p_name=>'API_ANALYZE_PATH'
,p_value=>'/analyze'
,p_is_required=>'N'
,p_version_scn=>21738184544
);
wwv_flow_imp_shared.create_app_setting(
 p_id=>wwv_flow_imp.id(9511871552009158)
,p_name=>'API_FEEDBACK_PATH'
,p_value=>'/feedback'
,p_is_required=>'N'
,p_version_scn=>21750921450
);
wwv_flow_imp.component_end;
end;
/
