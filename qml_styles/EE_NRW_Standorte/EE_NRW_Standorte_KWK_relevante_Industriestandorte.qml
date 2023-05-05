<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis labelsEnabled="0" readOnly="0" simplifyLocal="1" version="3.10.4-A Coruña" simplifyDrawingHints="0" hasScaleBasedVisibilityFlag="0" minScale="1e+08" simplifyMaxScale="1" maxScale="0" simplifyAlgorithm="0" simplifyDrawingTol="1" styleCategories="AllStyleCategories">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 forceraster="0" enableorderby="0" symbollevels="0" type="singleSymbol">
    <symbols>
      <symbol name="0" alpha="1" clip_to_extent="1" force_rhr="0" type="marker">
        <layer locked="0" class="SimpleMarker" enabled="1" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="205,77,255,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="diamond"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="128,17,25,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.4"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="4"/>
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
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties>
    <property key="dualview/previewExpressions" value="fid"/>
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
  <DiagramLayerSettings obstacle="0" placement="0" priority="0" showAll="1" zIndex="0" linePlacementFlags="18" dist="0">
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
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="fid">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="OBJECTID">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Unternehmen">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="UTM32_Ost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="UTM32_Nord">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Prozesswärmebedarf [GWh/a]">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Stand">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="fid"/>
    <alias name="" index="1" field="OBJECTID"/>
    <alias name="" index="2" field="Unternehmen"/>
    <alias name="" index="3" field="UTM32_Ost"/>
    <alias name="" index="4" field="UTM32_Nord"/>
    <alias name="" index="5" field="Prozesswärmebedarf [GWh/a]"/>
    <alias name="" index="6" field="Stand"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default applyOnUpdate="0" field="fid" expression=""/>
    <default applyOnUpdate="0" field="OBJECTID" expression=""/>
    <default applyOnUpdate="0" field="Unternehmen" expression=""/>
    <default applyOnUpdate="0" field="UTM32_Ost" expression=""/>
    <default applyOnUpdate="0" field="UTM32_Nord" expression=""/>
    <default applyOnUpdate="0" field="Prozesswärmebedarf [GWh/a]" expression=""/>
    <default applyOnUpdate="0" field="Stand" expression=""/>
  </defaults>
  <constraints>
    <constraint notnull_strength="1" unique_strength="1" exp_strength="0" constraints="3" field="fid"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="OBJECTID"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="Unternehmen"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="UTM32_Ost"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="UTM32_Nord"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="Prozesswärmebedarf [GWh/a]"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="Stand"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" exp="" field="fid"/>
    <constraint desc="" exp="" field="OBJECTID"/>
    <constraint desc="" exp="" field="Unternehmen"/>
    <constraint desc="" exp="" field="UTM32_Ost"/>
    <constraint desc="" exp="" field="UTM32_Nord"/>
    <constraint desc="" exp="" field="Prozesswärmebedarf [GWh/a]"/>
    <constraint desc="" exp="" field="Stand"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="0" sortExpression="">
    <columns>
      <column hidden="0" name="fid" width="-1" type="field"/>
      <column hidden="0" name="OBJECTID" width="-1" type="field"/>
      <column hidden="0" name="Unternehmen" width="184" type="field"/>
      <column hidden="0" name="UTM32_Ost" width="-1" type="field"/>
      <column hidden="0" name="UTM32_Nord" width="-1" type="field"/>
      <column hidden="0" name="Prozesswärmebedarf [GWh/a]" width="180" type="field"/>
      <column hidden="0" name="Stand" width="-1" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
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
    <field name="OBJECTID" editable="1"/>
    <field name="Prozesswärmebedarf [GWh/a]" editable="1"/>
    <field name="Stand" editable="1"/>
    <field name="UTM32_Nord" editable="1"/>
    <field name="UTM32_Ost" editable="1"/>
    <field name="Unternehmen" editable="1"/>
    <field name="fid" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="OBJECTID" labelOnTop="0"/>
    <field name="Prozesswärmebedarf [GWh/a]" labelOnTop="0"/>
    <field name="Stand" labelOnTop="0"/>
    <field name="UTM32_Nord" labelOnTop="0"/>
    <field name="UTM32_Ost" labelOnTop="0"/>
    <field name="Unternehmen" labelOnTop="0"/>
    <field name="fid" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>fid</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
