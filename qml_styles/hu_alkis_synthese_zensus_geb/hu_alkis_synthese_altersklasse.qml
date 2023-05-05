<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis labelsEnabled="1" readOnly="0" simplifyLocal="1" version="3.10.4-A Coruña" simplifyDrawingHints="1" hasScaleBasedVisibilityFlag="0" minScale="1e+08" simplifyMaxScale="1" maxScale="0" simplifyAlgorithm="0" simplifyDrawingTol="1" styleCategories="AllStyleCategories">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 forceraster="0" enableorderby="0" symbollevels="0" type="RuleRenderer">
    <rules key="{07f1ef1c-09a4-48b5-ae41-fa68ae2a3fca}">
      <rule key="{b31f111a-b111-41dc-9d47-8fa58dda3aa1}" symbol="0" label="BAUJAHR_MZ" scalemaxdenom="20000">
        <rule key="{8aa59ef1-7db0-4fea-92c3-f462634bc634}" symbol="1" filter="&quot;BAUJAHR_MZ&quot; != 'Unbekannt'" label="BAUJAHR_MZ bekannt (single)">
          <rule description="Farbverlauf: FF0000 -> FF8C00 " key="{ba6ef00f-7bae-44fb-bcbb-5a1ebf68704b}" symbol="2" filter=" &quot;BAUJAHR_MZ&quot; = 'BauVor1919' " label="BauVor1919"/>
          <rule description="Farbverlauf: FF0000 -> FF8C00 " key="{c8fc97d3-9673-4e2e-afd1-d3faadc31cf7}" symbol="3" filter=" &quot;BAUJAHR_MZ&quot;  =  'Bau1919_48' " label="Bau1919_48"/>
          <rule description="Farbverlauf: FF0000 -> FF8C00 " key="{ca3e1d7a-1d7a-40f7-8b77-2f0f9a8a8f24}" symbol="4" filter="&quot;BAUJAHR_MZ&quot; =  'Bau1948_78' " label="Bau1948_78"/>
          <rule description="Farbverlauf: FF8C00 " key="{9f9c74e6-f43c-486e-8810-7730e8eaee5f}" symbol="5" filter="&quot;BAUJAHR_MZ&quot; =  'Bau1979_86' " label="Bau1979_86"/>
          <rule description="Farbverlauf: FF8C00 -> C0FF3E" key="{a3d7c8c2-68c4-4687-a42a-4d56d456a8d8}" symbol="6" filter="&quot;BAUJAHR_MZ&quot; =  'Bau1987_90' " label="Bau1987_90"/>
          <rule description="Farbverlauf: FF8C00 -> C0FF3E" key="{63767120-b6a7-48c9-9f58-1cad5a004ebc}" symbol="7" filter=" &quot;BAUJAHR_MZ&quot; =  'Bau1991_95'  " label="Bau1991_95"/>
          <rule description="Farbverlauf: FF8C00 -> C0FF3E" key="{ae058f2c-c215-4443-97bf-88d32593051a}" symbol="8" filter="&quot;BAUJAHR_MZ&quot; = 'Bau1996_00' " label="Bau1996_00"/>
          <rule description="Farbverlauf: C0FF3E -> 32CD32" key="{e58e948d-75df-485c-a6c6-e4795003822d}" symbol="9" filter="&quot;BAUJAHR_MZ&quot; =  'Bau2001_04'" label="Bau2001_04"/>
          <rule description="Farbverlauf: C0FF3E -> 32CD32" key="{8729b485-02cb-4694-a6d5-95fd600954e1}" symbol="10" filter="&quot;BAUJAHR_MZ&quot; =  'Bau2005_08'  " label="Bau2005_08"/>
          <rule description="Farbverlauf: C0FF3E -> 32CD32" key="{11c560fc-ccfe-437a-9ce4-e51bd02dbaa1}" symbol="11" filter="&quot;BAUJAHR_MZ&quot; = 'BauNac2008' " label="BauNac2008"/>
        </rule>
        <rule key="{4a8804c7-9b0e-4f80-b718-b7e03b69535c}" symbol="12" filter="&quot;BAUJAHR_MZ&quot; = 'Unbekannt'" label="BAUJAHR_MZ unbekannt (single)">
          <rule description="beheizte Wohngebäude" key="{503035ec-8cd3-4777-99e6-b6cfc13745fc}" symbol="13" filter=" &quot;BAUJAHR_MZ&quot; = 'Unbekannt' and  &quot;zensus&quot; = 1" label="BAUJAHR_MZ unbekannt (beheizte WG)"/>
          <rule description="beheizte Nicht-Wohngebäude" key="{29e5860c-b009-452c-811d-249878f11f5b}" symbol="14" filter=" &quot;BAUJAHR_MZ&quot; = 'Unbekannt' and  &quot;zensus&quot; = 0 and &quot;alt_rel&quot; = 1" label="BAUJAHR_MZ unbekannt (beheizte NWG)"/>
          <rule description="*zuzüglich Schlösser und Burgen" key="{dc820b8e-826b-40d8-910e-086b357acd4e}" symbol="15" filter=" &quot;BAUJAHR_MZ&quot; = 'Unbekannt' and &quot;alt_rel&quot; = 0" label="BAUJAHR_MZ unbekannt (unbeheize G*)"/>
        </rule>
      </rule>
      <rule key="{2c788621-b9ea-4694-9509-88fc8dcced8f}" symbol="16" filter="&quot;BAUJAHR_MZ&quot; != 'Unbekannt'" checkstate="0" label="BAUJAHR_MZ bekannt (total)"/>
    </rules>
    <symbols>
      <symbol name="0" alpha="1" clip_to_extent="1" force_rhr="0" type="fill">
        <layer locked="0" class="SimpleFill" enabled="1" pass="0">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="0,255,217,255"/>
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
          <prop k="color" v="0,255,217,255"/>
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
      <symbol name="10" alpha="1" clip_to_extent="1" force_rhr="0" type="fill">
        <layer locked="0" class="SimpleFill" enabled="1" pass="0">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="107,225,55,255"/>
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
      <symbol name="11" alpha="1" clip_to_extent="1" force_rhr="0" type="fill">
        <layer locked="0" class="SimpleFill" enabled="1" pass="0">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="50,205,50,255"/>
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
      <symbol name="12" alpha="1" clip_to_extent="1" force_rhr="0" type="fill">
        <layer locked="0" class="SimpleFill" enabled="1" pass="0">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="0,255,217,255"/>
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
      <symbol name="13" alpha="1" clip_to_extent="1" force_rhr="0" type="fill">
        <layer locked="0" class="SimpleFill" enabled="1" pass="0">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="67,255,243,255"/>
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
      <symbol name="14" alpha="1" clip_to_extent="1" force_rhr="0" type="fill">
        <layer locked="0" class="SimpleFill" enabled="1" pass="0">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="164,164,164,255"/>
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
      <symbol name="15" alpha="1" clip_to_extent="1" force_rhr="0" type="fill">
        <layer locked="0" class="SimpleFill" enabled="1" pass="0">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="233,233,233,255"/>
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
      <symbol name="16" alpha="1" clip_to_extent="1" force_rhr="0" type="fill">
        <layer locked="0" class="SimpleFill" enabled="1" pass="0">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="247,1,255,255"/>
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
      <symbol name="3" alpha="1" clip_to_extent="1" force_rhr="0" type="fill">
        <layer locked="0" class="SimpleFill" enabled="1" pass="0">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="255,42,0,255"/>
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
          <prop k="color" v="255,84,0,255"/>
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
          <prop k="color" v="255,140,0,255"/>
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
      <symbol name="6" alpha="1" clip_to_extent="1" force_rhr="0" type="fill">
        <layer locked="0" class="SimpleFill" enabled="1" pass="0">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="236,175,19,255"/>
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
      <symbol name="7" alpha="1" clip_to_extent="1" force_rhr="0" type="fill">
        <layer locked="0" class="SimpleFill" enabled="1" pass="0">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="217,209,37,255"/>
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
      <symbol name="8" alpha="1" clip_to_extent="1" force_rhr="0" type="fill">
        <layer locked="0" class="SimpleFill" enabled="1" pass="0">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="198,244,56,255"/>
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
      <symbol name="9" alpha="1" clip_to_extent="1" force_rhr="0" type="fill">
        <layer locked="0" class="SimpleFill" enabled="1" pass="0">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="149,240,58,255"/>
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
    <rules key="{96bebe63-220b-4a43-98d0-65d2dbd57a14}">
      <rule key="{74db6ce7-3176-4be7-87b3-262af20d9ab4}" scalemaxdenom="1001">
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
