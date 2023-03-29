<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="AllStyleCategories" labelsEnabled="1" maxScale="0" simplifyDrawingHints="1" readOnly="0" version="3.10.4-A Coruña" hasScaleBasedVisibilityFlag="0" minScale="1e+08" simplifyMaxScale="1" simplifyAlgorithm="0" simplifyDrawingTol="1" simplifyLocal="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 enableorderby="0" type="RuleRenderer" forceraster="0" symbollevels="0">
    <rules key="{3a4fbcc8-cef9-41b2-ab6f-d6040401403f}">
      <rule filter="&quot;fclass&quot; IN ( 'reservoir' , 'river' , 'water' )" symbol="0" key="{e1f9da24-75aa-4482-918a-5296f7bf1e4b}" label="water bodies"/>
      <rule filter="&quot;fclass&quot; IN ('wetland')" symbol="1" scalemindenom="1" scalemaxdenom="100001" key="{613d81b2-650f-4efb-8250-1e72cd0b2ec6}" label="wetland 1 - 100000"/>
      <rule filter="&quot;fclass&quot; IN ('wetland')" symbol="2" scalemindenom="100000" scalemaxdenom="1000000000" key="{8308a8f4-65de-4716-b638-79085b5e186d}" label="wetland 100000 - 0"/>
      <rule filter="&quot;fclass&quot; IN ('glacier')" symbol="3" key="{5443c203-02f8-410b-ace0-3ecab1883ee5}" label="glacier"/>
    </rules>
    <symbols>
      <symbol alpha="1" name="0" clip_to_extent="1" type="fill" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleFill" enabled="1">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="139,205,223,255"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="15,147,177,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.26"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="style" v="solid"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="0.5" name="1" clip_to_extent="1" type="fill" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleFill" enabled="1">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="205,235,176,255"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.26"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="style" v="solid"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="0" locked="0" class="SVGFill" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,255,255"/>
          <prop k="outline_color" v="35,35,35,255"/>
          <prop k="outline_width" v="0.26"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="pattern_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="pattern_width_unit" v="MM"/>
          <prop k="svgFile" v="/mnt/tera/ChampsLibres/Projets/OSM/QGIS_OSM_Style/ChampsLibres-map-style/champs-libres-qgis-osm-style/img/wetland.svg"/>
          <prop k="svg_outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="svg_outline_width_unit" v="MM"/>
          <prop k="width" v="10"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
          <symbol alpha="1" name="@1@1" clip_to_extent="1" type="line" force_rhr="0">
            <layer pass="0" locked="0" class="SimpleLine" enabled="1">
              <prop k="capstyle" v="square"/>
              <prop k="customdash" v="5;2"/>
              <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="customdash_unit" v="MM"/>
              <prop k="draw_inside_polygon" v="0"/>
              <prop k="joinstyle" v="bevel"/>
              <prop k="line_color" v="51,51,51,255"/>
              <prop k="line_style" v="solid"/>
              <prop k="line_width" v="0.05"/>
              <prop k="line_width_unit" v="MM"/>
              <prop k="offset" v="0"/>
              <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="offset_unit" v="MM"/>
              <prop k="ring_filter" v="0"/>
              <prop k="use_custom_dash" v="0"/>
              <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" name="name" type="QString"/>
                  <Option name="properties"/>
                  <Option value="collection" name="type" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol alpha="0.5" name="2" clip_to_extent="1" type="fill" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleFill" enabled="1">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="214,217,159,255"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_style" v="no"/>
          <prop k="outline_width" v="0.36"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="style" v="solid"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="0" locked="0" class="LinePatternFill" enabled="1">
          <prop k="angle" v="23.5"/>
          <prop k="color" v="0,0,255,255"/>
          <prop k="distance" v="3.2"/>
          <prop k="distance_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="distance_unit" v="MM"/>
          <prop k="line_width" v="0.26"/>
          <prop k="line_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="5.55112e-17"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
          <symbol alpha="1" name="@2@1" clip_to_extent="1" type="line" force_rhr="0">
            <layer pass="0" locked="0" class="SimpleLine" enabled="1">
              <prop k="capstyle" v="square"/>
              <prop k="customdash" v="5;2"/>
              <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="customdash_unit" v="MM"/>
              <prop k="draw_inside_polygon" v="0"/>
              <prop k="joinstyle" v="bevel"/>
              <prop k="line_color" v="169,210,222,255"/>
              <prop k="line_style" v="dash dot"/>
              <prop k="line_width" v="0.26"/>
              <prop k="line_width_unit" v="MM"/>
              <prop k="offset" v="0"/>
              <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="offset_unit" v="MM"/>
              <prop k="ring_filter" v="0"/>
              <prop k="use_custom_dash" v="0"/>
              <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" name="name" type="QString"/>
                  <Option name="properties"/>
                  <Option value="collection" name="type" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer pass="0" locked="0" class="MarkerLine" enabled="1">
              <prop k="average_angle_length" v="4"/>
              <prop k="average_angle_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="average_angle_unit" v="MM"/>
              <prop k="interval" v="3"/>
              <prop k="interval_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="interval_unit" v="MM"/>
              <prop k="offset" v="0"/>
              <prop k="offset_along_line" v="0"/>
              <prop k="offset_along_line_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="offset_along_line_unit" v="MM"/>
              <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="offset_unit" v="MM"/>
              <prop k="placement" v="centralpoint"/>
              <prop k="ring_filter" v="0"/>
              <prop k="rotate" v="1"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option value="" name="name" type="QString"/>
                  <Option name="properties"/>
                  <Option value="collection" name="type" type="QString"/>
                </Option>
              </data_defined_properties>
              <symbol alpha="1" name="@@2@1@1" clip_to_extent="1" type="marker" force_rhr="0">
                <layer pass="0" locked="0" class="SimpleMarker" enabled="1">
                  <prop k="angle" v="23.5"/>
                  <prop k="color" v="169,210,222,255"/>
                  <prop k="horizontal_anchor_point" v="1"/>
                  <prop k="joinstyle" v="bevel"/>
                  <prop k="name" v="star"/>
                  <prop k="offset" v="0,0"/>
                  <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                  <prop k="offset_unit" v="MM"/>
                  <prop k="outline_color" v="35,35,35,255"/>
                  <prop k="outline_style" v="no"/>
                  <prop k="outline_width" v="0"/>
                  <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                  <prop k="outline_width_unit" v="MM"/>
                  <prop k="scale_method" v="diameter"/>
                  <prop k="size" v="1.2"/>
                  <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                  <prop k="size_unit" v="MM"/>
                  <prop k="vertical_anchor_point" v="1"/>
                  <effect type="effectStack" enabled="0">
                    <effect type="dropShadow">
                      <prop k="blend_mode" v="13"/>
                      <prop k="blur_level" v="2.645"/>
                      <prop k="blur_unit" v="MM"/>
                      <prop k="blur_unit_scale" v="3x:0,0,0,0,0,0"/>
                      <prop k="color" v="0,0,0,255"/>
                      <prop k="draw_mode" v="2"/>
                      <prop k="enabled" v="0"/>
                      <prop k="offset_angle" v="135"/>
                      <prop k="offset_distance" v="2"/>
                      <prop k="offset_unit" v="MM"/>
                      <prop k="offset_unit_scale" v="3x:0,0,0,0,0,0"/>
                      <prop k="opacity" v="1"/>
                    </effect>
                    <effect type="outerGlow">
                      <prop k="blend_mode" v="0"/>
                      <prop k="blur_level" v="0.7935"/>
                      <prop k="blur_unit" v="MM"/>
                      <prop k="blur_unit_scale" v="3x:0,0,0,0,0,0"/>
                      <prop k="color1" v="0,0,255,255"/>
                      <prop k="color2" v="0,255,0,255"/>
                      <prop k="color_type" v="0"/>
                      <prop k="discrete" v="0"/>
                      <prop k="draw_mode" v="2"/>
                      <prop k="enabled" v="0"/>
                      <prop k="opacity" v="0.5"/>
                      <prop k="rampType" v="gradient"/>
                      <prop k="single_color" v="199,218,223,255"/>
                      <prop k="spread" v="2"/>
                      <prop k="spread_unit" v="MM"/>
                      <prop k="spread_unit_scale" v="3x:0,0,0,0,0,0"/>
                    </effect>
                    <effect type="drawSource">
                      <prop k="blend_mode" v="0"/>
                      <prop k="draw_mode" v="2"/>
                      <prop k="enabled" v="0"/>
                      <prop k="opacity" v="1"/>
                    </effect>
                    <effect type="innerShadow">
                      <prop k="blend_mode" v="13"/>
                      <prop k="blur_level" v="2.645"/>
                      <prop k="blur_unit" v="MM"/>
                      <prop k="blur_unit_scale" v="3x:0,0,0,0,0,0"/>
                      <prop k="color" v="0,0,0,255"/>
                      <prop k="draw_mode" v="2"/>
                      <prop k="enabled" v="0"/>
                      <prop k="offset_angle" v="135"/>
                      <prop k="offset_distance" v="2"/>
                      <prop k="offset_unit" v="MM"/>
                      <prop k="offset_unit_scale" v="3x:0,0,0,0,0,0"/>
                      <prop k="opacity" v="1"/>
                    </effect>
                    <effect type="innerGlow">
                      <prop k="blend_mode" v="0"/>
                      <prop k="blur_level" v="0.7935"/>
                      <prop k="blur_unit" v="MM"/>
                      <prop k="blur_unit_scale" v="3x:0,0,0,0,0,0"/>
                      <prop k="color1" v="0,0,255,255"/>
                      <prop k="color2" v="0,255,0,255"/>
                      <prop k="color_type" v="0"/>
                      <prop k="discrete" v="0"/>
                      <prop k="draw_mode" v="2"/>
                      <prop k="enabled" v="0"/>
                      <prop k="opacity" v="0.5"/>
                      <prop k="rampType" v="gradient"/>
                      <prop k="single_color" v="255,255,255,255"/>
                      <prop k="spread" v="2"/>
                      <prop k="spread_unit" v="MM"/>
                      <prop k="spread_unit_scale" v="3x:0,0,0,0,0,0"/>
                    </effect>
                  </effect>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option value="" name="name" type="QString"/>
                      <Option name="properties"/>
                      <Option value="collection" name="type" type="QString"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol alpha="0.75" name="3" clip_to_extent="1" type="fill" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleFill" enabled="1">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="221,236,236,255"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="190,236,236,255"/>
          <prop k="outline_style" v="dash"/>
          <prop k="outline_width" v="0.26"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="style" v="solid"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <labeling type="rule-based">
    <rules key="{e469e777-ba4a-4598-a7b1-7aade1845e52}">
      <rule filter=" &quot;fclass&quot; IN ( 'reservoir' ,  'water' )" scalemindenom="50001" scalemaxdenom="1000001" key="{3f7bfbe5-327c-4aa2-8cb3-4a73de64cd70}" description="big lakes">
        <settings calloutType="simple">
          <text-style fontItalic="1" fontKerning="1" fontLetterSpacing="0" namedStyle="Italic" fontStrikeout="0" fontCapitals="0" previewBkgrdColor="0,0,0,255" blendMode="0" useSubstitutions="0" fontUnderline="0" multilineHeight="1" fontFamily="Noto Sans" fontWordSpacing="0" fontWeight="50" textOpacity="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fieldName="CASE &#xd;&#xa;&#xd;&#xa;WHEN  layer_property(@layer_name, 'crs_definition') LIKE '%+units=m%' &#xd;&#xa;THEN&#xd;&#xa;Case When $area > 2000000&#xd;&#xa;Then  &quot;name&quot; &#xd;&#xa;End&#xd;&#xa;&#xd;&#xa;When  layer_property(@layer_name, 'crs_definition') Not LIKE '%+units=m%'&#xd;&#xa;Then&#xd;&#xa;Case When  area(transform($geometry, layer_property(@layer_name, 'crs'), 'EPSG:3395'))  > 2000000&#xd;&#xa;Then &quot;name&quot;&#xd;&#xa;End&#xd;&#xa;&#xd;&#xa;Else&#xd;&#xa;Case When num_points($geometry) > 1000 &#xd;&#xa;Then &quot;name&quot;&#xd;&#xa;End&#xd;&#xa;&#xd;&#xa;END" textColor="0,0,72,255" fontSize="8" isExpression="1" fontSizeUnit="Point" textOrientation="horizontal">
            <text-buffer bufferSize="0.8" bufferSizeUnits="MM" bufferOpacity="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255" bufferNoFill="1" bufferBlendMode="0" bufferDraw="1" bufferJoinStyle="128"/>
            <background shapeBorderWidthUnit="MM" shapeRotation="0" shapeFillColor="255,255,255,255" shapeOffsetY="0" shapeDraw="0" shapeOffsetUnit="MM" shapeRotationType="0" shapeRadiiY="0" shapeRadiiX="0" shapeJoinStyle="64" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBlendMode="0" shapeType="0" shapeOpacity="1" shapeSizeX="0" shapeSizeType="0" shapeSizeUnit="MM" shapeSVGFile="" shapeSizeY="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidth="0" shapeRadiiUnit="MM" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetX="0" shapeBorderColor="128,128,128,255"/>
            <shadow shadowRadiusUnit="MM" shadowBlendMode="6" shadowOffsetDist="1" shadowDraw="0" shadowOffsetAngle="135" shadowColor="0,0,0,255" shadowUnder="0" shadowRadius="1.5" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOpacity="0.7" shadowScale="100" shadowOffsetUnit="MM" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetGlobal="1" shadowRadiusAlphaOnly="0"/>
            <dd_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format wrapChar="" autoWrapLength="0" decimals="3" rightDirectionSymbol=">" placeDirectionSymbol="0" multilineAlign="4294967295" useMaxLineLengthForAutoWrap="1" formatNumbers="0" addDirectionSymbol="0" plussign="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0"/>
          <placement repeatDistanceUnits="MM" xOffset="0" offsetUnits="MM" maxCurvedCharAngleOut="-25" geometryGenerator="" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" maxCurvedCharAngleIn="25" preserveRotation="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetType="0" quadOffset="4" layerType="UnknownGeometry" centroidInside="0" centroidWhole="1" overrunDistanceUnit="MM" geometryGeneratorEnabled="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="1" dist="0" fitInPolygonOnly="0" placementFlags="10" rotationAngle="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" yOffset="0" overrunDistance="0" geometryGeneratorType="PointGeometry" distUnits="MM" repeatDistance="0" distMapUnitScale="3x:0,0,0,0,0,0"/>
          <rendering labelPerPart="0" maxNumLabels="2000" upsidedownLabels="0" limitNumLabels="0" minFeatureSize="0" obstacle="1" fontMaxPixelSize="10000" zIndex="0" scaleMax="0" scaleMin="0" fontMinPixelSize="3" fontLimitPixelSize="0" obstacleFactor="1" displayAll="1" scaleVisibility="0" obstacleType="0" mergeLines="0" drawLabels="1"/>
          <dd_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option value="pole_of_inaccessibility" name="anchorPoint" type="QString"/>
              <Option name="ddProperties" type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
              <Option value="false" name="drawToAllParts" type="bool"/>
              <Option value="0" name="enabled" type="QString"/>
              <Option value="&lt;symbol alpha=&quot;1&quot; name=&quot;symbol&quot; clip_to_extent=&quot;1&quot; type=&quot;line&quot; force_rhr=&quot;0&quot;>&lt;layer pass=&quot;0&quot; locked=&quot;0&quot; class=&quot;SimpleLine&quot; enabled=&quot;1&quot;>&lt;prop k=&quot;capstyle&quot; v=&quot;square&quot;/>&lt;prop k=&quot;customdash&quot; v=&quot;5;2&quot;/>&lt;prop k=&quot;customdash_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;prop k=&quot;customdash_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;draw_inside_polygon&quot; v=&quot;0&quot;/>&lt;prop k=&quot;joinstyle&quot; v=&quot;bevel&quot;/>&lt;prop k=&quot;line_color&quot; v=&quot;60,60,60,255&quot;/>&lt;prop k=&quot;line_style&quot; v=&quot;solid&quot;/>&lt;prop k=&quot;line_width&quot; v=&quot;0.3&quot;/>&lt;prop k=&quot;line_width_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;offset&quot; v=&quot;0&quot;/>&lt;prop k=&quot;offset_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;prop k=&quot;offset_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;ring_filter&quot; v=&quot;0&quot;/>&lt;prop k=&quot;use_custom_dash&quot; v=&quot;0&quot;/>&lt;prop k=&quot;width_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; name=&quot;name&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; name=&quot;type&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" name="lineSymbol" type="QString"/>
              <Option value="0" name="minLength" type="double"/>
              <Option value="3x:0,0,0,0,0,0" name="minLengthMapUnitScale" type="QString"/>
              <Option value="MM" name="minLengthUnit" type="QString"/>
              <Option value="0" name="offsetFromAnchor" type="double"/>
              <Option value="3x:0,0,0,0,0,0" name="offsetFromAnchorMapUnitScale" type="QString"/>
              <Option value="MM" name="offsetFromAnchorUnit" type="QString"/>
              <Option value="0" name="offsetFromLabel" type="double"/>
              <Option value="3x:0,0,0,0,0,0" name="offsetFromLabelMapUnitScale" type="QString"/>
              <Option value="MM" name="offsetFromLabelUnit" type="QString"/>
            </Option>
          </callout>
        </settings>
      </rule>
      <rule filter=" &quot;fclass&quot; IN ( 'reservoir' ,  'water' )" scalemindenom="1" scalemaxdenom="50001" key="{fdfd00e8-9748-41f4-873e-3ba1f56ce48d}" description="small lakes">
        <settings calloutType="simple">
          <text-style fontItalic="1" fontKerning="1" fontLetterSpacing="0" namedStyle="Italic" fontStrikeout="0" fontCapitals="0" previewBkgrdColor="0,0,0,255" blendMode="0" useSubstitutions="0" fontUnderline="0" multilineHeight="1" fontFamily="Noto Sans" fontWordSpacing="0" fontWeight="50" textOpacity="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fieldName="CASE&#xd;&#xa; &#xd;&#xa;WHEN  layer_property(@layer_name, 'crs_definition') LIKE '%+units=m%' &#xd;&#xa;THEN&#xd;&#xa;Case When $area &lt;= 2000000&#xd;&#xa;Then  &quot;name&quot; &#xd;&#xa;End&#xd;&#xa;&#xd;&#xa;When  layer_property(@layer_name, 'crs_definition') LIKE '%EPSG:4326%'&#xd;&#xa;Then&#xd;&#xa;Case When  area(transform($geometry, 'EPSG:4326', 'EPSG:3395'))  &lt;= 2000000&#xd;&#xa;Then &quot;name&quot;&#xd;&#xa;End&#xd;&#xa;&#xd;&#xa;Else&#xd;&#xa;Case When num_points($geometry) &lt;= 1000 &#xd;&#xa;Then &quot;name&quot;&#xd;&#xa;End&#xd;&#xa;&#xd;&#xa;END" textColor="0,0,72,255" fontSize="8" isExpression="1" fontSizeUnit="Point" textOrientation="horizontal">
            <text-buffer bufferSize="0.8" bufferSizeUnits="MM" bufferOpacity="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255" bufferNoFill="1" bufferBlendMode="0" bufferDraw="1" bufferJoinStyle="128"/>
            <background shapeBorderWidthUnit="MM" shapeRotation="0" shapeFillColor="255,255,255,255" shapeOffsetY="0" shapeDraw="0" shapeOffsetUnit="MM" shapeRotationType="0" shapeRadiiY="0" shapeRadiiX="0" shapeJoinStyle="64" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBlendMode="0" shapeType="0" shapeOpacity="1" shapeSizeX="0" shapeSizeType="0" shapeSizeUnit="MM" shapeSVGFile="" shapeSizeY="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidth="0" shapeRadiiUnit="MM" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetX="0" shapeBorderColor="128,128,128,255"/>
            <shadow shadowRadiusUnit="MM" shadowBlendMode="6" shadowOffsetDist="1" shadowDraw="0" shadowOffsetAngle="135" shadowColor="0,0,0,255" shadowUnder="0" shadowRadius="1.5" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOpacity="0.7" shadowScale="100" shadowOffsetUnit="MM" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetGlobal="1" shadowRadiusAlphaOnly="0"/>
            <dd_properties>
              <Option type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format wrapChar="" autoWrapLength="18" decimals="3" rightDirectionSymbol=">" placeDirectionSymbol="0" multilineAlign="1" useMaxLineLengthForAutoWrap="1" formatNumbers="0" addDirectionSymbol="0" plussign="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0"/>
          <placement repeatDistanceUnits="MM" xOffset="0" offsetUnits="MM" maxCurvedCharAngleOut="-25" geometryGenerator="" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" maxCurvedCharAngleIn="25" preserveRotation="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetType="0" quadOffset="4" layerType="UnknownGeometry" centroidInside="0" centroidWhole="1" overrunDistanceUnit="MM" geometryGeneratorEnabled="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="1" dist="0" fitInPolygonOnly="0" placementFlags="10" rotationAngle="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" yOffset="0" overrunDistance="0" geometryGeneratorType="PointGeometry" distUnits="MM" repeatDistance="0" distMapUnitScale="3x:0,0,0,0,0,0"/>
          <rendering labelPerPart="0" maxNumLabels="2000" upsidedownLabels="0" limitNumLabels="0" minFeatureSize="0" obstacle="1" fontMaxPixelSize="10000" zIndex="0" scaleMax="0" scaleMin="0" fontMinPixelSize="3" fontLimitPixelSize="0" obstacleFactor="1" displayAll="0" scaleVisibility="0" obstacleType="0" mergeLines="0" drawLabels="1"/>
          <dd_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option value="pole_of_inaccessibility" name="anchorPoint" type="QString"/>
              <Option name="ddProperties" type="Map">
                <Option value="" name="name" type="QString"/>
                <Option name="properties"/>
                <Option value="collection" name="type" type="QString"/>
              </Option>
              <Option value="false" name="drawToAllParts" type="bool"/>
              <Option value="0" name="enabled" type="QString"/>
              <Option value="&lt;symbol alpha=&quot;1&quot; name=&quot;symbol&quot; clip_to_extent=&quot;1&quot; type=&quot;line&quot; force_rhr=&quot;0&quot;>&lt;layer pass=&quot;0&quot; locked=&quot;0&quot; class=&quot;SimpleLine&quot; enabled=&quot;1&quot;>&lt;prop k=&quot;capstyle&quot; v=&quot;square&quot;/>&lt;prop k=&quot;customdash&quot; v=&quot;5;2&quot;/>&lt;prop k=&quot;customdash_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;prop k=&quot;customdash_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;draw_inside_polygon&quot; v=&quot;0&quot;/>&lt;prop k=&quot;joinstyle&quot; v=&quot;bevel&quot;/>&lt;prop k=&quot;line_color&quot; v=&quot;60,60,60,255&quot;/>&lt;prop k=&quot;line_style&quot; v=&quot;solid&quot;/>&lt;prop k=&quot;line_width&quot; v=&quot;0.3&quot;/>&lt;prop k=&quot;line_width_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;offset&quot; v=&quot;0&quot;/>&lt;prop k=&quot;offset_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;prop k=&quot;offset_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;ring_filter&quot; v=&quot;0&quot;/>&lt;prop k=&quot;use_custom_dash&quot; v=&quot;0&quot;/>&lt;prop k=&quot;width_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; name=&quot;name&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; name=&quot;type&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" name="lineSymbol" type="QString"/>
              <Option value="0" name="minLength" type="double"/>
              <Option value="3x:0,0,0,0,0,0" name="minLengthMapUnitScale" type="QString"/>
              <Option value="MM" name="minLengthUnit" type="QString"/>
              <Option value="0" name="offsetFromAnchor" type="double"/>
              <Option value="3x:0,0,0,0,0,0" name="offsetFromAnchorMapUnitScale" type="QString"/>
              <Option value="MM" name="offsetFromAnchorUnit" type="QString"/>
              <Option value="0" name="offsetFromLabel" type="double"/>
              <Option value="3x:0,0,0,0,0,0" name="offsetFromLabelMapUnitScale" type="QString"/>
              <Option value="MM" name="offsetFromLabelUnit" type="QString"/>
            </Option>
          </callout>
        </settings>
      </rule>
    </rules>
  </labeling>
  <customproperties>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory maxScaleDenominator="1e+08" backgroundColor="#ffffff" width="15" lineSizeScale="3x:0,0,0,0,0,0" penWidth="0" penAlpha="255" sizeType="MM" opacity="1" scaleDependency="Area" scaleBasedVisibility="0" minScaleDenominator="0" diagramOrientation="Up" labelPlacementMethod="XHeight" enabled="0" sizeScale="3x:0,0,0,0,0,0" height="15" rotationOffset="270" backgroundAlpha="255" barWidth="5" lineSizeType="MM" penColor="#000000" minimumSize="0">
      <fontProperties style="" description="Noto Sans,9,-1,5,50,0,0,0,0,0"/>
      <attribute color="#000000" field="" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings obstacle="0" priority="0" placement="1" dist="0" linePlacementFlags="18" zIndex="0" showAll="1">
    <properties>
      <Option type="Map">
        <Option value="" name="name" type="QString"/>
        <Option name="properties"/>
        <Option value="collection" name="type" type="QString"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration type="Map">
      <Option name="QgsGeometryGapCheck" type="Map">
        <Option value="0" name="allowedGapsBuffer" type="double"/>
        <Option value="false" name="allowedGapsEnabled" type="bool"/>
        <Option value="" name="allowedGapsLayer" type="QString"/>
      </Option>
    </checkConfiguration>
  </geometryOptions>
  <fieldConfiguration>
    <field name="osm_id">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="code">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="fclass">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="name">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias index="0" name="" field="osm_id"/>
    <alias index="1" name="" field="code"/>
    <alias index="2" name="" field="fclass"/>
    <alias index="3" name="" field="name"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" applyOnUpdate="0" field="osm_id"/>
    <default expression="" applyOnUpdate="0" field="code"/>
    <default expression="" applyOnUpdate="0" field="fclass"/>
    <default expression="" applyOnUpdate="0" field="name"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" field="osm_id" constraints="0"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" field="code" constraints="0"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" field="fclass" constraints="0"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" field="name" constraints="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" exp="" field="osm_id"/>
    <constraint desc="" exp="" field="code"/>
    <constraint desc="" exp="" field="fclass"/>
    <constraint desc="" exp="" field="name"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortOrder="0" sortExpression="" actionWidgetStyle="dropDown">
    <columns>
      <column name="osm_id" width="-1" type="field" hidden="0"/>
      <column name="code" width="-1" type="field" hidden="0"/>
      <column name="fclass" width="-1" type="field" hidden="0"/>
      <column name="name" width="-1" type="field" hidden="0"/>
      <column width="-1" type="actions" hidden="1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1">/mnt/tera/ChampsLibres/Projets/OSM/QGIS_OSM_Style/ChampsLibres-map-style/champs-libres-qgis-osm-style</editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath>/mnt/tera/ChampsLibres/Projets/OSM/QGIS_OSM_Style/ChampsLibres-map-style/champs-libres-qgis-osm-style</editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field name="code" editable="1"/>
    <field name="fclass" editable="1"/>
    <field name="name" editable="1"/>
    <field name="osm_id" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="code" labelOnTop="0"/>
    <field name="fclass" labelOnTop="0"/>
    <field name="name" labelOnTop="0"/>
    <field name="osm_id" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>osm_id</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
