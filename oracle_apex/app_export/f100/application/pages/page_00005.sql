prompt --application/pages/page_00005
begin
--   Manifest
--     PAGE: 00005
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
 p_id=>5
,p_name=>'Centro de Actividades'
,p_alias=>'FORMULARIOS'
,p_step_title=>'Centro de Actividades'
,p_allow_duplicate_submissions=>'N'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Scroll Results Only in Side Column */',
'.t-Body-side {',
'    display: flex;',
'    flex-direction: column;',
'    overflow: hidden;',
'}',
'.search-results {',
'    flex: 1;',
'    overflow: auto;',
'}',
'/* Format Search Region */',
'.search-region {',
'    border-bottom: 1px solid rgba(0,0,0,.1);',
'    flex-shrink: 0;',
'}',
'',
'/* Wrapper */',
'#feedback_list .fb-wrap{',
'  background: #fff;',
'  border: 1px solid #eee;',
'  border-radius: 10px;',
'  padding: 14px;',
'}',
'',
'/* Header */',
'#feedback_list .fb-header{',
'  display:flex;',
'  align-items:flex-end;',
'  justify-content:space-between;',
'  padding: 6px 6px 14px 6px;',
'  border-bottom: 1px solid #f0f0f0;',
'  margin-bottom: 10px;',
'}',
'#feedback_list .fb-title{',
'  font-size: 18px;',
'  font-weight: 700;',
'}',
'#feedback_list .fb-meta{',
'  font-size: 12px;',
'  color: #666;',
'}',
'',
'/* List items */',
'#feedback_list .fb-item{',
'  padding: 14px 6px;',
'  border-bottom: 1px solid #f2f2f2;',
'}',
'#feedback_list .fb-item:last-child{',
'  border-bottom: none;',
'}',
'#feedback_list .fb-tags{',
'  margin-bottom: 8px;',
'}',
'',
'/* Pills */',
'#feedback_list .fb-tag{',
'  display:inline-block;',
'  padding: 3px 10px;',
'  border-radius: 999px;',
'  font-size: 12px;',
'  font-weight: 700;',
'  margin-right: 6px;',
'  line-height: 18px;',
'}',
'',
'#feedback_list .fb-tag-def{ background:#2ecc71; color:#fff; } /* verde */',
'#feedback_list .fb-tag-inc{ background:#e74c3c; color:#fff; } /* rojo */',
'#feedback_list .fb-tag-sub{ background:#8e44ad; color:#fff; } /* morado */',
'#feedback_list .fb-tag-oth{ background:#7f8c8d; color:#fff; } /* gris */',
'',
'/* Title + body */',
'#feedback_list .fb-row-title b{',
'  font-size: 14px;',
'}',
'#feedback_list .fb-text{',
'  margin-top: 6px;',
'  color:#333;',
'  font-size: 13px;',
'  line-height: 1.35;',
'}',
'',
'/* Empty state */',
'#feedback_list .fb-empty{',
'  padding: 12px;',
'  color:#555;',
'}',
''))
,p_step_template=>2526643373347724467
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'25'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8722774801580734)
,p_plug_name=>'PDF Viewer'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="width: 100%; height: 600px;">',
'  <iframe',
'    src="f?p=&APP_ID.:0:&SESSION.:APPLICATION_PROCESS=GET_PDF:::X01:&P5_ASSIGNMENT_ID."',
'    style="border:none; width:100%; height:100%;"',
'    type="application/pdf">',
'  </iframe>',
'</div>',
''))
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P5_SYSTEM_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8723010911580737)
,p_plug_name=>'Formulario de Respuesta'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select RESPONSE_ID,',
'       USERNAME,',
'       SYSTEM_ID,',
'       PURPOSE_TEXT,',
'       COMPONENTS_TEXT,',
'       INTERACTIONS_TEXT,',
'       VARIABLES_TEXT,',
'       CONSTANTS_TEXT,',
'       CREATED_AT',
'  from RESPONSES'))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P5_SYSTEM_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8762948246110963)
,p_plug_name=>'formularios'
,p_region_template_options=>'#DEFAULT#:t-HeroRegion--hideIcon'
,p_plug_template=>2674017834225413037
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8764130845110964)
,p_plug_name=>'Search'
,p_region_css_classes=>'search-region padding-md'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(8764977622110966)
,p_name=>'Master Records'
,p_template=>3371237801798025892
,p_display_sequence=>20
,p_region_css_classes=>'search-results'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'t-MediaList--showDesc:t-MediaList--stack'
,p_display_point=>'REGION_POSITION_02'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "SYSTEM_ID",',
'    null LINK_CLASS,',
'    apex_page.get_url(p_items => ''P5_SYSTEM_ID'', p_values => "SYSTEM_ID") LINK,',
'    null ICON_CLASS,',
'    null LINK_ATTR,',
'    null ICON_COLOR_CLASS,',
'    case when coalesce(:P5_SYSTEM_ID,''0'') = "SYSTEM_ID"',
'      then ''is-active'' ',
'      else '' ''',
'    end LIST_CLASS,',
'    (substr("SYSTEM_NAME", 1, 50)||( case when length("SYSTEM_NAME") > 50 then ''...'' else '''' end )) LIST_TITLE,',
'    '''' LIST_TEXT,',
'    null LIST_BADGE',
'from "SYSTEMS" x',
'where (:P5_SEARCH is null',
'        or upper(x."SYSTEM_NAME") like ''%''||upper(:P5_SEARCH)||''%''',
'        or upper(x."SYSTEM_NAME") like ''%''||upper(:P5_SEARCH)||''%''',
'    ) AND x."ASSIGNMENT_ID" = (',
'        select a.assignment_id',
'          from assignments a',
'          join app_users u',
'            on u.semester = a.semester',
'         where upper(u.username) = upper(:app_user)',
'      )',
'order by x."ASSIGNMENT_ID"'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P5_SEARCH'
,p_lazy_loading=>false
,p_query_row_template=>2093604263195414824
,p_query_num_rows=>1000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'<div class="u-tC">No data found.</div>'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8724262870580749)
,p_query_column_id=>1
,p_column_alias=>'SYSTEM_ID'
,p_column_display_sequence=>20
,p_column_heading=>'System Id'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8766043175110972)
,p_query_column_id=>2
,p_column_alias=>'LINK_CLASS'
,p_column_display_sequence=>2
,p_column_heading=>'LINK_CLASS'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8766445058110972)
,p_query_column_id=>3
,p_column_alias=>'LINK'
,p_column_display_sequence=>3
,p_column_heading=>'LINK'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8766845804110972)
,p_query_column_id=>4
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>4
,p_column_heading=>'ICON_CLASS'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8767293721110972)
,p_query_column_id=>5
,p_column_alias=>'LINK_ATTR'
,p_column_display_sequence=>5
,p_column_heading=>'LINK_ATTR'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8767672881110972)
,p_query_column_id=>6
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>6
,p_column_heading=>'ICON_COLOR_CLASS'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8768067676110973)
,p_query_column_id=>7
,p_column_alias=>'LIST_CLASS'
,p_column_display_sequence=>7
,p_column_heading=>'LIST_CLASS'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8768416697110973)
,p_query_column_id=>8
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>8
,p_column_heading=>'LIST_TITLE'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8768834076110973)
,p_query_column_id=>9
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>9
,p_column_heading=>'LIST_TEXT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8769272550110973)
,p_query_column_id=>10
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>10
,p_column_heading=>'LIST_BADGE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8796947524111093)
,p_plug_name=>'No Record Selected'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>70
,p_location=>null
,p_plug_source=>'No Record Selected'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P5_SYSTEM_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8830090322760749)
,p_plug_name=>'Feedback log'
,p_region_name=>'feedback_list'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_html        clob;',
'  l_ts          varchar2(200);',
'  l_has_rows    boolean := false;',
'',
'  function esc(p_txt varchar2) return varchar2 is',
'  begin',
'    return apex_escape.html(nvl(p_txt,''''));',
'  end;',
'',
'  function tag(p_class varchar2, p_text varchar2) return varchar2 is',
'  begin',
'    return ''<span class="fb-tag ''||p_class||''">''||esc(p_text)||''</span>'';',
'  end;',
'',
'begin',
'  if :P5_LAST_RESPONSE_ID is null then',
unistr('  return ''<div class="fb-empty">A\00FAn no hay retroalimentaci\00F3n para mostrar.</div>'';'),
'end if;',
'',
'-- Validamos que la respuesta es del usuario actual',
'declare',
'  l_count pls_integer;',
'begin',
'  select count(*)',
'    into l_count',
'    from responses',
'   where response_id = :P5_LAST_RESPONSE_ID',
'     and username    = :APP_USER;',
'',
'  if l_count = 0 then',
unistr('    return ''<div class="fb-empty">A\00FAn no hay retroalimentaci\00F3n para mostrar.</div>'';'),
'  end if;',
'end;',
'',
'',
'  -- Fecha/hora del feedback',
'  select to_char(',
'         cast( (r.created_at at time zone ''America/Bogota'') as timestamp ),',
'         ''DD-MON-YYYY HH:MI PM''',
'       )',
'  into l_ts',
'  from responses r',
' where r.response_id = :P5_LAST_RESPONSE_ID;',
'',
'',
'  l_html := ''''',
'    || ''<div class="fb-wrap">''',
'    || ''  <div class="fb-header">''',
unistr('    || ''    <div class="fb-title">Retroalimentaci\00F3n</div>'''),
'    || ''    <div class="fb-meta">Enviado: ''||esc(l_ts)||''</div>''',
'    || ''  </div>''',
'    || ''  <div class="fb-list">'';',
'',
'  for rec in (',
'    select',
'      rc.category_name,',
'      et.error_name as error_type,',
'      re.suberror_code,',
'      re.student_value,',
'      f.feedback_text',
'    from feedback f',
'    join response_errors re on re.error_id = f.error_id',
'    join response_categories rc on rc.category_id = re.category_id',
'    join error_types et on et.error_type_id = re.error_type_id',
'    where re.response_id = :P5_LAST_RESPONSE_ID',
'    order by f.feedback_id',
'  ) loop',
'    l_has_rows := true;',
'',
'    l_html := l_html',
'      || ''<div class="fb-item">''',
'      || ''  <div class="fb-tags">'';',
'',
'    if upper(rec.error_type) = ''DEFICIENT_RESPONSE'' then',
'      l_html := l_html || tag(''fb-tag-def'', ''DEFICIENT_RESPONSE'');',
'    elsif upper(rec.error_type) = ''INCORRECT_ABSTRACTION'' then',
'      l_html := l_html || tag(''fb-tag-inc'', ''INCORRECT_ABSTRACTION'');',
'',
'      if rec.suberror_code is not null then',
'        l_html := l_html || tag(''fb-tag-sub'', rec.suberror_code);',
'      end if;',
'    else',
'      l_html := l_html || tag(''fb-tag-oth'', rec.error_type);',
'    end if;',
'',
'    l_html := l_html',
'      || ''  </div>'' -- fb-tags',
'      || ''  <div class="fb-main">''',
'      || ''    <div class="fb-row-title"><b>''||esc(rec.category_name)||'': ''||esc(rec.student_value)||''</b></div>''',
'      || ''    <div class="fb-text">''||esc(rec.feedback_text)||''</div>''',
'      || ''  </div>''',
'      || ''</div>'';',
'  end loop;',
'',
'  l_html := l_html || ''  </div>''; -- fb-list',
'',
'  if not l_has_rows then',
unistr('    l_html := l_html || ''<div class="fb-empty">\2705 Sin errores detectados (no hay retroalimentaci\00F3n).</div>'';'),
'  end if;',
'',
'  l_html := l_html || ''</div>''; -- fb-wrap',
'',
'  return l_html;',
'',
'exception',
'  when no_data_found then',
unistr('    return ''<div class="fb-empty">No se encontr\00F3 la respuesta para mostrar (response_id=''||esc(to_char(:P5_LAST_RESPONSE_ID))||'').</div>'';'),
'end;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8724391648580750)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8723010911580737)
,p_button_name=>'ENVIAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enviar Respuesta'
,p_button_position=>'CREATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(8827348042760722)
,p_branch_action=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::P5_SYSTEM_ID:&P5_SYSTEM_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(8724391648580750)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8722833822580735)
,p_name=>'P5_ASSIGNMENT_ID'
,p_item_sequence=>80
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8723283652580739)
,p_name=>'P5_RESPONSE_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8723010911580737)
,p_item_source_plug_id=>wwv_flow_imp.id(8723010911580737)
,p_source=>'RESPONSE_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8723315439580740)
,p_name=>'P5_USERNAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8723010911580737)
,p_item_source_plug_id=>wwv_flow_imp.id(8723010911580737)
,p_source=>'USERNAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8723454277580741)
,p_name=>'P5_SYSTEM_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8723010911580737)
,p_item_source_plug_id=>wwv_flow_imp.id(8723010911580737)
,p_prompt=>'Nombre del sistema'
,p_source=>'SYSTEM_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select system_name d, system_id r',
'from systems',
'where assignment_id = (',
'  select a.assignment_id',
'  from assignments a',
'  join app_users u on u.semester = a.semester',
'  where upper(u.username) = upper(:app_user)',
')',
'order by system_name',
''))
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8723560523580742)
,p_name=>'P5_PURPOSE_TEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8723010911580737)
,p_item_source_plug_id=>wwv_flow_imp.id(8723010911580737)
,p_prompt=>unistr('Prop\00F3sito del sistema')
,p_source=>'PURPOSE_TEXT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_display_when=>'P5_USER_SEMESTER'
,p_display_when2=>'2020-2'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8723641873580743)
,p_name=>'P5_COMPONENTS_TEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8723010911580737)
,p_item_source_plug_id=>wwv_flow_imp.id(8723010911580737)
,p_prompt=>'Componentes'
,p_source=>'COMPONENTS_TEXT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8723762717580744)
,p_name=>'P5_INTERACTIONS_TEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8723010911580737)
,p_item_source_plug_id=>wwv_flow_imp.id(8723010911580737)
,p_prompt=>unistr('Interacci\00F3n entre los componentes')
,p_source=>'INTERACTIONS_TEXT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_display_when=>'P5_USER_SEMESTER'
,p_display_when2=>'2020-2'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8723800953580745)
,p_name=>'P5_VARIABLES_TEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8723010911580737)
,p_item_source_plug_id=>wwv_flow_imp.id(8723010911580737)
,p_prompt=>'Variables del sistema'
,p_source=>'VARIABLES_TEXT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8723960712580746)
,p_name=>'P5_CONSTANTS_TEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8723010911580737)
,p_item_source_plug_id=>wwv_flow_imp.id(8723010911580737)
,p_prompt=>'Constantes del sistema'
,p_source=>'CONSTANTS_TEXT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8724030221580747)
,p_name=>'P5_CREATED_AT'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8723010911580737)
,p_item_source_plug_id=>wwv_flow_imp.id(8723010911580737)
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_source=>'CREATED_AT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8764660047110966)
,p_name=>'P5_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8764130845110964)
,p_prompt=>'Search'
,p_placeholder=>'Search...'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT'
,p_field_template=>2040785906935475274
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large:t-Form-fieldContainer--postTextBlock'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8825428741760703)
,p_name=>'P5_LAST_RESPONSE_ID'
,p_item_sequence=>100
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8827187119760720)
,p_name=>'P5_API_RESPONSE_JSON'
,p_item_sequence=>120
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8827837044760727)
,p_name=>'P5_PREV_SYSTEM_ID'
,p_item_sequence=>130
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8829119763760740)
,p_name=>'P5_DEBUG_JSON'
,p_item_sequence=>40
,p_prompt=>'Debug Json'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_security_scheme=>wwv_flow_imp.id(9668236643377225)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8829528885760744)
,p_name=>'P5_FEEDBACK_RESPONSE_JSON'
,p_item_sequence=>140
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8829618598760745)
,p_name=>'P5_HAS_ERRORS'
,p_item_sequence=>110
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8829813743760747)
,p_name=>'P5_DEBUG_FEEDBACK'
,p_item_sequence=>50
,p_prompt=>'Debug Json'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_security_scheme=>wwv_flow_imp.id(9668236643377225)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9515443591266509)
,p_name=>'P5_USER_SEMESTER'
,p_item_sequence=>90
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8797818213111093)
,p_name=>'Perform Search'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.which === apex.jQuery.ui.keyCode.ENTER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8799601470111094)
,p_event_id=>wwv_flow_imp.id(8797818213111093)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8764977622110966)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8800182166111094)
,p_event_id=>wwv_flow_imp.id(8797818213111093)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CANCEL_EVENT'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8828154918760730)
,p_name=>'AUTO_SAVE_DRAFT'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_PURPOSE_TEXT,P5_COMPONENTS_TEXT,P5_INTERACTIONS_TEXT,P5_VARIABLES_TEXT,P5_CONSTANTS_TEXT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'input'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8828298851760731)
,p_event_id=>wwv_flow_imp.id(8828154918760730)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(function () {',
'  console.log("[DRAFT] evento disparado",',
'    "system=", $v("P5_SYSTEM_ID"),',
'    "purpose.len=", ($v("P5_PURPOSE_TEXT") || "").length',
'  );',
'',
'  if (!window._draftTimer) window._draftTimer = null;',
'  clearTimeout(window._draftTimer);',
'',
'  window._draftTimer = setTimeout(function () {',
unistr('    console.log("[DRAFT] llamando SAVE_DRAFT\2026");'),
'',
'    apex.server.process(',
'  "SAVE_DRAFT",',
'  { pageItems: "#P5_SYSTEM_ID,#P5_PURPOSE_TEXT,#P5_COMPONENTS_TEXT,#P5_INTERACTIONS_TEXT,#P5_VARIABLES_TEXT,#P5_CONSTANTS_TEXT" },',
'  { dataType: "text" }',
'    ).done(function (data) {',
'      console.log("[DRAFT] SAVE_DRAFT OK:", data);',
'    }).fail(function (jqXHR, textStatus, errorThrown) {',
'      console.error("[DRAFT] SAVE_DRAFT FAIL:", textStatus, errorThrown, jqXHR.responseText);',
'    });',
'',
'  }, 300); // baja el debounce para pruebas',
'})();',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8828447005760733)
,p_name=>'AUTO_SAVE_DRAFT_BLUR'
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_PURPOSE_TEXT,P5_COMPONENTS_TEXT,P5_INTERACTIONS_TEXT,P5_VARIABLES_TEXT,P5_CONSTANTS_TEXT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8828531051760734)
,p_event_id=>wwv_flow_imp.id(8828447005760733)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log("[DRAFT] lose focus -> guardando inmediato");',
'',
'apex.server.process(',
'  "SAVE_DRAFT",',
'  {',
'    pageItems: "#P5_SYSTEM_ID,#P5_PURPOSE_TEXT,#P5_COMPONENTS_TEXT,#P5_INTERACTIONS_TEXT,#P5_VARIABLES_TEXT,#P5_CONSTANTS_TEXT"',
'  },',
'  { dataType: "text" }',
');',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8828786928760736)
,p_name=>'DA_SUCCESS_UI'
,p_event_sequence=>190
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8828837420760737)
,p_event_id=>wwv_flow_imp.id(8828786928760736)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// Si hay alerta sucess message le ponemos el fadeou de 4 segundos',
'var $success = $(".t-Alert--success, .t-Alert--page.t-Alert--success");',
'if ($success.length) {',
'  window.scrollTo({ top: 0, behavior: "smooth" });',
'',
'  setTimeout(function () {',
'    $success.fadeOut(300, function () { $(this).remove(); });',
'  }, 4000);',
'}',
''))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8722907757580736)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_ASSIGNMENT_ID'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  select a.assignment_id',
'    into :P5_ASSIGNMENT_ID',
'    from assignments a',
'    join app_users u',
'      on u.semester = a.semester',
'   where upper(u.username) = upper(:app_user);',
'',
'exception',
'  when no_data_found then',
'    :P5_ASSIGNMENT_ID := null;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>8722907757580736
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9515595205266510)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_USER_SEMESTER'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  select semester',
'    into :P5_USER_SEMESTER',
'    from app_users',
'   where username = :APP_USER;',
'exception',
'  when no_data_found then',
'    :P5_USER_SEMESTER := null;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>9515595205266510
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8825620654760705)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(8723010911580737)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form'
,p_attribute_01=>'P5_RESPONSE_ID'
,p_attribute_02=>'P5_RESPONSE_ID'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_application.g_request is null',
''))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_internal_uid=>8825620654760705
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8827940320760728)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'LOAD_DRAFT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  :P5_PURPOSE_TEXT := NULL;',
'  :P5_COMPONENTS_TEXT := NULL;',
'  :P5_INTERACTIONS_TEXT := NULL;',
'  :P5_VARIABLES_TEXT := NULL;',
'  :P5_CONSTANTS_TEXT := NULL;',
'',
'  IF :P5_SYSTEM_ID IS NULL THEN',
'    RETURN;',
'  END IF;',
'',
'  IF NOT apex_collection.collection_exists(''RESP_DRAFTS'') THEN',
'    RETURN;',
'  END IF;',
'',
'  BEGIN',
'    SELECT c002, c003, c004, c005, c006',
'      INTO :P5_PURPOSE_TEXT,',
'           :P5_COMPONENTS_TEXT,',
'           :P5_INTERACTIONS_TEXT,',
'           :P5_VARIABLES_TEXT,',
'           :P5_CONSTANTS_TEXT',
'      FROM apex_collections',
'     WHERE collection_name = ''RESP_DRAFTS''',
'       AND c001 = TO_CHAR(:P5_SYSTEM_ID);',
'  EXCEPTION',
'    WHEN NO_DATA_FOUND THEN',
'      NULL;',
'  END;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>8827940320760728
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9519558090266550)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RESET_LAST_RESPONSE_ID'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  -- Si NO venimos de un submit que se genera por enviar una respuesta',
'  -- toca que limpirmos el response_id',
'  if apex_application.g_request not in (''SUBMIT'',''ENVIAR'') then',
'    :P5_LAST_RESPONSE_ID := null;',
'  end if;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>9519558090266550
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8828003725760729)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SAVE_DRAFT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  l_seq NUMBER;',
'BEGIN',
'  IF :P5_SYSTEM_ID IS NULL THEN',
'    RETURN;',
'  END IF;',
'',
'  IF NOT apex_collection.collection_exists(''RESP_DRAFTS'') THEN',
'    apex_collection.create_collection(''RESP_DRAFTS'');',
'  END IF;',
'',
'  BEGIN',
'    SELECT seq_id',
'      INTO l_seq',
'      FROM apex_collections',
'     WHERE collection_name = ''RESP_DRAFTS''',
'       AND c001 = TO_CHAR(:P5_SYSTEM_ID);',
'  EXCEPTION',
'    WHEN NO_DATA_FOUND THEN',
'      l_seq := NULL;',
'  END;',
'',
'  IF l_seq IS NULL THEN',
'    apex_collection.add_member(',
'      p_collection_name => ''RESP_DRAFTS'',',
'      p_c001 => TO_CHAR(:P5_SYSTEM_ID),',
'      p_c002 => :P5_PURPOSE_TEXT,',
'      p_c003 => :P5_COMPONENTS_TEXT,',
'      p_c004 => :P5_INTERACTIONS_TEXT,',
'      p_c005 => :P5_VARIABLES_TEXT,',
'      p_c006 => :P5_CONSTANTS_TEXT',
'    );',
'  ELSE',
'    apex_collection.update_member(',
'      p_collection_name => ''RESP_DRAFTS'',',
'      p_seq             => l_seq,',
'      p_c001 => TO_CHAR(:P5_SYSTEM_ID),',
'      p_c002 => :P5_PURPOSE_TEXT,',
'      p_c003 => :P5_COMPONENTS_TEXT,',
'      p_c004 => :P5_INTERACTIONS_TEXT,',
'      p_c005 => :P5_VARIABLES_TEXT,',
'      p_c006 => :P5_CONSTANTS_TEXT',
'    );',
'  END IF;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>8828003725760729
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8827241385760721)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_INSERT_RESPONSE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  l_response_id responses.response_id%TYPE;',
'BEGIN',
'  INSERT INTO responses (',
'    username,',
'    system_id,',
'    purpose_text,',
'    components_text,',
'    interactions_text,',
'    variables_text,',
'    constants_text',
'  )',
'  VALUES (',
'    :APP_USER,',
'    :P5_SYSTEM_ID,',
'    :P5_PURPOSE_TEXT,',
'    :P5_COMPONENTS_TEXT,',
'    :P5_INTERACTIONS_TEXT,',
'    :P5_VARIABLES_TEXT,',
'    :P5_CONSTANTS_TEXT',
'  )',
'  RETURNING response_id INTO l_response_id;',
'',
'  :P5_LAST_RESPONSE_ID := l_response_id;',
'',
unistr('  -- limpiar el JSON viejo por si exist\00EDa'),
'  :P5_API_RESPONSE_JSON := NULL;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8724391648580750)
,p_internal_uid=>8827241385760721
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8829057804760739)
,p_process_sequence=>20
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_CALL_ANALYZE_API'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_system_code  systems.system_code%type;',
'  l_url          varchar2(4000);',
'  l_body         clob;',
'  l_response     clob;',
'  l_status       pls_integer;',
'begin',
'  -- matchear SYSTEM_CODE con SYSTEM_ID para la API',
'  select s.system_code',
'    into l_system_code',
'    from systems s',
'   where s.system_id = :P5_SYSTEM_ID;',
'',
'  apex_debug.message(''SYSTEM_ID=%s => SYSTEM_CODE=%s'', :P5_SYSTEM_ID, l_system_code);',
'',
'  -- JSON request',
'  apex_json.initialize_clob_output;',
'  apex_json.open_object;',
'',
'  apex_json.write(''system_name'',       l_system_code);  -- <-- CLAVE',
'  apex_json.write(''purpose_text'',      :P5_PURPOSE_TEXT);',
'  apex_json.write(''components_text'',   :P5_COMPONENTS_TEXT);',
'  apex_json.write(''interactions_text'', :P5_INTERACTIONS_TEXT);',
'  apex_json.write(''variables_text'',    :P5_VARIABLES_TEXT);',
'  apex_json.write(''constants_text'',    :P5_CONSTANTS_TEXT);',
'',
'  apex_json.close_object;',
'',
'  l_body := apex_json.get_clob_output;',
'  apex_json.free_output;',
'',
'  -- Headers',
'  apex_web_service.g_request_headers.delete;',
'  apex_web_service.g_request_headers(1).name  := ''Content-Type'';',
'  apex_web_service.g_request_headers(1).value := ''application/json; charset=utf-8'';',
'  apex_web_service.g_request_headers(2).name  := ''Accept'';',
'  apex_web_service.g_request_headers(2).value := ''application/json'';',
'',
'  -- URL',
'  l_url :=',
'    trim(replace(replace(apex_app_setting.get_value(''API_BASE_URL'', p_raise_error => true), chr(10), ''''), chr(13), '''')) ||',
'    trim(replace(replace(apex_app_setting.get_value(''API_ANALYZE_PATH'', p_raise_error => true), chr(10), ''''), chr(13), ''''));',
'',
'  apex_debug.message(''API URL FINAL = "%s"'', l_url);',
'',
'  -- POST',
'  l_response := apex_web_service.make_rest_request(',
'      p_url              => l_url,',
'      p_http_method      => ''POST'',',
'      p_body             => l_body,',
'      p_transfer_timeout => 40',
'  );',
'',
'  l_status := apex_web_service.g_status_code;',
'',
'  -- Guardar items',
'  :P5_API_RESPONSE_JSON := l_response;',
'  :P5_DEBUG_JSON        := :P5_API_RESPONSE_JSON;',
'',
'  if l_status not between 200 and 299 then',
'    apex_debug.error(',
'      ''[API] /analyze failed. status=%s, response=%s'',',
'      l_status,',
'      substr(l_response, 1, 3000)',
'    );',
'',
'    raise_application_error(',
'      -20001,',
unistr('      ''No se pudo analizar la respuesta (API /analyze). C\00F3digo HTTP: '' || l_status'),
'    );',
'  end if;',
'',
'  -- guardar JSON en RESPONSES ',
'  update responses',
'     set api_response_json = :P5_API_RESPONSE_JSON',
'   where response_id = :P5_LAST_RESPONSE_ID;',
'',
'exception',
'  when no_data_found then',
'    :P5_API_RESPONSE_JSON :=',
'      ''{"error":"SYSTEM_CODE_NOT_FOUND","message":"No existe SYSTEM_CODE para el SYSTEM_ID enviado."}'';',
'    :P5_DEBUG_JSON := :P5_API_RESPONSE_JSON;',
'',
'    raise_application_error(',
'      -20002,',
unistr('      ''No se encontr\00F3 SYSTEM_CODE para el sistema seleccionado. Revisa la tabla SYSTEMS.'''),
'    );',
'',
'  when others then',
'    if :P5_API_RESPONSE_JSON is null then',
'      :P5_API_RESPONSE_JSON :=',
'        ''{"error":"APEX_PROC_CALL_ANALYZE_API_EXCEPTION","message":"'' ||',
'        replace(substr(sqlerrm, 1, 3000), ''"'', ''\"'') || ''"}'';',
'      :P5_DEBUG_JSON := :P5_API_RESPONSE_JSON;',
'    end if;',
'',
'    apex_debug.error(''[API] Exception in PROC_CALL_ANALYZE_API: %s'', sqlerrm);',
'    raise;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8724391648580750)
,p_internal_uid=>8829057804760739
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8829353908760742)
,p_process_sequence=>30
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_STORE_ERRORS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_cat_purpose       response_categories.category_id%type;',
'  l_cat_interactions  response_categories.category_id%type;',
'  l_cat_components    response_categories.category_id%type;',
'  l_cat_variables     response_categories.category_id%type;',
'  l_cat_constants     response_categories.category_id%type;',
'',
'  l_err_deficient     error_types.error_type_id%type;',
'  l_err_incorrect_abs error_types.error_type_id%type;',
'',
'  l_pred_purpose      varchar2(100);',
'  l_pred_interactions varchar2(100);',
'',
'  l_n pls_integer;',
'  l_item_original varchar2(4000);',
'  l_item_pred     varchar2(100);',
'  l_item_suberror varchar2(100);',
'',
'  procedure ins_err(',
'    p_category_id   in response_errors.category_id%type,',
'    p_error_type_id in response_errors.error_type_id%type,',
'    p_student_value in response_errors.student_value%type,',
'    p_suberror_code in response_errors.suberror_code%type',
'  ) is',
'  begin',
'    insert into response_errors (',
'      response_id,',
'      category_id,',
'      error_type_id,',
'      student_value,',
'      suberror_code',
'    ) values (',
'      :P5_LAST_RESPONSE_ID,',
'      p_category_id,',
'      p_error_type_id,',
'      substr(p_student_value, 1, 4000),',
'      p_suberror_code',
'    );',
'  end;',
'begin',
'  if :P5_LAST_RESPONSE_ID is null then',
'    raise_application_error(-20010, ''No hay RESPONSE_ID para asociar errores.'');',
'  end if;',
'',
'  if :P5_API_RESPONSE_JSON is null then',
'    raise_application_error(-20011, ''No hay JSON de la API para procesar.'');',
'  end if;',
'',
'  -- Lookups reponse_categories',
'  select category_id into l_cat_purpose',
'    from response_categories where upper(category_name) = ''PURPOSE'';',
'  select category_id into l_cat_interactions',
'    from response_categories where upper(category_name) = ''INTERACTIONS'';',
'  select category_id into l_cat_components',
'    from response_categories where upper(category_name) = ''COMPONENTS'';',
'  select category_id into l_cat_variables',
'    from response_categories where upper(category_name) = ''VARIABLES'';',
'  select category_id into l_cat_constants',
'    from response_categories where upper(category_name) = ''CONSTANTS'';',
'',
'  -- Lookups error types ',
'  select error_type_id into l_err_deficient',
'    from error_types where upper(error_name) = ''DEFICIENT_RESPONSE'';',
'  select error_type_id into l_err_incorrect_abs',
'    from error_types where upper(error_name) = ''INCORRECT_ABSTRACTION'';',
'',
'  apex_json.parse(:P5_API_RESPONSE_JSON);',
'',
'  -- ML',
'  l_pred_purpose := apex_json.get_varchar2(''ml.purpose.predicted'');',
'  if l_pred_purpose is not null and upper(l_pred_purpose) <> ''OK'' then',
'    ins_err(l_cat_purpose, l_err_deficient, :P5_PURPOSE_TEXT, null);',
'  end if;',
'',
'  l_pred_interactions := apex_json.get_varchar2(''ml.interactions.predicted'');',
'  if l_pred_interactions is not null and upper(l_pred_interactions) <> ''OK'' then',
'    ins_err(l_cat_interactions, l_err_deficient, :P5_INTERACTIONS_TEXT, null);',
'  end if;',
'',
'  -- Reglas',
'  l_n := apex_json.get_count(''rules.components.items'');',
'  for i in 1 .. nvl(l_n, 0) loop',
'    l_item_pred := apex_json.get_varchar2(''rules.components.items[%d].predicted'', i);',
'',
'    if l_item_pred is not null and upper(l_item_pred) <> ''OK'' then',
'      l_item_original := apex_json.get_varchar2(''rules.components.items[%d].item_original'', i);',
'      l_item_suberror := apex_json.get_varchar2(''rules.components.items[%d].suberror'', i);',
'',
'      ins_err(l_cat_components, l_err_incorrect_abs, l_item_original, l_item_suberror);',
'    end if;',
'  end loop;',
'',
'  l_n := apex_json.get_count(''rules.variables.items'');',
'  for i in 1 .. nvl(l_n, 0) loop',
'    l_item_pred := apex_json.get_varchar2(''rules.variables.items[%d].predicted'', i);',
'',
'    if l_item_pred is not null and upper(l_item_pred) <> ''OK'' then',
'      l_item_original := apex_json.get_varchar2(''rules.variables.items[%d].item_original'', i);',
'      l_item_suberror := apex_json.get_varchar2(''rules.variables.items[%d].suberror'', i);',
'',
'      ins_err(l_cat_variables, l_err_incorrect_abs, l_item_original, l_item_suberror);',
'    end if;',
'  end loop;',
'',
'  l_n := apex_json.get_count(''rules.constants.items'');',
'  for i in 1 .. nvl(l_n, 0) loop',
'    l_item_pred := apex_json.get_varchar2(''rules.constants.items[%d].predicted'', i);',
'',
'    if l_item_pred is not null and upper(l_item_pred) <> ''OK'' then',
'      l_item_original := apex_json.get_varchar2(''rules.constants.items[%d].item_original'', i);',
'      l_item_suberror := apex_json.get_varchar2(''rules.constants.items[%d].suberror'', i);',
'',
'      ins_err(l_cat_constants, l_err_incorrect_abs, l_item_original, l_item_suberror);',
'    end if;',
'  end loop;',
'',
'exception',
'  when others then',
'    raise;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8724391648580750)
,p_internal_uid=>8829353908760742
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8829473573760743)
,p_process_sequence=>40
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_CALL_FEEDBACK_API'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_system_code  systems.system_code%type;',
'  l_url          varchar2(4000);',
'  l_body         clob;',
'  l_response     clob;',
'  l_status       pls_integer;',
'  l_err_count    pls_integer;',
'begin',
'  :P5_FEEDBACK_RESPONSE_JSON := null;',
'  :P5_HAS_ERRORS := ''N'';',
'',
'  if :P5_LAST_RESPONSE_ID is null then',
'    raise_application_error(-20100, ''No hay RESPONSE_ID para generar feedback.'');',
'  end if;',
'',
'  -- Verificar si hay errores',
'  select count(*)',
'    into l_err_count',
'    from response_errors re',
'   where re.response_id = :P5_LAST_RESPONSE_ID;',
'',
'  if l_err_count = 0 then',
unistr('    apex_application.g_print_success_message := ''\2705 No tienes errores, continua con el siguiente sistema.'';'),
'    return;',
'  end if;',
'',
'  :P5_HAS_ERRORS := ''Y'';',
'',
'  -- math SYSTEM_CODE con SYSTEM_ID ',
'  select s.system_code',
'    into l_system_code',
'    from systems s',
'   where s.system_id = :P5_SYSTEM_ID;',
'',
'  -- Construir JSON request para /feedback',
'  apex_json.initialize_clob_output;',
'  apex_json.open_object;',
'',
'  apex_json.write(''response_id'', :P5_LAST_RESPONSE_ID);',
'  apex_json.write(''system_code'', l_system_code);',
'',
'  apex_json.open_array(''errors'');',
'',
'  for rec in (',
'    select',
'      re.error_id,',
'      rc.category_name,',
'      et.error_name as error_type,',
'      re.suberror_code,',
'      re.student_value',
'    from response_errors re',
'    join response_categories rc on rc.category_id = re.category_id',
'    join error_types        et on et.error_type_id = re.error_type_id',
'    where re.response_id = :P5_LAST_RESPONSE_ID',
'    order by re.error_id',
'  ) loop',
'    apex_json.open_object;',
'    apex_json.write(''error_id'', rec.error_id);',
'    apex_json.write(''category_name'', rec.category_name);',
'    apex_json.write(''error_type'', rec.error_type);',
'    apex_json.write(''suberror_code'', rec.suberror_code); ',
'    apex_json.write(''student_value'', rec.student_value); ',
'    apex_json.close_object;',
'  end loop;',
'',
'  apex_json.close_array; -- errors',
'  apex_json.close_object;',
'',
'  l_body := apex_json.get_clob_output;',
'  apex_json.free_output;',
'',
'  -- Headers',
'  apex_web_service.g_request_headers.delete;',
'  apex_web_service.g_request_headers(1).name  := ''Content-Type'';',
'  apex_web_service.g_request_headers(1).value := ''application/json; charset=utf-8'';',
'  apex_web_service.g_request_headers(2).name  := ''Accept'';',
'  apex_web_service.g_request_headers(2).value := ''application/json'';',
'',
'  l_url :=',
'    trim(replace(replace(apex_app_setting.get_value(''API_BASE_URL'', p_raise_error => true), chr(10), ''''), chr(13), '''')) ||',
'    trim(replace(replace(apex_app_setting.get_value(''API_FEEDBACK_PATH'', p_raise_error => true), chr(10), ''''), chr(13), ''''));',
'',
'  -- POST',
'  l_response := apex_web_service.make_rest_request(',
'      p_url              => l_url,',
'      p_http_method      => ''POST'',',
'      p_body             => l_body,',
'      p_transfer_timeout => 40',
'  );',
'',
'  l_status := apex_web_service.g_status_code;',
'',
'  :P5_FEEDBACK_RESPONSE_JSON := l_response;',
'  :P5_DEBUG_FEEDBACK := :P5_FEEDBACK_RESPONSE_JSON;',
'',
'  if l_status not between 200 and 299 then',
'    apex_debug.error(''[API] /feedback failed. status=%s, response=%s'',',
'                     l_status, substr(l_response, 1, 3000));',
'',
'    raise_application_error(',
'      -20101,',
unistr('      ''No se pudo generar retroalimentaci\00F3n (API /feedback). C\00F3digo HTTP: '' || l_status'),
'    );',
'  end if;',
'',
'exception',
'  when no_data_found then',
unistr('    raise_application_error(-20102, ''No se encontr\00F3 SYSTEM_CODE para el sistema seleccionado.'');'),
'  when others then',
'    if :P5_FEEDBACK_RESPONSE_JSON is null then',
'      :P5_FEEDBACK_RESPONSE_JSON :=',
'        ''{"error":"APEX_PROC_CALL_FEEDBACK_API_EXCEPTION","message":"'' ||',
'        replace(substr(sqlerrm, 1, 3000), ''"'', ''\"'') || ''"}'';',
'    end if;',
'    raise;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'No se puedo enviar la respuesta'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8724391648580750)
,p_process_success_message=>unistr('\2705 Ya se envi\00F3 la respuesta. Puedes revisar la retroalimentaci\00F3n.')
,p_internal_uid=>8829473573760743
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8829763511760746)
,p_process_sequence=>50
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_STORE_FEEDBACK'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_json     clob := :P5_FEEDBACK_RESPONSE_JSON;',
'  l_username responses.username%type;',
'  l_count    pls_integer := 0;',
'begin',
'  if :P5_LAST_RESPONSE_ID is null then',
'    raise_application_error(-20110, ''No hay RESPONSE_ID para asociar feedback.'');',
'  end if;',
'',
'  if l_json is null then',
'    raise_application_error(-20111, ''No hay JSON de feedback para procesar.'');',
'  end if;',
'',
'  select r.username',
'    into l_username',
'    from responses r',
'   where r.response_id = :P5_LAST_RESPONSE_ID;',
'',
'  for r in (',
'    select',
'      jt.error_id,',
'      jt.feedback_text',
'    from json_table(',
'      l_json,',
'      ''$.feedback[*]''',
'      columns',
'        error_id      number         path ''$.error_id'',',
'        feedback_text varchar2(4000)  path ''$.feedback_text''',
'    ) jt',
'  ) loop',
'    l_count := l_count + 1;',
'',
'    merge into feedback f',
'    using (',
'      select r.error_id error_id,',
'             l_username username,',
'             r.feedback_text feedback_text',
'      from dual',
'    ) src',
'    on (f.error_id = src.error_id)',
'    when matched then',
'      update set',
'        f.username      = src.username,',
'        f.feedback_text = src.feedback_text,',
'        f.feedback_date = systimestamp',
'    when not matched then',
'      insert (error_id, username, feedback_text, feedback_date)',
'      values (src.error_id, src.username, src.feedback_text, systimestamp);',
'  end loop;',
'',
'  if l_count > 0 then',
unistr('    apex_application.g_print_success_message := ''\26A0\FE0F Tienes retroalimentaci\00F3n pendiente por revisar.'';'),
'  else',
unistr('    apex_application.g_print_success_message := ''\2705 No tienes retroalimentaci\00F3n pendiente.'';'),
'  end if;',
'',
'exception',
'  when no_data_found then',
unistr('    raise_application_error(-20113, ''No se encontr\00F3 USERNAME en RESPONSES para este RESPONSE_ID.'');'),
'  when others then',
'    raise_application_error(-20112, ''Error guardando feedback: ''||sqlerrm);',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8724391648580750)
,p_process_when=>'P5_HAS_ERRORS'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'Y'
,p_internal_uid=>8829763511760746
);
wwv_flow_imp.component_end;
end;
/
