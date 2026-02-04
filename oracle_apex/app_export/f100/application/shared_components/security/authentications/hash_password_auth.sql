prompt --application/shared_components/security/authentications/hash_password_auth
begin
--   Manifest
--     AUTHENTICATION: hash_password_auth
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.13'
,p_default_workspace_id=>8678148786708790
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'WKSP_THESISWS'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(8713338558171533)
,p_name=>'hash_password_auth'
,p_scheme_type=>'NATIVE_CUSTOM'
,p_attribute_03=>'auth_user'
,p_attribute_05=>'N'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>21591999992
);
wwv_flow_imp.component_end;
end;
/
