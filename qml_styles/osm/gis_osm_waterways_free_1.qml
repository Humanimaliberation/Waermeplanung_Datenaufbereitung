<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="AllStyleCategories" labelsEnabled="1" maxScale="1" simplifyDrawingHints="1" readOnly="0" version="3.10.4-A Coruña" hasScaleBasedVisibilityFlag="1" minScale="1.2e+07" simplifyMaxScale="1" simplifyAlgorithm="0" simplifyDrawingTol="1" simplifyLocal="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 enableorderby="0" type="RuleRenderer" forceraster="0" symbollevels="0">
    <rules key="{0d36de44-6814-4fea-a48c-d678277f9bd4}">
      <rule filter="&quot;fclass&quot; IN ('river','canal','dam','derelict_canal')" scalemindenom="1" scalemaxdenom="2000000" key="{fb38fbf4-38d7-4aa7-a641-38000355af94}" label="river">
        <rule symbol="0" scalemindenom="1" scalemaxdenom="25001" key="{85593d31-43af-465a-987e-a2db45c13dee}" label="0 - 25000"/>
        <rule symbol="1" scalemindenom="25001" scalemaxdenom="50001" key="{e73cd13b-8421-4da7-ae32-64ec556c2136}" label="25000 - 50000"/>
        <rule symbol="2" scalemindenom="50001" scalemaxdenom="100001" key="{88153c9f-f3fa-496a-99b4-0f1bf4a54c56}" label="50000 - 100000"/>
      </rule>
      <rule filter="&quot;fclass&quot; IN ('stream','drain','ditch','weir')" scalemindenom="1" scalemaxdenom="2000000" key="{f3082c5b-c4d0-4e58-8dba-ee4c9d2d6ef5}" label="stream">
        <rule symbol="3" scalemindenom="1" scalemaxdenom="25001" key="{2ea395c2-750f-4578-8764-4725bf71c7dc}" label="0 - 25000"/>
        <rule symbol="4" scalemindenom="25001" scalemaxdenom="50001" key="{de067cfb-bfc9-47d8-96eb-08e6b7259820}" label="25000 - 50000"/>
        <rule symbol="5" scalemindenom="50001" scalemaxdenom="100001" key="{6095086a-a2e5-45f3-88b8-8d6135cc29d1}" label="50000 - 100000"/>
      </rule>
    </rules>
    <symbols>
      <symbol alpha="1" name="0" clip_to_extent="1" type="line" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleLine" enabled="1">
          <prop k="capstyle" v="round"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="round"/>
          <prop k="line_color" v="15,147,201,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="1"/>
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
        <layer pass="0" locked="0" class="SimpleLine" enabled="1">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="139,205,223,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.8"/>
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
      <symbol alpha="1" name="1" clip_to_extent="1" type="line" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleLine" enabled="1">
          <prop k="capstyle" v="round"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="round"/>
          <prop k="line_color" v="15,147,201,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.2"/>
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
      <symbol alpha="1" name="2" clip_to_extent="1" type="line" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleLine" enabled="1">
          <prop k="capstyle" v="round"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="round"/>
          <prop k="line_color" v="15,147,201,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0"/>
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
      <symbol alpha="1" name="3" clip_to_extent="1" type="line" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleLine" enabled="1">
          <prop k="capstyle" v="round"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="round"/>
          <prop k="line_color" v="15,147,201,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.5"/>
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
      <symbol alpha="1" name="4" clip_to_extent="1" type="line" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleLine" enabled="1">
          <prop k="capstyle" v="round"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="round"/>
          <prop k="line_color" v="15,147,201,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.2"/>
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
      <symbol alpha="1" name="5" clip_to_extent="1" type="line" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleLine" enabled="1">
          <prop k="capstyle" v="round"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="round"/>
          <prop k="line_color" v="15,147,201,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0"/>
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
    </symbols>
  </renderer-v2>
  <labeling type="rule-based">
    <rules key="{57808332-3ea2-4ce7-bd64-3f7ab4e89bc9}">
      <rule filter=" &quot;fclass&quot;  =  'river' " key="{b6d992ce-5034-4a87-b23b-d1f1ace7a6d6}" description="river">
        <settings calloutType="simple">
          <text-style fontItalic="1" fontKerning="1" fontLetterSpacing="0" namedStyle="Italic" fontStrikeout="0" fontCapitals="0" previewBkgrdColor="0,0,0,255" blendMode="0" useSubstitutions="0" fontUnderline="0" multilineHeight="1" fontFamily="Open Sans" fontWordSpacing="0" fontWeight="50" textOpacity="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fieldName="name" textColor="51,111,128,255" fontSize="9" isExpression="0" fontSizeUnit="Point" textOrientation="horizontal">
            <text-buffer bufferSize="0.7" bufferSizeUnits="MM" bufferOpacity="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="223,223,223,255" bufferNoFill="1" bufferBlendMode="0" bufferDraw="1" bufferJoinStyle="128"/>
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
          <text-format wrapChar="" autoWrapLength="0" decimals="3" rightDirectionSymbol=">" placeDirectionSymbol="0" multilineAlign="1" useMaxLineLengthForAutoWrap="1" formatNumbers="0" addDirectionSymbol="0" plussign="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0"/>
          <placement repeatDistanceUnits="MM" xOffset="0" offsetUnits="MM" maxCurvedCharAngleOut="-25" geometryGenerator="" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" maxCurvedCharAngleIn="25" preserveRotation="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetType="0" quadOffset="4" layerType="UnknownGeometry" centroidInside="0" centroidWhole="0" overrunDistanceUnit="MM" geometryGeneratorEnabled="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="3" dist="0" fitInPolygonOnly="0" placementFlags="9" rotationAngle="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" yOffset="0" overrunDistance="0" geometryGeneratorType="PointGeometry" distUnits="MM" repeatDistance="250" distMapUnitScale="3x:0,0,0,0,0,0"/>
          <rendering labelPerPart="0" maxNumLabels="2000" upsidedownLabels="0" limitNumLabels="0" minFeatureSize="25" obstacle="1" fontMaxPixelSize="10000" zIndex="0" scaleMax="0" scaleMin="0" fontMinPixelSize="3" fontLimitPixelSize="0" obstacleFactor="1" displayAll="0" scaleVisibility="0" obstacleType="0" mergeLines="1" drawLabels="1"/>
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
      <rule filter=" &quot;fclass&quot; IN ('stream')" key="{6433937c-e633-4eb5-88db-5f26e71ade46}" description="river">
        <settings calloutType="simple">
          <text-style fontItalic="1" fontKerning="1" fontLetterSpacing="0.09375" namedStyle="Italic" fontStrikeout="0" fontCapitals="0" previewBkgrdColor="0,0,0,255" blendMode="0" useSubstitutions="0" fontUnderline="0" multilineHeight="1" fontFamily="Open Sans" fontWordSpacing="0.1875" fontWeight="50" textOpacity="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fieldName="name" textColor="51,111,128,255" fontSize="7" isExpression="0" fontSizeUnit="Point" textOrientation="horizontal">
            <text-buffer bufferSize="0.7" bufferSizeUnits="MM" bufferOpacity="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="223,223,223,255" bufferNoFill="1" bufferBlendMode="0" bufferDraw="1" bufferJoinStyle="128"/>
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
          <text-format wrapChar="" autoWrapLength="0" decimals="3" rightDirectionSymbol=">" placeDirectionSymbol="0" multilineAlign="1" useMaxLineLengthForAutoWrap="1" formatNumbers="0" addDirectionSymbol="0" plussign="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0"/>
          <placement repeatDistanceUnits="MM" xOffset="0" offsetUnits="MM" maxCurvedCharAngleOut="-25" geometryGenerator="" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" maxCurvedCharAngleIn="25" preserveRotation="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetType="0" quadOffset="4" layerType="UnknownGeometry" centroidInside="0" centroidWhole="0" overrunDistanceUnit="MM" geometryGeneratorEnabled="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="3" dist="0" fitInPolygonOnly="0" placementFlags="9" rotationAngle="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" yOffset="0" overrunDistance="0" geometryGeneratorType="PointGeometry" distUnits="MM" repeatDistance="500" distMapUnitScale="3x:0,0,0,0,0,0"/>
          <rendering labelPerPart="0" maxNumLabels="2000" upsidedownLabels="0" limitNumLabels="0" minFeatureSize="25" obstacle="1" fontMaxPixelSize="10000" zIndex="0" scaleMax="0" scaleMin="0" fontMinPixelSize="3" fontLimitPixelSize="0" obstacleFactor="1" displayAll="0" scaleVisibility="0" obstacleType="0" mergeLines="1" drawLabels="1"/>
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
    <property value="&quot;osm_id&quot;" key="dualview/previewExpressions"/>
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
  <DiagramLayerSettings obstacle="0" priority="0" placement="2" dist="0" linePlacementFlags="18" zIndex="0" showAll="1">
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
    <checkConfiguration/>
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
    <field name="width">
      <editWidget type="Range">
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
    <alias index="3" name="" field="width"/>
    <alias index="4" name="" field="name"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" applyOnUpdate="0" field="osm_id"/>
    <default expression="" applyOnUpdate="0" field="code"/>
    <default expression="" applyOnUpdate="0" field="fclass"/>
    <default expression="" applyOnUpdate="0" field="width"/>
    <default expression="" applyOnUpdate="0" field="name"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" field="osm_id" constraints="0"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" field="code" constraints="0"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" field="fclass" constraints="0"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" field="width" constraints="0"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" field="name" constraints="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" exp="" field="osm_id"/>
    <constraint desc="" exp="" field="code"/>
    <constraint desc="" exp="" field="fclass"/>
    <constraint desc="" exp="" field="width"/>
    <constraint desc="" exp="" field="name"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortOrder="0" sortExpression="" actionWidgetStyle="dropDown">
    <columns>
      <column name="osm_id" width="-1" type="field" hidden="0"/>
      <column name="name" width="-1" type="field" hidden="0"/>
      <column name="width" width="-1" type="field" hidden="0"/>
      <column width="-1" type="actions" hidden="1"/>
      <column name="code" width="-1" type="field" hidden="0"/>
      <column name="fclass" width="-1" type="field" hidden="0"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1">D:/Eigene Dateien/Karten/Projekte/OSM_Geofabrik_Basemap</editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath>D:/Eigene Dateien/Karten/Projekte/OSM_Geofabrik_Basemap</editforminitfilepath>
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
    <field name="width" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="code" labelOnTop="0"/>
    <field name="fclass" labelOnTop="0"/>
    <field name="name" labelOnTop="0"/>
    <field name="osm_id" labelOnTop="0"/>
    <field name="width" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>name</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
