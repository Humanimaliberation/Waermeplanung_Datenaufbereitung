<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" version="3.10.4-A Coruña" simplifyDrawingTol="1" styleCategories="AllStyleCategories" simplifyAlgorithm="0" hasScaleBasedVisibilityFlag="0" simplifyMaxScale="1" simplifyLocal="1" minScale="1e+08" simplifyDrawingHints="1" readOnly="0" labelsEnabled="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 forceraster="0" type="RuleRenderer" enableorderby="0" symbollevels="0">
    <rules key="{07f1ef1c-09a4-48b5-ae41-fa68ae2a3fca}">
      <rule key="{00c25f01-99be-482f-a401-ba9db4353630}" symbol="0" label="BAUJAHR_MZ (total)" checkstate="0">
        <rule key="{c4e6e295-f293-4f1f-a3fa-1e5ad454bb67}" symbol="1" label="BAUJAHR_MZ bekannt (total)" filter="&quot;BAUJAHR_MZ&quot; != 'Unbekannt'"/>
        <rule key="{eb31b644-2faf-4611-9f22-c54d7ad3afa8}" symbol="2" label="BAUJAHR_MZ unbekannt (total)" filter=" &quot;BAUJAHR_MZ&quot; = 'Unbekannt'"/>
      </rule>
      <rule key="{b31f111a-b111-41dc-9d47-8fa58dda3aa1}" symbol="3" label="BAUJAHR_MZ (single)">
        <rule key="{8aa59ef1-7db0-4fea-92c3-f462634bc634}" symbol="4" label="BAUJAHR_MZ bekannt (single)" filter="&quot;BAUJAHR_MZ&quot; != 'Unbekannt'">
          <rule key="{ba6ef00f-7bae-44fb-bcbb-5a1ebf68704b}" symbol="5" label="BauVor1919" filter=" &quot;BAUJAHR_MZ&quot; = 'BauVor1919' " description="Farbverlauf: FF0000 -> FF8C00 "/>
          <rule key="{c8fc97d3-9673-4e2e-afd1-d3faadc31cf7}" symbol="6" label="Bau1919_48" filter=" &quot;BAUJAHR_MZ&quot;  =  'Bau1919_48' " description="Farbverlauf: FF0000 -> FF8C00 "/>
          <rule key="{ca3e1d7a-1d7a-40f7-8b77-2f0f9a8a8f24}" symbol="7" label="Bau1948_78" filter="&quot;BAUJAHR_MZ&quot; =  'Bau1948_78' " description="Farbverlauf: FF0000 -> FF8C00 "/>
          <rule key="{9f9c74e6-f43c-486e-8810-7730e8eaee5f}" symbol="8" label="Bau1979_86" filter="&quot;BAUJAHR_MZ&quot; =  'Bau1979_86' " description="Farbverlauf: FF8C00 "/>
          <rule key="{a3d7c8c2-68c4-4687-a42a-4d56d456a8d8}" symbol="9" label="Bau1987_90" filter="&quot;BAUJAHR_MZ&quot; =  'Bau1987_90' " description="Farbverlauf: FF8C00 -> C0FF3E"/>
          <rule key="{63767120-b6a7-48c9-9f58-1cad5a004ebc}" symbol="10" label="Bau1991_95" filter=" &quot;BAUJAHR_MZ&quot; =  'Bau1991_95'  " description="Farbverlauf: FF8C00 -> C0FF3E"/>
          <rule key="{ae058f2c-c215-4443-97bf-88d32593051a}" symbol="11" label="Bau1996_00" filter="&quot;BAUJAHR_MZ&quot; = 'Bau1996_00' " description="Farbverlauf: FF8C00 -> C0FF3E"/>
          <rule key="{e58e948d-75df-485c-a6c6-e4795003822d}" symbol="12" label="Bau2001_04" filter="&quot;BAUJAHR_MZ&quot; =  'Bau2001_04'" description="Farbverlauf: C0FF3E -> 32CD32"/>
          <rule key="{8729b485-02cb-4694-a6d5-95fd600954e1}" symbol="13" label="Bau2005_08" filter="&quot;BAUJAHR_MZ&quot; =  'Bau2005_08'  " description="Farbverlauf: C0FF3E -> 32CD32"/>
          <rule key="{11c560fc-ccfe-437a-9ce4-e51bd02dbaa1}" symbol="14" label="BauNac2008" filter="&quot;BAUJAHR_MZ&quot; = 'BauNac2008' " description="Farbverlauf: C0FF3E -> 32CD32"/>
        </rule>
        <rule key="{4a8804c7-9b0e-4f80-b718-b7e03b69535c}" symbol="15" label="BAUJAHR_MZ unbekannt (single)" filter="&quot;BAUJAHR_MZ&quot; = 'Unbekannt'">
          <rule key="{503035ec-8cd3-4777-99e6-b6cfc13745fc}" symbol="16" label="BAUJAHR_MZ unbekannt (relevant)" filter=" &quot;BAUJAHR_MZ&quot; = 'Unbekannt' and  &quot;alt_rel&quot; = 1"/>
          <rule key="{dc820b8e-826b-40d8-910e-086b357acd4e}" symbol="17" label="BAUJAHR_MZ unbekannt (irrelevant)" filter=" &quot;BAUJAHR_MZ&quot; = 'Unbekannt' and &quot;alt_rel&quot; = 0"/>
        </rule>
      </rule>
    </rules>
    <symbols>
      <symbol clip_to_extent="1" type="fill" alpha="1" force_rhr="0" name="0">
        <layer enabled="1" locked="0" class="SimpleFill" pass="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="0,255,217,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="no" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="fill" alpha="1" force_rhr="0" name="1">
        <layer enabled="1" locked="0" class="SimpleFill" pass="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="0,255,217,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="fill" alpha="1" force_rhr="0" name="10">
        <layer enabled="1" locked="0" class="SimpleFill" pass="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="217,209,37,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="fill" alpha="1" force_rhr="0" name="11">
        <layer enabled="1" locked="0" class="SimpleFill" pass="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="198,244,56,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="fill" alpha="1" force_rhr="0" name="12">
        <layer enabled="1" locked="0" class="SimpleFill" pass="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="149,240,58,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="fill" alpha="1" force_rhr="0" name="13">
        <layer enabled="1" locked="0" class="SimpleFill" pass="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="107,225,55,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="fill" alpha="1" force_rhr="0" name="14">
        <layer enabled="1" locked="0" class="SimpleFill" pass="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="50,205,50,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="fill" alpha="1" force_rhr="0" name="15">
        <layer enabled="1" locked="0" class="SimpleFill" pass="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="0,255,217,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="no" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="fill" alpha="1" force_rhr="0" name="16">
        <layer enabled="1" locked="0" class="SimpleFill" pass="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="164,164,164,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="fill" alpha="1" force_rhr="0" name="17">
        <layer enabled="1" locked="0" class="SimpleFill" pass="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="233,233,233,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="fill" alpha="1" force_rhr="0" name="2">
        <layer enabled="1" locked="0" class="SimpleFill" pass="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="164,164,164,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="fill" alpha="1" force_rhr="0" name="3">
        <layer enabled="1" locked="0" class="SimpleFill" pass="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="0,255,217,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="no" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="fill" alpha="1" force_rhr="0" name="4">
        <layer enabled="1" locked="0" class="SimpleFill" pass="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="0,255,217,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="no" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="fill" alpha="1" force_rhr="0" name="5">
        <layer enabled="1" locked="0" class="SimpleFill" pass="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="255,0,0,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="fill" alpha="1" force_rhr="0" name="6">
        <layer enabled="1" locked="0" class="SimpleFill" pass="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="255,42,0,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="fill" alpha="1" force_rhr="0" name="7">
        <layer enabled="1" locked="0" class="SimpleFill" pass="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="255,84,0,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="fill" alpha="1" force_rhr="0" name="8">
        <layer enabled="1" locked="0" class="SimpleFill" pass="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="255,140,0,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="fill" alpha="1" force_rhr="0" name="9">
        <layer enabled="1" locked="0" class="SimpleFill" pass="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="236,175,19,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <labeling type="rule-based">
    <rules key="{0af50007-89c0-4ef9-999c-d2a7f872fbe3}">
      <rule scalemaxdenom="1001" key="{5986674f-784d-4482-b2e3-be330ef0e311}" scalemindenom="1">
        <settings calloutType="simple">
          <text-style fontItalic="0" fontWeight="50" textColor="0,0,0,255" fontKerning="1" fontStrikeout="0" fontCapitals="0" textOpacity="1" fontWordSpacing="0" fontLetterSpacing="0" fontSize="8" fontFamily="Noto Sans" useSubstitutions="0" namedStyle="Regular" fontSizeUnit="Point" textOrientation="horizontal" blendMode="0" isExpression="0" multilineHeight="1" fontUnderline="0" fieldName="GFK_text" previewBkgrdColor="255,255,255,255" fontSizeMapUnitScale="3x:0,0,0,0,0,0">
            <text-buffer bufferDraw="1" bufferOpacity="1" bufferSizeUnits="MM" bufferSize="1" bufferColor="255,255,255,255" bufferNoFill="1" bufferJoinStyle="128" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferBlendMode="0"/>
            <background shapeOpacity="1" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBorderColor="128,128,128,255" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeBlendMode="0" shapeSizeX="0" shapeSizeUnit="MM" shapeDraw="0" shapeRadiiY="0" shapeRadiiUnit="MM" shapeBorderWidth="0" shapeBorderWidthUnit="MM" shapeJoinStyle="64" shapeRadiiX="0" shapeRotationType="0" shapeOffsetUnit="MM" shapeRotation="0" shapeType="0" shapeSizeY="0" shapeSVGFile="" shapeOffsetY="0" shapeSizeType="0" shapeOffsetX="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeFillColor="255,255,255,255">
              <symbol clip_to_extent="1" type="marker" alpha="1" force_rhr="0" name="markerSymbol">
                <layer enabled="1" locked="0" class="SimpleMarker" pass="0">
                  <prop v="0" k="angle"/>
                  <prop v="125,139,143,255" k="color"/>
                  <prop v="1" k="horizontal_anchor_point"/>
                  <prop v="bevel" k="joinstyle"/>
                  <prop v="circle" k="name"/>
                  <prop v="0,0" k="offset"/>
                  <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
                  <prop v="MM" k="offset_unit"/>
                  <prop v="35,35,35,255" k="outline_color"/>
                  <prop v="solid" k="outline_style"/>
                  <prop v="0" k="outline_width"/>
                  <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
                  <prop v="MM" k="outline_width_unit"/>
                  <prop v="diameter" k="scale_method"/>
                  <prop v="2" k="size"/>
                  <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
                  <prop v="MM" k="size_unit"/>
                  <prop v="1" k="vertical_anchor_point"/>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option value="" type="QString" name="name"/>
                      <Option name="properties"/>
                      <Option value="collection" type="QString" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </background>
            <shadow shadowOffsetGlobal="1" shadowScale="100" shadowRadiusAlphaOnly="0" shadowOffsetAngle="135" shadowOffsetDist="1" shadowRadius="1.5" shadowOpacity="0.7" shadowColor="0,0,0,255" shadowBlendMode="6" shadowOffsetUnit="MM" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowDraw="0" shadowRadiusUnit="MM" shadowUnder="0" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0"/>
            <dd_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format multilineAlign="0" reverseDirectionSymbol="0" plussign="0" decimals="3" useMaxLineLengthForAutoWrap="1" placeDirectionSymbol="0" addDirectionSymbol="0" formatNumbers="0" wrapChar="" leftDirectionSymbol="&lt;" autoWrapLength="0" rightDirectionSymbol=">"/>
          <placement rotationAngle="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" geometryGeneratorEnabled="0" placementFlags="10" fitInPolygonOnly="0" offsetType="0" xOffset="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" distMapUnitScale="3x:0,0,0,0,0,0" geometryGeneratorType="PointGeometry" preserveRotation="1" overrunDistanceUnit="MM" quadOffset="4" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" centroidInside="0" centroidWhole="0" geometryGenerator="" yOffset="0" maxCurvedCharAngleIn="25" dist="0" distUnits="MM" offsetUnits="MM" placement="0" priority="5" repeatDistance="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" overrunDistance="0" layerType="PolygonGeometry" maxCurvedCharAngleOut="-25" repeatDistanceUnits="MM"/>
          <rendering scaleMax="0" fontLimitPixelSize="0" obstacleType="0" fontMaxPixelSize="10000" fontMinPixelSize="3" drawLabels="1" zIndex="0" scaleVisibility="0" labelPerPart="0" limitNumLabels="0" mergeLines="0" maxNumLabels="2000" minFeatureSize="0" scaleMin="0" obstacle="1" obstacleFactor="1" displayAll="0" upsidedownLabels="0"/>
          <dd_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option value="pole_of_inaccessibility" type="QString" name="anchorPoint"/>
              <Option type="Map" name="ddProperties">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
              <Option value="false" type="bool" name="drawToAllParts"/>
              <Option value="0" type="QString" name="enabled"/>
              <Option value="&lt;symbol clip_to_extent=&quot;1&quot; type=&quot;line&quot; alpha=&quot;1&quot; force_rhr=&quot;0&quot; name=&quot;symbol&quot;>&lt;layer enabled=&quot;1&quot; locked=&quot;0&quot; class=&quot;SimpleLine&quot; pass=&quot;0&quot;>&lt;prop v=&quot;square&quot; k=&quot;capstyle&quot;/>&lt;prop v=&quot;5;2&quot; k=&quot;customdash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;customdash_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;customdash_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;draw_inside_polygon&quot;/>&lt;prop v=&quot;bevel&quot; k=&quot;joinstyle&quot;/>&lt;prop v=&quot;60,60,60,255&quot; k=&quot;line_color&quot;/>&lt;prop v=&quot;solid&quot; k=&quot;line_style&quot;/>&lt;prop v=&quot;0.3&quot; k=&quot;line_width&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;line_width_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;offset&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;offset_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;offset_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;ring_filter&quot;/>&lt;prop v=&quot;0&quot; k=&quot;use_custom_dash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;width_map_unit_scale&quot;/>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString" name="lineSymbol"/>
              <Option value="0" type="double" name="minLength"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="minLengthMapUnitScale"/>
              <Option value="MM" type="QString" name="minLengthUnit"/>
              <Option value="0" type="double" name="offsetFromAnchor"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="offsetFromAnchorMapUnitScale"/>
              <Option value="MM" type="QString" name="offsetFromAnchorUnit"/>
              <Option value="0" type="double" name="offsetFromLabel"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="offsetFromLabelMapUnitScale"/>
              <Option value="MM" type="QString" name="offsetFromLabelUnit"/>
            </Option>
          </callout>
        </settings>
      </rule>
    </rules>
  </labeling>
  <customproperties>
    <property key="dualview/previewExpressions">
      <value>AGS</value>
    </property>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>0.8</layerOpacity>
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Histogram">
    <DiagramCategory sizeScale="3x:0,0,0,0,0,0" penColor="#000000" opacity="1" backgroundAlpha="255" height="15" minScaleDenominator="0" scaleDependency="Area" diagramOrientation="Up" rotationOffset="270" penWidth="0" lineSizeType="MM" enabled="0" labelPlacementMethod="XHeight" penAlpha="255" scaleBasedVisibility="0" lineSizeScale="3x:0,0,0,0,0,0" width="15" barWidth="5" maxScaleDenominator="1e+08" sizeType="MM" minimumSize="0" backgroundColor="#ffffff">
      <fontProperties style="" description="Noto Sans,9,-1,5,50,0,0,0,0,0"/>
      <attribute color="#000000" label="" field=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings priority="0" placement="1" dist="0" linePlacementFlags="18" obstacle="0" showAll="1" zIndex="0">
    <properties>
      <Option type="Map">
        <Option value="" type="QString" name="name"/>
        <Option name="properties"/>
        <Option value="collection" type="QString" name="type"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration type="Map">
      <Option type="Map" name="QgsGeometryGapCheck">
        <Option value="0" type="double" name="allowedGapsBuffer"/>
        <Option value="false" type="bool" name="allowedGapsEnabled"/>
        <Option value="" type="QString" name="allowedGapsLayer"/>
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
    <field name="BAUJAHR_MZ">
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
  </fieldConfiguration>
  <aliases>
    <alias field="fid" index="0" name=""/>
    <alias field="AGS" index="1" name=""/>
    <alias field="OI" index="2" name=""/>
    <alias field="GFK" index="3" name=""/>
    <alias field="AKTUALITAE" index="4" name=""/>
    <alias field="GFK_text" index="5" name=""/>
    <alias field="Centroid" index="6" name=""/>
    <alias field="Gitterzellen_ID" index="7" name=""/>
    <alias field="BAUJAHR_MZ" index="8" name=""/>
    <alias field="alt_rel" index="9" name=""/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default applyOnUpdate="0" expression="" field="fid"/>
    <default applyOnUpdate="0" expression="" field="AGS"/>
    <default applyOnUpdate="0" expression="" field="OI"/>
    <default applyOnUpdate="0" expression="" field="GFK"/>
    <default applyOnUpdate="0" expression="" field="AKTUALITAE"/>
    <default applyOnUpdate="0" expression="" field="GFK_text"/>
    <default applyOnUpdate="0" expression="" field="Centroid"/>
    <default applyOnUpdate="0" expression="" field="Gitterzellen_ID"/>
    <default applyOnUpdate="0" expression="" field="BAUJAHR_MZ"/>
    <default applyOnUpdate="0" expression="" field="alt_rel"/>
  </defaults>
  <constraints>
    <constraint unique_strength="1" exp_strength="0" field="fid" notnull_strength="1" constraints="3"/>
    <constraint unique_strength="0" exp_strength="0" field="AGS" notnull_strength="0" constraints="0"/>
    <constraint unique_strength="0" exp_strength="0" field="OI" notnull_strength="0" constraints="0"/>
    <constraint unique_strength="0" exp_strength="0" field="GFK" notnull_strength="0" constraints="0"/>
    <constraint unique_strength="0" exp_strength="0" field="AKTUALITAE" notnull_strength="0" constraints="0"/>
    <constraint unique_strength="0" exp_strength="0" field="GFK_text" notnull_strength="0" constraints="0"/>
    <constraint unique_strength="0" exp_strength="0" field="Centroid" notnull_strength="0" constraints="0"/>
    <constraint unique_strength="0" exp_strength="0" field="Gitterzellen_ID" notnull_strength="0" constraints="0"/>
    <constraint unique_strength="0" exp_strength="0" field="BAUJAHR_MZ" notnull_strength="0" constraints="0"/>
    <constraint unique_strength="0" exp_strength="0" field="alt_rel" notnull_strength="0" constraints="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="fid" exp=""/>
    <constraint desc="" field="AGS" exp=""/>
    <constraint desc="" field="OI" exp=""/>
    <constraint desc="" field="GFK" exp=""/>
    <constraint desc="" field="AKTUALITAE" exp=""/>
    <constraint desc="" field="GFK_text" exp=""/>
    <constraint desc="" field="Centroid" exp=""/>
    <constraint desc="" field="Gitterzellen_ID" exp=""/>
    <constraint desc="" field="BAUJAHR_MZ" exp=""/>
    <constraint desc="" field="alt_rel" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="">
    <columns>
      <column hidden="0" width="101" type="field" name="AGS"/>
      <column hidden="0" width="160" type="field" name="OI"/>
      <column hidden="0" width="263" type="field" name="GFK"/>
      <column hidden="0" width="-1" type="field" name="AKTUALITAE"/>
      <column hidden="1" width="-1" type="actions"/>
      <column hidden="0" width="-1" type="field" name="fid"/>
      <column hidden="0" width="-1" type="field" name="Centroid"/>
      <column hidden="0" width="-1" type="field" name="Gitterzellen_ID"/>
      <column hidden="0" width="-1" type="field" name="BAUJAHR_MZ"/>
      <column hidden="0" width="-1" type="field" name="GFK_text"/>
      <column hidden="0" width="-1" type="field" name="alt_rel"/>
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
    <field editable="1" name="AGS"/>
    <field editable="1" name="AKTUALITAE"/>
    <field editable="1" name="BAUJAHR_MZ"/>
    <field editable="1" name="Centroid"/>
    <field editable="1" name="GFK"/>
    <field editable="1" name="GFK_text"/>
    <field editable="1" name="Gitterzellen_ID"/>
    <field editable="1" name="OI"/>
    <field editable="1" name="alt_rel"/>
    <field editable="1" name="fid"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="AGS"/>
    <field labelOnTop="0" name="AKTUALITAE"/>
    <field labelOnTop="0" name="BAUJAHR_MZ"/>
    <field labelOnTop="0" name="Centroid"/>
    <field labelOnTop="0" name="GFK"/>
    <field labelOnTop="0" name="GFK_text"/>
    <field labelOnTop="0" name="Gitterzellen_ID"/>
    <field labelOnTop="0" name="OI"/>
    <field labelOnTop="0" name="alt_rel"/>
    <field labelOnTop="0" name="fid"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>AGS</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
