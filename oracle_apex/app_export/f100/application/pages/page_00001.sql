prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.13'
,p_default_workspace_id=>8678148786708790
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'WKSP_THESISWS'
);
wwv_flow_imp_page.create_page(
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'Reflexa'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* estilo del wrapper */',
'.reflexa-center-wrapper {',
'  min-height: calc(100vh - 120px);',
'  display: flex;',
'  align-items: center;',
'  justify-content: center;',
'  padding: 32px 16px;',
'}',
'',
'/* banner */',
'.reflexa-banner {',
'  width: min(1100px, 100%);',
'  padding: 48px 56px;',
'  border-radius: 26px;',
'  position: relative;',
'  overflow: hidden;',
'',
'  /* degrade del fondo */',
'  background: linear-gradient(',
'    135deg,',
'    #0b3c8c 0%,     ',
'    #0f766e 45%,    ',
'    #c2410c 100%    ',
'  );',
'',
'  box-shadow: 0 25px 60px rgba(0, 0, 0, 0.35);',
'  border: 1px solid rgba(255, 255, 255, 0.18);',
'}',
'',
'/* Overlay para leer mejor */',
'.reflexa-banner::after {',
'  content: "";',
'  position: absolute;',
'  inset: 0;',
'  background: rgba(0, 0, 0, 0.25);',
'  pointer-events: none;',
'}',
'',
'/* banner contenido */',
'.reflexa-banner > * {',
'  position: relative;',
'  z-index: 1;',
'}',
'',
unistr('/* fomato t\00EDtulo */'),
'.reflexa-title {',
'  text-align: center;',
'  font-size: 42px;',
'  font-weight: 900;',
'  letter-spacing: -0.5px;',
'  margin-bottom: 32px;',
'  color: #ffffff;',
'}',
'',
'.reflexa-title strong {',
'  color: #e0f2fe; ',
'}',
'',
'/* formato del contenido */',
'.reflexa-content p {',
'  font-size: 16px;',
'  line-height: 1.65;',
'  color: rgba(255, 255, 255, 0.92);',
'  margin-bottom: 18px;',
'  max-width: 900px;',
'}',
'',
'/* estilo Negritas */',
'.reflexa-content strong {',
'  color: #ffffff;',
'  font-weight: 700;',
'}',
'',
unistr('/* estilo It\00E1licas */'),
'.reflexa-content em {',
'  color: #e0f2fe;',
'  font-style: italic;',
'}',
'',
'/* lista de bullets */',
'.reflexa-content p::before {',
unistr('  content: "\2022 ";'),
'  color: #7dd3fc; ',
'  font-weight: 900;',
'  margin-right: 4px;',
'}',
'',
unistr('/* Omitir bullet primer p\00E1rrafo */'),
'.reflexa-content p:first-of-type::before {',
'  content: "";',
'}',
'',
'/* Hacerlo Respinsive */',
'@media (max-width: 768px) {',
'  .reflexa-banner {',
'    padding: 36px 28px;',
'  }',
'',
'  .reflexa-title {',
'    font-size: 32px;',
'  }',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8698121856764436)
,p_plug_name=>'Reflexa'
,p_title=>'REFLEXA'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2674017834225413037
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_plug_query_num_rows=>15
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9518801898266543)
,p_plug_name=>'Banner'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_08'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="reflexa-center-wrapper">',
'    <div class="reflexa-banner">',
'        <div class="reflexa-banner">',
'',
'    <h2 class="reflexa-title">Bienvenido a <strong>REFLEXA</strong></h2>',
'',
'    <!-- CONTENIDO PARA ESTUDIANTES -->',
'    <div class="reflexa-content" id="reflexa-student" style="display:none;">',
'        <p>',
unistr('        <strong>REFLEXA</strong> Reflexa es una plataforma donde podr\00E1s realizar la'),
'        <strong>Actividad No. 1</strong> del curso de',
unistr('        <em>Introducci\00F3n a la Programaci\00F3n</em> y recibir'),
unistr('        <strong>retroalimentaci\00F3n al instante</strong>'),
'        sobre tus respuestas.',
'        </p>',
'',
'        <p>',
unistr('        En el <strong>Centro de Actividades</strong> encontrar\00E1s el formulario de respuesta'),
unistr('        donde desarrollar\00E1s la actividad. Una vez enviada, podr\00E1s visualizar all\00ED mismo'),
unistr('        la retroalimentaci\00F3n generada para cada secci\00F3n.'),
'        </p>',
'',
'        <p>',
unistr('        En el <strong>Centro de Errores y Feedback</strong> podr\00E1s consultar el historial de errores'),
unistr('        identificados y la retroalimentaci\00F3n que se te ha brindado.'),
'        </p>',
'',
'        <p>',
unistr('        En el <strong>Centro de Envios</strong> podr\00E1s consultar el historial de respuestas enviadas.'),
'        </p>',
'',
'    </div>',
'',
'    <!-- CONTENIDO PARA PROFESORES -->',
'    <div class="reflexa-content" id="reflexa-professor" style="display:none;">',
'        <p>',
unistr('        <strong>REFLEXA</strong> es una plataforma donde podr\00E1s ver las respuestas de tus estudiantes'),
'        para la <strong>Actividad No. 1</strong> del curso de',
unistr('        <em>Introducci\00F3n a la Programaci\00F3n</em>, los errores que han cometido '),
unistr('        y la retroalimentaci\00F3n que se les fue brindada.'),
'        </p>',
'',
'        <p>',
unistr('        En el <strong>Centro de Errores y Feedback</strong> podr\00E1s consultar el log de errores y feedback para cada estudiante.'),
'        </p>',
'',
'        <p>',
unistr('        En el <strong>Centro de Envios</strong> podr\00E1s visualizar todas las respuestas enviadas por tus estudiantes.'),
'        </p>',
'',
'        <p>',
unistr('        En el <strong>Centro de Tareas</strong> podr\00E1s cargar el archivo de la actividad y'),
unistr('        asignar el semestre acad\00E9mico al cual aplica.'),
'        </p>',
'    </div>',
'',
'    <!-- CONTENIDO PARA DEBUG -->',
'    <div class="reflexa-content" id="reflexa-debug" style="display:none;">',
'        <p>',
'        <strong>Bienvenido.</strong>',
'        </p>',
'        <p>',
unistr('        Est\00E1s visualizando la aplicaci\00F3n de <strong>REFLEXA</strong> en'),
'        <strong>modo debug</strong>.',
'        </p>',
'    </div>',
'',
'    </div>',
'',
'    <script>',
'    (function () {',
'        var role = ''&P1_APP_USER_ROLE.'';',
'',
'        if (role === ''STUDENT'') {',
'        document.getElementById(''reflexa-student'').style.display = ''block'';',
'        } else if (role === ''PROFESSOR'') {',
'        document.getElementById(''reflexa-professor'').style.display = ''block'';',
'        } else if (role === ''DEBUG'') {',
'        document.getElementById(''reflexa-debug'').style.display = ''block'';',
'        }',
'    })();',
'    </script>',
'',
'  </div>',
'</div>',
'',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9519320461266548)
,p_name=>'P1_APP_USER_ROLE'
,p_item_sequence=>40
,p_item_display_point=>'REGION_POSITION_08'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9519217348266547)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  select user_role',
'    into :P1_APP_USER_ROLE',
'    from app_users',
'   where upper(username) = upper(:APP_USER);',
'exception',
'  when no_data_found then',
'    :P1_APP_USER_ROLE := ''UNKNOWN'';',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>9519217348266547
);
wwv_flow_imp.component_end;
end;
/
