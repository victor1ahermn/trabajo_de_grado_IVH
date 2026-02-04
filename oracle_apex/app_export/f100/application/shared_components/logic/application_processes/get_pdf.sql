prompt --application/shared_components/logic/application_processes/get_pdf
begin
--   Manifest
--     APPLICATION PROCESS: GET_PDF
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.13'
,p_default_workspace_id=>8678148786708790
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'WKSP_THESISWS'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(8736948821014343)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_PDF'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_blob     blob;',
'  l_filename varchar2(255);',
'  l_mime     varchar2(100);',
'begin',
'  select document_blob, document_filename, document_mimetype',
'    into l_blob, l_filename, l_mime',
'    from assignments',
'   where assignment_id = to_number(apex_application.g_x01);',
'',
'  owa_util.mime_header(l_mime, false);',
'  htp.p(''Content-Disposition: inline; filename="'' || l_filename || ''"'');',
'  owa_util.http_header_close;',
'',
'  wpg_docload.download_file(l_blob);',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>21614576597
);
wwv_flow_imp.component_end;
end;
/
