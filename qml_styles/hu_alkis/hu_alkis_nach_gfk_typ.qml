<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis labelsEnabled="1" readOnly="0" simplifyLocal="1" version="3.10.4-A Coruña" simplifyDrawingHints="1" hasScaleBasedVisibilityFlag="0" minScale="1e+08" simplifyMaxScale="1" maxScale="0" simplifyAlgorithm="0" simplifyDrawingTol="1" styleCategories="AllStyleCategories">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 forceraster="0" enableorderby="0" symbollevels="0" type="RuleRenderer">
    <rules key="{6e39b549-82a8-4ae2-98c8-6f129c448253}">
      <rule key="{5a12c505-b9d5-4bf6-8952-7db310cf9088}" symbol="0" filter=" &quot;zensus&quot; = 1 and &quot;alt_rel&quot; = 1&#xa;" label="Beheizte Wohngebäude nach GFK"/>
      <rule key="{b0738b93-13d5-4ca0-96ac-147c7e2adf1e}" symbol="1" filter="&quot;zensus&quot; = 0 and &quot;alt_rel&quot; = 1" label="Beheizte Nicht-Wohngebäude nach GFK"/>
      <rule key="{28d7031b-8384-4616-b2c4-441361f1c56e}" symbol="2" filter="&quot;alt_rel&quot; = 0" label="Unbeheizte Gebäude nach GFK"/>
    </rules>
    <symbols>
      <symbol name="0" alpha="0.5" clip_to_extent="1" force_rhr="0" type="fill">
        <layer locked="0" class="SimpleFill" enabled="1" pass="0">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="0,255,0,255"/>
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
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="1" alpha="1" clip_to_extent="1" force_rhr="0" type="fill">
        <layer locked="0" class="SimpleFill" enabled="1" pass="0">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="255,230,1,255"/>
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
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol name="2" alpha="1" clip_to_extent="1" force_rhr="0" type="fill">
        <layer locked="0" class="SimpleFill" enabled="1" pass="0">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="217,217,217,255"/>
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
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <labeling type="rule-based">
    <rules key="{37b69743-1532-46e2-9720-ab659b296a47}">
      <rule key="{5e500e62-aeac-48dd-a7f5-09eeacff81b9}" scalemaxdenom="1251">
        <settings calloutType="simple">
          <text-style fontSizeMapUnitScale="3x:0,0,0,0,0,0" isExpression="0" useSubstitutions="0" fontStrikeout="0" fontKerning="1" namedStyle="Regular" previewBkgrdColor="255,255,255,255" fontLetterSpacing="0" fontItalic="0" fieldName="GFK_text" fontSizeUnit="Point" textColor="0,0,0,255" fontSize="8" fontWordSpacing="0" multilineHeight="1" textOpacity="1" fontWeight="50" fontFamily="Noto Sans" fontUnderline="0" fontCapitals="0" textOrientation="horizontal" blendMode="0">
            <text-buffer bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferSizeUnits="MM" bufferBlendMode="0" bufferSize="1" bufferColor="255,255,255,255" bufferOpacity="1" bufferDraw="1" bufferJoinStyle="128" bufferNoFill="1"/>
            <background shapeRotationType="0" shapeSizeType="0" shapeRadiiX="0" shapeRadiiY="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeRotation="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetX="0" shapeBorderWidthUnit="MM" shapeFillColor="255,255,255,255" shapeDraw="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeOffsetUnit="MM" shapeSizeUnit="MM" shapeType="0" shapeRadiiUnit="MM" shapeSizeX="0" shapeBorderColor="128,128,128,255" shapeSizeY="0" shapeBorderWidth="0" shapeBlendMode="0" shapeSVGFile="" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetY="0" shapeOpacity="1">
              <symbol name="markerSymbol" alpha="1" clip_to_extent="1" force_rhr="0" type="marker">
                <layer locked="0" class="SimpleMarker" enabled="1" pass="0">
                  <prop k="angle" v="0"/>
                  <prop k="color" v="125,139,143,255"/>
                  <prop k="horizontal_anchor_point" v="1"/>
                  <prop k="joinstyle" v="bevel"/>
                  <prop k="name" v="circle"/>
                  <prop k="offset" v="0,0"/>
                  <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                  <prop k="offset_unit" v="MM"/>
                  <prop k="outline_color" v="35,35,35,255"/>
                  <prop k="outline_style" v="solid"/>
                  <prop k="outline_width" v="0"/>
                  <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                  <prop k="outline_width_unit" v="MM"/>
                  <prop k="scale_method" v="diameter"/>
                  <prop k="size" v="2"/>
                  <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                  <prop k="size_unit" v="MM"/>
                  <prop k="vertical_anchor_point" v="1"/>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option name="name" type="QString" value=""/>
                      <Option name="properties"/>
                      <Option name="type" type="QString" value="collection"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </background>
            <shadow shadowOffsetGlobal="1" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadius="1.5" shadowDraw="0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOpacity="0.7" shadowUnder="0" shadowOffsetDist="1" shadowOffsetAngle="135" shadowColor="0,0,0,255" shadowOffsetUnit="MM" shadowRadiusAlphaOnly="0" shadowBlendMode="6" shadowRadiusUnit="MM" shadowScale="100"/>
            <dd_properties>
              <Option type="Map">
                <Option name="name" type="QString" value=""/>
                <Option name="properties"/>
                <Option name="type" type="QString" value="collection"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format rightDirectionSymbol=">" wrapChar="" multilineAlign="0" reverseDirectionSymbol="0" autoWrapLength="0" addDirectionSymbol="0" leftDirectionSymbol="&lt;" formatNumbers="0" decimals="3" plussign="0" placeDirectionSymbol="0" useMaxLineLengthForAutoWrap="1"/>
          <placement rotationAngle="0" layerType="PolygonGeometry" centroidInside="0" maxCurvedCharAngleOut="-25" quadOffset="4" dist="0" fitInPolygonOnly="0" maxCurvedCharAngleIn="25" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" repeatDistance="0" placement="0" centroidWhole="0" overrunDistanceUnit="MM" distUnits="MM" distMapUnitScale="3x:0,0,0,0,0,0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" geometryGenerator="" preserveRotation="1" geometryGeneratorEnabled="0" yOffset="0" repeatDistanceUnits="MM" placementFlags="10" xOffset="0" offsetUnits="MM" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" geometryGeneratorType="PointGeometry" offsetType="0" overrunDistance="0" priority="5"/>
          <rendering obstacleType="0" obstacleFactor="1" obstacle="1" scaleMin="0" mergeLines="0" drawLabels="1" limitNumLabels="0" scaleMax="0" fontMaxPixelSize="10000" maxNumLabels="2000" minFeatureSize="0" fontLimitPixelSize="0" labelPerPart="0" fontMinPixelSize="3" upsidedownLabels="0" zIndex="0" displayAll="0" scaleVisibility="0"/>
          <dd_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option name="anchorPoint" type="QString" value="pole_of_inaccessibility"/>
              <Option name="ddProperties" type="Map">
                <Option name="name" type="QString" value=""/>
                <Option name="properties"/>
                <Option name="type" type="QString" value="collection"/>
              </Option>
              <Option name="drawToAllParts" type="bool" value="false"/>
              <Option name="enabled" type="QString" value="0"/>
              <Option name="lineSymbol" type="QString" value="&lt;symbol name=&quot;symbol&quot; alpha=&quot;1&quot; clip_to_extent=&quot;1&quot; force_rhr=&quot;0&quot; type=&quot;line&quot;>&lt;layer locked=&quot;0&quot; class=&quot;SimpleLine&quot; enabled=&quot;1&quot; pass=&quot;0&quot;>&lt;prop k=&quot;capstyle&quot; v=&quot;square&quot;/>&lt;prop k=&quot;customdash&quot; v=&quot;5;2&quot;/>&lt;prop k=&quot;customdash_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;prop k=&quot;customdash_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;draw_inside_polygon&quot; v=&quot;0&quot;/>&lt;prop k=&quot;joinstyle&quot; v=&quot;bevel&quot;/>&lt;prop k=&quot;line_color&quot; v=&quot;60,60,60,255&quot;/>&lt;prop k=&quot;line_style&quot; v=&quot;solid&quot;/>&lt;prop k=&quot;line_width&quot; v=&quot;0.3&quot;/>&lt;prop k=&quot;line_width_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;offset&quot; v=&quot;0&quot;/>&lt;prop k=&quot;offset_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;prop k=&quot;offset_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;ring_filter&quot; v=&quot;0&quot;/>&lt;prop k=&quot;use_custom_dash&quot; v=&quot;0&quot;/>&lt;prop k=&quot;width_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; type=&quot;QString&quot; value=&quot;&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; type=&quot;QString&quot; value=&quot;collection&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>"/>
              <Option name="minLength" type="double" value="0"/>
              <Option name="minLengthMapUnitScale" type="QString" value="3x:0,0,0,0,0,0"/>
              <Option name="minLengthUnit" type="QString" value="MM"/>
              <Option name="offsetFromAnchor" type="double" value="0"/>
              <Option name="offsetFromAnchorMapUnitScale" type="QString" value="3x:0,0,0,0,0,0"/>
              <Option name="offsetFromAnchorUnit" type="QString" value="MM"/>
              <Option name="offsetFromLabel" type="double" value="0"/>
              <Option name="offsetFromLabelMapUnitScale" type="QString" value="3x:0,0,0,0,0,0"/>
              <Option name="offsetFromLabelUnit" type="QString" value="MM"/>
            </Option>
          </callout>
        </settings>
      </rule>
    </rules>
  </labeling>
  <customproperties>
    <property key="dualview/previewExpressions" value="AGS"/>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory barWidth="5" scaleDependency="Area" minScaleDenominator="0" enabled="0" penColor="#000000" minimumSize="0" scaleBasedVisibility="0" penWidth="0" height="15" penAlpha="255" sizeScale="3x:0,0,0,0,0,0" lineSizeType="MM" lineSizeScale="3x:0,0,0,0,0,0" maxScaleDenominator="1e+08" backgroundAlpha="255" labelPlacementMethod="XHeight" diagramOrientation="Up" width="15" sizeType="MM" backgroundColor="#ffffff" opacity="1" rotationOffset="270">
      <fontProperties description="Noto Sans,9,-1,5,50,0,0,0,0,0" style=""/>
      <attribute color="#000000" field="" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings obstacle="0" placement="1" priority="0" showAll="1" zIndex="0" linePlacementFlags="18" dist="0">
    <properties>
      <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration type="Map">
      <Option name="QgsGeometryGapCheck" type="Map">
        <Option name="allowedGapsBuffer" type="double" value="0"/>
        <Option name="allowedGapsEnabled" type="bool" value="false"/>
        <Option name="allowedGapsLayer" type="QString" value=""/>
      </Option>
    </checkConfiguration>
  </geometryOptions>
  <fieldConfiguration>
    <field name="fid">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="AGS">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="OI">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="GFK">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="AKTUALITAE">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="GFK_text">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Centroid">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Gitterzellen_ID">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="zensus">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="alt_rel">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="BAUJAHR_MZ">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="HEIZTYP">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="fid"/>
    <alias name="" index="1" field="AGS"/>
    <alias name="" index="2" field="OI"/>
    <alias name="" index="3" field="GFK"/>
    <alias name="" index="4" field="AKTUALITAE"/>
    <alias name="" index="5" field="GFK_text"/>
    <alias name="" index="6" field="Centroid"/>
    <alias name="" index="7" field="Gitterzellen_ID"/>
    <alias name="" index="8" field="zensus"/>
    <alias name="" index="9" field="alt_rel"/>
    <alias name="" index="10" field="BAUJAHR_MZ"/>
    <alias name="" index="11" field="HEIZTYP"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default applyOnUpdate="0" field="fid" expression=""/>
    <default applyOnUpdate="0" field="AGS" expression=""/>
    <default applyOnUpdate="0" field="OI" expression=""/>
    <default applyOnUpdate="0" field="GFK" expression=""/>
    <default applyOnUpdate="0" field="AKTUALITAE" expression=""/>
    <default applyOnUpdate="0" field="GFK_text" expression=""/>
    <default applyOnUpdate="0" field="Centroid" expression=""/>
    <default applyOnUpdate="0" field="Gitterzellen_ID" expression=""/>
    <default applyOnUpdate="0" field="zensus" expression=""/>
    <default applyOnUpdate="0" field="alt_rel" expression=""/>
    <default applyOnUpdate="0" field="BAUJAHR_MZ" expression=""/>
    <default applyOnUpdate="0" field="HEIZTYP" expression=""/>
  </defaults>
  <constraints>
    <constraint notnull_strength="1" unique_strength="1" exp_strength="0" constraints="3" field="fid"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="AGS"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="OI"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="GFK"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="AKTUALITAE"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="GFK_text"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="Centroid"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="Gitterzellen_ID"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="zensus"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="alt_rel"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="BAUJAHR_MZ"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="HEIZTYP"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" exp="" field="fid"/>
    <constraint desc="" exp="" field="AGS"/>
    <constraint desc="" exp="" field="OI"/>
    <constraint desc="" exp="" field="GFK"/>
    <constraint desc="" exp="" field="AKTUALITAE"/>
    <constraint desc="" exp="" field="GFK_text"/>
    <constraint desc="" exp="" field="Centroid"/>
    <constraint desc="" exp="" field="Gitterzellen_ID"/>
    <constraint desc="" exp="" field="zensus"/>
    <constraint desc="" exp="" field="alt_rel"/>
    <constraint desc="" exp="" field="BAUJAHR_MZ"/>
    <constraint desc="" exp="" field="HEIZTYP"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="0" sortExpression="&quot;GFK&quot;">
    <columns>
      <column hidden="0" name="AGS" width="101" type="field"/>
      <column hidden="0" name="OI" width="160" type="field"/>
      <column hidden="0" name="GFK" width="84" type="field"/>
      <column hidden="0" name="AKTUALITAE" width="72" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
      <column hidden="0" name="fid" width="46" type="field"/>
      <column hidden="0" name="Centroid" width="-1" type="field"/>
      <column hidden="0" name="Gitterzellen_ID" width="-1" type="field"/>
      <column hidden="0" name="BAUJAHR_MZ" width="-1" type="field"/>
      <column hidden="0" name="GFK_text" width="210" type="field"/>
      <column hidden="0" name="alt_rel" width="38" type="field"/>
      <column hidden="0" name="zensus" width="38" type="field"/>
      <column hidden="0" name="HEIZTYP" width="-1" type="field"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
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
    <field name="AGS" editable="1"/>
    <field name="AKTUALITAE" editable="1"/>
    <field name="BAUJAHR_MZ" editable="1"/>
    <field name="Centroid" editable="1"/>
    <field name="GFK" editable="1"/>
    <field name="GFK_text" editable="1"/>
    <field name="Gitterzellen_ID" editable="1"/>
    <field name="HEIZTYP" editable="1"/>
    <field name="OI" editable="1"/>
    <field name="alt_rel" editable="1"/>
    <field name="fid" editable="1"/>
    <field name="zensus" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="AGS" labelOnTop="0"/>
    <field name="AKTUALITAE" labelOnTop="0"/>
    <field name="BAUJAHR_MZ" labelOnTop="0"/>
    <field name="Centroid" labelOnTop="0"/>
    <field name="GFK" labelOnTop="0"/>
    <field name="GFK_text" labelOnTop="0"/>
    <field name="Gitterzellen_ID" labelOnTop="0"/>
    <field name="HEIZTYP" labelOnTop="0"/>
    <field name="OI" labelOnTop="0"/>
    <field name="alt_rel" labelOnTop="0"/>
    <field name="fid" labelOnTop="0"/>
    <field name="zensus" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>AGS</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
