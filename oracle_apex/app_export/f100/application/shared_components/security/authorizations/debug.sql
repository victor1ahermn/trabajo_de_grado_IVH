prompt --application/shared_components/security/authorizations/debug
begin
--   Manifest
--     SECURITY SCHEME: DEBUG
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.13'
,p_default_workspace_id=>8678148786708790
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'WKSP_THESISWS'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(9668236643377225)
,p_name=>'DEBUG'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_role app_users.user_role%type;',
'begin',
'  select user_role',
'    into l_role',
'    from app_users',
'   where upper(username) = upper(:app_user);',
'',
'  return l_role = ''DEBUG'';',
'exception',
'  when no_data_found then',
'    return false;',
'end;',
''))
,p_error_message=>'Exclusivo para DEBUG'
,p_version_scn=>21766764600
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
