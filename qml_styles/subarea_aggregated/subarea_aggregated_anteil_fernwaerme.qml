<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis labelsEnabled="0" readOnly="0" simplifyLocal="1" version="3.10.4-A Coruña" simplifyDrawingHints="1" hasScaleBasedVisibilityFlag="0" minScale="1e+08" simplifyMaxScale="1" maxScale="0" simplifyAlgorithm="0" simplifyDrawingTol="1" styleCategories="AllStyleCategories">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 forceraster="0" enableorderby="0" symbollevels="0" type="RuleRenderer">
    <rules key="{af5d7592-652b-43f2-a8dc-778627e8a4d6}">
      <rule key="{48bb13cb-9292-4323-bba7-268cc304c402}" symbol="0" checkstate="0" label="Anteil Fernwärme in %">
        <rule key="{f2aa7bc0-b207-4b12-8686-8d2d686a4b30}" symbol="1" filter="0 &lt;= ( 100 * &quot;Fernwärme&quot; /   &quot;beheizte_WonGeb_sum_ALKIS&quot;  ) AND  ( 100 * &quot;Fernwärme&quot; /   &quot;beheizte_WonGeb_sum_ALKIS&quot;  ) &lt; 5" checkstate="0" label="Fernwärmeanteil 0 bis 5 %"/>
        <rule key="{6cc09977-8c45-4e90-b6fc-5c1970b12dc2}" symbol="2" filter="5 &lt;= ( 100 * &quot;Fernwärme&quot; /  &quot;beheizte_WonGeb_sum_ALKIS&quot; ) AND  ( 100 * &quot;Fernwärme&quot; /   &quot;beheizte_WonGeb_sum_ALKIS&quot;  ) &lt; 10" label="Fernwärmeanteil 5 bis 10 %"/>
        <rule key="{7f5b0e2b-ff60-4851-8412-463593d259d8}" symbol="3" filter="10 &lt;= ( 100 * &quot;Fernwärme&quot; /  &quot;beheizte_WonGeb_sum_ALKIS&quot; ) AND  ( 100 * &quot;Fernwärme&quot; /   &quot;beheizte_WonGeb_sum_ALKIS&quot;  ) &lt; 15" label="Fernwärmeanteil 10 bis 15 %"/>
        <rule key="{e345b859-7880-4e17-bea7-555a7add65df}" symbol="4" filter="15 &lt;= ( 100 * &quot;Fernwärme&quot; /  &quot;beheizte_WonGeb_sum_ALKIS&quot; ) AND  ( 100 * &quot;Fernwärme&quot; /   &quot;beheizte_WonGeb_sum_ALKIS&quot;  ) &lt; 20" label="Fernwärmeanteil 15 bis 20 %"/>
        <rule key="{267da3e2-4f0b-47bb-bcab-9649df8aae79}" symbol="5" filter=" ( 100 * &quot;Fernwärme&quot; /  &quot;beheizte_WonGeb_sum_ALKIS&quot; ) > 20" label="Fernwärmeanteil größer gleich 20 %"/>
      </rule>
    </rules>
    <symbols>
      <symbol name="0" alpha="1" clip_to_extent="1" force_rhr="0" type="fill">
        <layer locked="0" class="SimpleFill" enabled="1" pass="0">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="213,180,60,255"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.26"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="style" v="no"/>
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
          <prop k="color" v="255,255,255,255"/>
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
          <prop k="color" v="255,191,191,255"/>
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
      <symbol name="3" alpha="1" clip_to_extent="1" force_rhr="0" type="fill">
        <layer locked="0" class="SimpleFill" enabled="1" pass="0">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="255,127,127,255"/>
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
      <symbol name="4" alpha="1" clip_to_extent="1" force_rhr="0" type="fill">
        <layer locked="0" class="SimpleFill" enabled="1" pass="0">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="255,64,64,255"/>
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
      <symbol name="5" alpha="1" clip_to_extent="1" force_rhr="0" type="fill">
        <layer locked="0" class="SimpleFill" enabled="1" pass="0">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="255,0,0,255"/>
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
    <field name="BAUBLOCK">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="FLAECHE">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="alle_Geb_sum_ALKIS">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="beheizte_WonGeb_sum_ALKIS">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="beheizte_NichtWohnGeb_sum_ALKIS">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="unbeheizte_Geb_sum_ALKIS">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="BauVor1919">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Bau1919_48">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Bau1948_78">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Bau1979_86">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Bau1987_90">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Bau1991_95">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Bau1996_00">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Bau2001_04">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Bau2005_08">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="BauNac2008">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Fernwärme">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="EtagenHeiz">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="BlockHeiz">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ZentrlHeiz">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="1+Raumöfen">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="KeineHeiz">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Geb_sum_LANUV">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="WBabsMWh/a_whole_subarea">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="WB_kWh/m2a_per_subarea">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="fid"/>
    <alias name="" index="1" field="BAUBLOCK"/>
    <alias name="" index="2" field="FLAECHE"/>
    <alias name="" index="3" field="alle_Geb_sum_ALKIS"/>
    <alias name="" index="4" field="beheizte_WonGeb_sum_ALKIS"/>
    <alias name="" index="5" field="beheizte_NichtWohnGeb_sum_ALKIS"/>
    <alias name="" index="6" field="unbeheizte_Geb_sum_ALKIS"/>
    <alias name="" index="7" field="BauVor1919"/>
    <alias name="" index="8" field="Bau1919_48"/>
    <alias name="" index="9" field="Bau1948_78"/>
    <alias name="" index="10" field="Bau1979_86"/>
    <alias name="" index="11" field="Bau1987_90"/>
    <alias name="" index="12" field="Bau1991_95"/>
    <alias name="" index="13" field="Bau1996_00"/>
    <alias name="" index="14" field="Bau2001_04"/>
    <alias name="" index="15" field="Bau2005_08"/>
    <alias name="" index="16" field="BauNac2008"/>
    <alias name="" index="17" field="Fernwärme"/>
    <alias name="" index="18" field="EtagenHeiz"/>
    <alias name="" index="19" field="BlockHeiz"/>
    <alias name="" index="20" field="ZentrlHeiz"/>
    <alias name="" index="21" field="1+Raumöfen"/>
    <alias name="" index="22" field="KeineHeiz"/>
    <alias name="" index="23" field="Geb_sum_LANUV"/>
    <alias name="" index="24" field="WBabsMWh/a_whole_subarea"/>
    <alias name="" index="25" field="WB_kWh/m2a_per_subarea"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default applyOnUpdate="0" field="fid" expression=""/>
    <default applyOnUpdate="0" field="BAUBLOCK" expression=""/>
    <default applyOnUpdate="0" field="FLAECHE" expression=""/>
    <default applyOnUpdate="0" field="alle_Geb_sum_ALKIS" expression=""/>
    <default applyOnUpdate="0" field="beheizte_WonGeb_sum_ALKIS" expression=""/>
    <default applyOnUpdate="0" field="beheizte_NichtWohnGeb_sum_ALKIS" expression=""/>
    <default applyOnUpdate="0" field="unbeheizte_Geb_sum_ALKIS" expression=""/>
    <default applyOnUpdate="0" field="BauVor1919" expression=""/>
    <default applyOnUpdate="0" field="Bau1919_48" expression=""/>
    <default applyOnUpdate="0" field="Bau1948_78" expression=""/>
    <default applyOnUpdate="0" field="Bau1979_86" expression=""/>
    <default applyOnUpdate="0" field="Bau1987_90" expression=""/>
    <default applyOnUpdate="0" field="Bau1991_95" expression=""/>
    <default applyOnUpdate="0" field="Bau1996_00" expression=""/>
    <default applyOnUpdate="0" field="Bau2001_04" expression=""/>
    <default applyOnUpdate="0" field="Bau2005_08" expression=""/>
    <default applyOnUpdate="0" field="BauNac2008" expression=""/>
    <default applyOnUpdate="0" field="Fernwärme" expression=""/>
    <default applyOnUpdate="0" field="EtagenHeiz" expression=""/>
    <default applyOnUpdate="0" field="BlockHeiz" expression=""/>
    <default applyOnUpdate="0" field="ZentrlHeiz" expression=""/>
    <default applyOnUpdate="0" field="1+Raumöfen" expression=""/>
    <default applyOnUpdate="0" field="KeineHeiz" expression=""/>
    <default applyOnUpdate="0" field="Geb_sum_LANUV" expression=""/>
    <default applyOnUpdate="0" field="WBabsMWh/a_whole_subarea" expression=""/>
    <default applyOnUpdate="0" field="WB_kWh/m2a_per_subarea" expression=""/>
  </defaults>
  <constraints>
    <constraint notnull_strength="1" unique_strength="1" exp_strength="0" constraints="3" field="fid"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="BAUBLOCK"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="FLAECHE"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="alle_Geb_sum_ALKIS"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="beheizte_WonGeb_sum_ALKIS"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="beheizte_NichtWohnGeb_sum_ALKIS"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="unbeheizte_Geb_sum_ALKIS"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="BauVor1919"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="Bau1919_48"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="Bau1948_78"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="Bau1979_86"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="Bau1987_90"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="Bau1991_95"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="Bau1996_00"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="Bau2001_04"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="Bau2005_08"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="BauNac2008"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="Fernwärme"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="EtagenHeiz"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="BlockHeiz"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="ZentrlHeiz"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="1+Raumöfen"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="KeineHeiz"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="Geb_sum_LANUV"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="WBabsMWh/a_whole_subarea"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0" field="WB_kWh/m2a_per_subarea"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" exp="" field="fid"/>
    <constraint desc="" exp="" field="BAUBLOCK"/>
    <constraint desc="" exp="" field="FLAECHE"/>
    <constraint desc="" exp="" field="alle_Geb_sum_ALKIS"/>
    <constraint desc="" exp="" field="beheizte_WonGeb_sum_ALKIS"/>
    <constraint desc="" exp="" field="beheizte_NichtWohnGeb_sum_ALKIS"/>
    <constraint desc="" exp="" field="unbeheizte_Geb_sum_ALKIS"/>
    <constraint desc="" exp="" field="BauVor1919"/>
    <constraint desc="" exp="" field="Bau1919_48"/>
    <constraint desc="" exp="" field="Bau1948_78"/>
    <constraint desc="" exp="" field="Bau1979_86"/>
    <constraint desc="" exp="" field="Bau1987_90"/>
    <constraint desc="" exp="" field="Bau1991_95"/>
    <constraint desc="" exp="" field="Bau1996_00"/>
    <constraint desc="" exp="" field="Bau2001_04"/>
    <constraint desc="" exp="" field="Bau2005_08"/>
    <constraint desc="" exp="" field="BauNac2008"/>
    <constraint desc="" exp="" field="Fernwärme"/>
    <constraint desc="" exp="" field="EtagenHeiz"/>
    <constraint desc="" exp="" field="BlockHeiz"/>
    <constraint desc="" exp="" field="ZentrlHeiz"/>
    <constraint desc="" exp="" field="1+Raumöfen"/>
    <constraint desc="" exp="" field="KeineHeiz"/>
    <constraint desc="" exp="" field="Geb_sum_LANUV"/>
    <constraint desc="" exp="" field="WBabsMWh/a_whole_subarea"/>
    <constraint desc="" exp="" field="WB_kWh/m2a_per_subarea"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="0" sortExpression="">
    <columns>
      <column hidden="0" name="fid" width="-1" type="field"/>
      <column hidden="0" name="BAUBLOCK" width="-1" type="field"/>
      <column hidden="0" name="FLAECHE" width="-1" type="field"/>
      <column hidden="0" name="BauVor1919" width="-1" type="field"/>
      <column hidden="0" name="Bau1919_48" width="-1" type="field"/>
      <column hidden="0" name="Bau1948_78" width="-1" type="field"/>
      <column hidden="0" name="Bau1979_86" width="-1" type="field"/>
      <column hidden="0" name="Bau1987_90" width="-1" type="field"/>
      <column hidden="0" name="Bau1991_95" width="-1" type="field"/>
      <column hidden="0" name="Bau1996_00" width="-1" type="field"/>
      <column hidden="0" name="Bau2001_04" width="-1" type="field"/>
      <column hidden="0" name="Bau2005_08" width="-1" type="field"/>
      <column hidden="0" name="BauNac2008" width="-1" type="field"/>
      <column hidden="0" name="Fernwärme" width="-1" type="field"/>
      <column hidden="0" name="EtagenHeiz" width="-1" type="field"/>
      <column hidden="0" name="BlockHeiz" width="-1" type="field"/>
      <column hidden="0" name="ZentrlHeiz" width="-1" type="field"/>
      <column hidden="0" name="1+Raumöfen" width="-1" type="field"/>
      <column hidden="0" name="KeineHeiz" width="-1" type="field"/>
      <column hidden="0" name="Geb_sum_LANUV" width="-1" type="field"/>
      <column hidden="0" name="WBabsMWh/a_whole_subarea" width="-1" type="field"/>
      <column hidden="0" name="WB_kWh/m2a_per_subarea" width="-1" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
      <column hidden="0" name="alle_Geb_sum_ALKIS" width="-1" type="field"/>
      <column hidden="0" name="beheizte_WonGeb_sum_ALKIS" width="-1" type="field"/>
      <column hidden="0" name="beheizte_NichtWohnGeb_sum_ALKIS" width="-1" type="field"/>
      <column hidden="0" name="unbeheizte_Geb_sum_ALKIS" width="-1" type="field"/>
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
    <field name="1+Raumöfen" editable="1"/>
    <field name="BAUBLOCK" editable="1"/>
    <field name="Bau1919_48" editable="1"/>
    <field name="Bau1948_78" editable="1"/>
    <field name="Bau1979_86" editable="1"/>
    <field name="Bau1987_90" editable="1"/>
    <field name="Bau1991_95" editable="1"/>
    <field name="Bau1996_00" editable="1"/>
    <field name="Bau2001_04" editable="1"/>
    <field name="Bau2005_08" editable="1"/>
    <field name="BauNac2008" editable="1"/>
    <field name="BauVor1919" editable="1"/>
    <field name="BlockHeiz" editable="1"/>
    <field name="EtagenHeiz" editable="1"/>
    <field name="FLAECHE" editable="1"/>
    <field name="Fernwärme" editable="1"/>
    <field name="Geb_sum_LANUV" editable="1"/>
    <field name="KeineHeiz" editable="1"/>
    <field name="WB_kWh/m2a_per_subarea" editable="1"/>
    <field name="WBabsMWh/a_whole_subarea" editable="1"/>
    <field name="ZentrlHeiz" editable="1"/>
    <field name="alle_Geb_sum_ALKIS" editable="1"/>
    <field name="beheizte_NichtWohnGeb_sum_ALKIS" editable="1"/>
    <field name="beheizte_WonGeb_sum_ALKIS" editable="1"/>
    <field name="fid" editable="1"/>
    <field name="unbeheizte_Geb_sum_ALKIS" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="1+Raumöfen" labelOnTop="0"/>
    <field name="BAUBLOCK" labelOnTop="0"/>
    <field name="Bau1919_48" labelOnTop="0"/>
    <field name="Bau1948_78" labelOnTop="0"/>
    <field name="Bau1979_86" labelOnTop="0"/>
    <field name="Bau1987_90" labelOnTop="0"/>
    <field name="Bau1991_95" labelOnTop="0"/>
    <field name="Bau1996_00" labelOnTop="0"/>
    <field name="Bau2001_04" labelOnTop="0"/>
    <field name="Bau2005_08" labelOnTop="0"/>
    <field name="BauNac2008" labelOnTop="0"/>
    <field name="BauVor1919" labelOnTop="0"/>
    <field name="BlockHeiz" labelOnTop="0"/>
    <field name="EtagenHeiz" labelOnTop="0"/>
    <field name="FLAECHE" labelOnTop="0"/>
    <field name="Fernwärme" labelOnTop="0"/>
    <field name="Geb_sum_LANUV" labelOnTop="0"/>
    <field name="KeineHeiz" labelOnTop="0"/>
    <field name="WB_kWh/m2a_per_subarea" labelOnTop="0"/>
    <field name="WBabsMWh/a_whole_subarea" labelOnTop="0"/>
    <field name="ZentrlHeiz" labelOnTop="0"/>
    <field name="alle_Geb_sum_ALKIS" labelOnTop="0"/>
    <field name="beheizte_NichtWohnGeb_sum_ALKIS" labelOnTop="0"/>
    <field name="beheizte_WonGeb_sum_ALKIS" labelOnTop="0"/>
    <field name="fid" labelOnTop="0"/>
    <field name="unbeheizte_Geb_sum_ALKIS" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>fid</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
