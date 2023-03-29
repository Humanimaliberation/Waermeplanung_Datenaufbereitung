<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="AllStyleCategories" labelsEnabled="1" maxScale="0" simplifyDrawingHints="0" readOnly="0" version="3.10.4-A Coruña" hasScaleBasedVisibilityFlag="0" minScale="1e+08" simplifyMaxScale="1" simplifyAlgorithm="0" simplifyDrawingTol="1" simplifyLocal="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 enableorderby="0" type="RuleRenderer" forceraster="0" symbollevels="0">
    <rules key="{dfb0e06b-8a07-4cde-9a02-02a0f126b98b}">
      <rule filter=" &quot;fclass&quot;  = 'national_capital'" key="{dea29cdd-b15a-465f-a307-27c9099c0605}" label="Capital">
        <rule symbol="0" scalemindenom="1000000" key="{7f5e8e3c-43f3-433c-bb3d-7bcdd7952bf7}" label="Capital"/>
        <rule symbol="1" scalemindenom="1" scalemaxdenom="10000000" key="{cbfb0b56-ec6f-4099-9cc7-d871001ac6cf}" label="Capital"/>
      </rule>
      <rule filter=" &quot;fclass&quot;  =  'city' " key="{cacf5aad-cef9-4783-a75d-65537eb3ec34}" label="City">
        <rule filter="&quot;population&quot; >= 1000000" symbol="2" scalemindenom="1000000" key="{936d35de-049c-4bef-b687-af3361ead3e3}" label="City > 1mio"/>
        <rule filter="&quot;population&quot; >= 1000000" symbol="3" scalemindenom="1" scalemaxdenom="10000000" key="{a22357c9-c2c7-4082-9781-8df140ee9e55}" label="City > 1mio"/>
        <rule filter="&quot;population&quot; &lt; 1000000 AND &quot;population&quot; >= 500000" symbol="4" scalemindenom="1000000" key="{d838424a-c832-45e9-84a9-77ee58594e2a}" label="City 1mio - 500k"/>
        <rule filter="&quot;population&quot; &lt; 1000000 AND &quot;population&quot; >= 500000" symbol="5" scalemindenom="1" scalemaxdenom="10000000" key="{db67cfc7-48fc-499b-ae1f-e20b4d354469}" label="City 1mio - 500k"/>
        <rule filter="&quot;population&quot; &lt; 500000 AND &quot;population&quot; >= 250000" symbol="6" key="{0fb63ef0-cb14-472c-b1e8-8ba83aa00cb8}" label="City 500k - 250k"/>
        <rule filter="&quot;population&quot; &lt; 250000 AND &quot;population&quot; >= 100000" symbol="7" key="{aabe293f-0d18-49de-84a4-017465b8319d}" label="City 250k - 100k"/>
        <rule filter="&quot;population&quot; &lt; 100000" symbol="8" key="{60ce659c-c446-4248-a80e-d63de14c50f7}" label="City &lt; 100k"/>
      </rule>
      <rule filter=" &quot;fclass&quot;  =  'town' " key="{9d1c0edd-d58d-4bbf-a41c-c49ee83b0837}" label="Town">
        <rule filter="&quot;population&quot; >= 100000" symbol="9" key="{cde78f5e-588e-45ab-99c7-4079059c7654}" label="Town > 100k"/>
        <rule filter="&quot;population&quot; &lt; 100000 AND &quot;population&quot; >= 50000" symbol="10" key="{a76fd620-28d4-47ac-a968-5481deb7cb7a}" label="Town 100k - 50k"/>
        <rule filter="&quot;population&quot; &lt; 50000 AND &quot;population&quot; >= 25000" symbol="11" key="{4965d2c9-17e8-45cf-8e9f-5e55c394a189}" label="Town 50k - 25k"/>
        <rule filter="&quot;population&quot; &lt; 25000" symbol="12" key="{3a70c1c8-8be5-4585-82d3-2daabad9282e}" label="Town &lt; 25k"/>
      </rule>
      <rule filter=" &quot;fclass&quot;  =  'village' " key="{bced2d3c-b458-4783-90ed-3710d8162515}" label="Village">
        <rule filter="&quot;population&quot; >= 25000" symbol="13" key="{e1fa32c3-6104-45b0-97c9-33dc34a42afb}" label="Village > 25k"/>
        <rule filter="&quot;population&quot; &lt; 25000 AND &quot;population&quot; >= 10000" symbol="14" key="{ba36a6bf-b080-45a1-9082-ba57259430bb}" label="Village 25k - 10k"/>
        <rule filter="&quot;population&quot; &lt; 10000" symbol="15" scalemindenom="1" scalemaxdenom="500000" key="{48c1369c-13a1-4f71-8491-14fd09500216}" label="Village &lt; 10k"/>
      </rule>
      <rule filter=" &quot;fclass&quot;  =  'suburb' " symbol="16" scalemindenom="1" scalemaxdenom="50000" key="{6ec93d4a-4b86-4a7f-8292-b34f38085eaf}" description="Suburb" label="Suburb"/>
    </rules>
    <symbols>
      <symbol alpha="1" name="0" clip_to_extent="1" type="marker" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleMarker" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,1.19999999999999996"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="5"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="0" locked="0" class="SimpleMarker" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,1.19999999999999996"/>
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" name="1" clip_to_extent="1" type="marker" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleMarker" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="5"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer pass="0" locked="0" class="SimpleMarker" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" name="10" clip_to_extent="1" type="marker" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleMarker" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="152,125,183,0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" name="11" clip_to_extent="1" type="marker" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleMarker" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="190,207,80,0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" name="12" clip_to_extent="1" type="marker" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleMarker" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="225,89,137,0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" name="13" clip_to_extent="1" type="marker" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleMarker" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="229,182,54,0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" name="14" clip_to_extent="1" type="marker" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleMarker" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="196,60,57,0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" name="15" clip_to_extent="1" type="marker" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleMarker" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" name="16" clip_to_extent="1" type="marker" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleMarker" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="114,155,111,0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" name="2" clip_to_extent="1" type="marker" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleMarker" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,1.19999999999999996"/>
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" name="3" clip_to_extent="1" type="marker" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleMarker" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="243,166,178,0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" name="4" clip_to_extent="1" type="marker" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleMarker" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,1"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="1.4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" name="5" clip_to_extent="1" type="marker" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleMarker" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="141,90,153,0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" name="6" clip_to_extent="1" type="marker" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleMarker" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="232,113,141,0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" name="7" clip_to_extent="1" type="marker" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleMarker" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="255,158,23,0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" name="8" clip_to_extent="1" type="marker" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleMarker" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="183,72,75,0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
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
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" name="9" clip_to_extent="1" type="marker" force_rhr="0">
        <layer pass="0" locked="0" class="SimpleMarker" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="231,113,72,0"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="35,35,35,0"/>
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
    <rules key="{5ad129ac-3922-4e4e-9400-870d1b3978c7}">
      <rule filter=" &quot;fclass&quot;  = 'national_capital'" key="{7593e5f3-654f-49ba-a55e-38edda1f057b}" description="Capital">
        <rule key="{c8c05525-fc09-4c85-ad8b-d8e16dbe3ae6}" description="Capital">
          <settings calloutType="simple">
            <text-style fontItalic="0" fontKerning="1" fontLetterSpacing="0" namedStyle="Regular" fontStrikeout="0" fontCapitals="0" previewBkgrdColor="0,0,0,255" blendMode="0" useSubstitutions="0" fontUnderline="0" multilineHeight="1" fontFamily="Noto Sans" fontWordSpacing="0" fontWeight="50" textOpacity="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fieldName="name" textColor="124,124,123,255" fontSize="20" isExpression="0" fontSizeUnit="Point" textOrientation="horizontal">
              <text-buffer bufferSize="0.7" bufferSizeUnits="MM" bufferOpacity="0.5" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255" bufferNoFill="1" bufferBlendMode="0" bufferDraw="0" bufferJoinStyle="128">
                <effect type="effectStack" enabled="1">
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
                    <prop k="enabled" v="1"/>
                    <prop k="opacity" v="0.5"/>
                    <prop k="rampType" v="gradient"/>
                    <prop k="single_color" v="255,255,255,255"/>
                    <prop k="spread" v="10"/>
                    <prop k="spread_unit" v="MM"/>
                    <prop k="spread_unit_scale" v="3x:0,0,0,0,0,0"/>
                  </effect>
                  <effect type="drawSource">
                    <prop k="blend_mode" v="0"/>
                    <prop k="draw_mode" v="2"/>
                    <prop k="enabled" v="1"/>
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
              </text-buffer>
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
            <text-format wrapChar="" autoWrapLength="0" decimals="3" rightDirectionSymbol=">" placeDirectionSymbol="0" multilineAlign="3" useMaxLineLengthForAutoWrap="1" formatNumbers="0" addDirectionSymbol="0" plussign="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0"/>
            <placement repeatDistanceUnits="MM" xOffset="0" offsetUnits="MM" maxCurvedCharAngleOut="-25" geometryGenerator="" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" maxCurvedCharAngleIn="25" preserveRotation="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetType="0" quadOffset="4" layerType="UnknownGeometry" centroidInside="0" centroidWhole="0" overrunDistanceUnit="MM" geometryGeneratorEnabled="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="1" dist="0" fitInPolygonOnly="0" placementFlags="10" rotationAngle="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" yOffset="0" overrunDistance="0" geometryGeneratorType="PointGeometry" distUnits="MM" repeatDistance="0" distMapUnitScale="3x:0,0,0,0,0,0"/>
            <rendering labelPerPart="0" maxNumLabels="2000" upsidedownLabels="0" limitNumLabels="0" minFeatureSize="0" obstacle="0" fontMaxPixelSize="10000" zIndex="0" scaleMax="0" scaleMin="0" fontMinPixelSize="3" fontLimitPixelSize="0" obstacleFactor="1" displayAll="1" scaleVisibility="0" obstacleType="0" mergeLines="0" drawLabels="1"/>
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
      </rule>
      <rule filter=" &quot;fclass&quot;  =  'city' " key="{6d56be9c-5d69-4aea-9b23-08dadbccd568}" description="City">
        <rule filter="&quot;population&quot; >= 1000000" scalemindenom="1" scalemaxdenom="10000001" key="{5cc18469-1d11-4db2-880b-1ebbce8971c0}" description="City > 1mio">
          <settings calloutType="simple">
            <text-style fontItalic="0" fontKerning="1" fontLetterSpacing="0" namedStyle="Regular" fontStrikeout="0" fontCapitals="0" previewBkgrdColor="0,0,0,255" blendMode="0" useSubstitutions="0" fontUnderline="0" multilineHeight="1" fontFamily="Noto Sans" fontWordSpacing="0" fontWeight="50" textOpacity="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fieldName="name" textColor="124,124,123,255" fontSize="20" isExpression="0" fontSizeUnit="Point" textOrientation="horizontal">
              <text-buffer bufferSize="0.7" bufferSizeUnits="MM" bufferOpacity="0.5" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255" bufferNoFill="1" bufferBlendMode="0" bufferDraw="1" bufferJoinStyle="128">
                <effect type="effectStack" enabled="1">
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
                    <prop k="enabled" v="1"/>
                    <prop k="opacity" v="0.5"/>
                    <prop k="rampType" v="gradient"/>
                    <prop k="single_color" v="255,255,255,255"/>
                    <prop k="spread" v="8"/>
                    <prop k="spread_unit" v="MM"/>
                    <prop k="spread_unit_scale" v="3x:0,0,0,0,0,0"/>
                  </effect>
                  <effect type="drawSource">
                    <prop k="blend_mode" v="0"/>
                    <prop k="draw_mode" v="2"/>
                    <prop k="enabled" v="1"/>
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
              </text-buffer>
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
            <text-format wrapChar="" autoWrapLength="0" decimals="3" rightDirectionSymbol=">" placeDirectionSymbol="0" multilineAlign="3" useMaxLineLengthForAutoWrap="1" formatNumbers="0" addDirectionSymbol="0" plussign="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0"/>
            <placement repeatDistanceUnits="MM" xOffset="0" offsetUnits="MM" maxCurvedCharAngleOut="-25" geometryGenerator="" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" maxCurvedCharAngleIn="25" preserveRotation="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetType="0" quadOffset="4" layerType="UnknownGeometry" centroidInside="0" centroidWhole="0" overrunDistanceUnit="MM" geometryGeneratorEnabled="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="1" dist="0" fitInPolygonOnly="0" placementFlags="10" rotationAngle="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" yOffset="0" overrunDistance="0" geometryGeneratorType="PointGeometry" distUnits="MM" repeatDistance="0" distMapUnitScale="3x:0,0,0,0,0,0"/>
            <rendering labelPerPart="0" maxNumLabels="2000" upsidedownLabels="0" limitNumLabels="0" minFeatureSize="0" obstacle="1" fontMaxPixelSize="10000" zIndex="0" scaleMax="0" scaleMin="0" fontMinPixelSize="3" fontLimitPixelSize="0" obstacleFactor="0" displayAll="1" scaleVisibility="0" obstacleType="0" mergeLines="0" drawLabels="1"/>
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
        <rule filter="&quot;population&quot; &lt; 1000000 AND &quot;population&quot; >= 500000" scalemindenom="1" scalemaxdenom="5000001" key="{8a81284c-6d21-45ee-a864-0203a6446d77}" description="City 1mio - 500k">
          <settings calloutType="simple">
            <text-style fontItalic="0" fontKerning="1" fontLetterSpacing="0" namedStyle="Regular" fontStrikeout="0" fontCapitals="0" previewBkgrdColor="0,0,0,255" blendMode="0" useSubstitutions="0" fontUnderline="0" multilineHeight="1" fontFamily="Noto Sans" fontWordSpacing="0" fontWeight="50" textOpacity="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fieldName="name" textColor="124,124,123,255" fontSize="16" isExpression="0" fontSizeUnit="Point" textOrientation="horizontal">
              <text-buffer bufferSize="0.7" bufferSizeUnits="MM" bufferOpacity="0.5" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255" bufferNoFill="1" bufferBlendMode="0" bufferDraw="1" bufferJoinStyle="128"/>
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
            <text-format wrapChar="" autoWrapLength="0" decimals="3" rightDirectionSymbol=">" placeDirectionSymbol="0" multilineAlign="3" useMaxLineLengthForAutoWrap="1" formatNumbers="0" addDirectionSymbol="0" plussign="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0"/>
            <placement repeatDistanceUnits="MM" xOffset="0" offsetUnits="MM" maxCurvedCharAngleOut="-25" geometryGenerator="" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" maxCurvedCharAngleIn="25" preserveRotation="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetType="0" quadOffset="4" layerType="UnknownGeometry" centroidInside="0" centroidWhole="0" overrunDistanceUnit="MM" geometryGeneratorEnabled="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="1" dist="0" fitInPolygonOnly="0" placementFlags="10" rotationAngle="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" yOffset="0" overrunDistance="0" geometryGeneratorType="PointGeometry" distUnits="MM" repeatDistance="0" distMapUnitScale="3x:0,0,0,0,0,0"/>
            <rendering labelPerPart="0" maxNumLabels="2000" upsidedownLabels="0" limitNumLabels="0" minFeatureSize="0" obstacle="1" fontMaxPixelSize="10000" zIndex="0" scaleMax="0" scaleMin="0" fontMinPixelSize="3" fontLimitPixelSize="0" obstacleFactor="0" displayAll="1" scaleVisibility="0" obstacleType="0" mergeLines="0" drawLabels="1"/>
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
        <rule filter="&quot;population&quot; &lt; 500000 AND &quot;population&quot; >= 250000" scalemindenom="1" scalemaxdenom="2500001" key="{3ed98f92-2a65-4391-8366-d8acc7e7152f}" description="City 500k - 250k">
          <settings calloutType="simple">
            <text-style fontItalic="0" fontKerning="1" fontLetterSpacing="0" namedStyle="Regular" fontStrikeout="0" fontCapitals="0" previewBkgrdColor="0,0,0,255" blendMode="0" useSubstitutions="0" fontUnderline="0" multilineHeight="1" fontFamily="Noto Sans" fontWordSpacing="0" fontWeight="50" textOpacity="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fieldName="name" textColor="124,124,123,255" fontSize="11" isExpression="0" fontSizeUnit="Point" textOrientation="horizontal">
              <text-buffer bufferSize="0.7" bufferSizeUnits="MM" bufferOpacity="0.5" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255" bufferNoFill="1" bufferBlendMode="0" bufferDraw="1" bufferJoinStyle="128"/>
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
            <text-format wrapChar="" autoWrapLength="0" decimals="3" rightDirectionSymbol=">" placeDirectionSymbol="0" multilineAlign="3" useMaxLineLengthForAutoWrap="1" formatNumbers="0" addDirectionSymbol="0" plussign="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0"/>
            <placement repeatDistanceUnits="MM" xOffset="0" offsetUnits="MM" maxCurvedCharAngleOut="-25" geometryGenerator="" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" maxCurvedCharAngleIn="25" preserveRotation="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetType="0" quadOffset="4" layerType="UnknownGeometry" centroidInside="0" centroidWhole="0" overrunDistanceUnit="MM" geometryGeneratorEnabled="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="1" dist="0" fitInPolygonOnly="0" placementFlags="10" rotationAngle="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" yOffset="0" overrunDistance="0" geometryGeneratorType="PointGeometry" distUnits="MM" repeatDistance="0" distMapUnitScale="3x:0,0,0,0,0,0"/>
            <rendering labelPerPart="0" maxNumLabels="2000" upsidedownLabels="0" limitNumLabels="0" minFeatureSize="0" obstacle="1" fontMaxPixelSize="10000" zIndex="0" scaleMax="0" scaleMin="0" fontMinPixelSize="3" fontLimitPixelSize="0" obstacleFactor="0" displayAll="1" scaleVisibility="0" obstacleType="0" mergeLines="0" drawLabels="1"/>
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
        <rule filter="&quot;population&quot; &lt; 250000 AND &quot;population&quot; >= 100000" scalemindenom="1" scalemaxdenom="1000001" key="{92d4481d-18c8-4800-bb2b-8c3fce0c9e1b}" description="City 250k - 100k">
          <settings calloutType="simple">
            <text-style fontItalic="0" fontKerning="1" fontLetterSpacing="0" namedStyle="Regular" fontStrikeout="0" fontCapitals="0" previewBkgrdColor="0,0,0,255" blendMode="0" useSubstitutions="0" fontUnderline="0" multilineHeight="1" fontFamily="Noto Sans" fontWordSpacing="0" fontWeight="50" textOpacity="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fieldName="name" textColor="124,124,123,255" fontSize="11" isExpression="0" fontSizeUnit="Point" textOrientation="horizontal">
              <text-buffer bufferSize="0.7" bufferSizeUnits="MM" bufferOpacity="0.5" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255" bufferNoFill="1" bufferBlendMode="0" bufferDraw="1" bufferJoinStyle="128"/>
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
            <text-format wrapChar="" autoWrapLength="0" decimals="3" rightDirectionSymbol=">" placeDirectionSymbol="0" multilineAlign="3" useMaxLineLengthForAutoWrap="1" formatNumbers="0" addDirectionSymbol="0" plussign="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0"/>
            <placement repeatDistanceUnits="MM" xOffset="0" offsetUnits="MM" maxCurvedCharAngleOut="-25" geometryGenerator="" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" maxCurvedCharAngleIn="25" preserveRotation="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetType="0" quadOffset="4" layerType="UnknownGeometry" centroidInside="0" centroidWhole="0" overrunDistanceUnit="MM" geometryGeneratorEnabled="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="1" dist="0" fitInPolygonOnly="0" placementFlags="10" rotationAngle="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" yOffset="0" overrunDistance="0" geometryGeneratorType="PointGeometry" distUnits="MM" repeatDistance="0" distMapUnitScale="3x:0,0,0,0,0,0"/>
            <rendering labelPerPart="0" maxNumLabels="2000" upsidedownLabels="0" limitNumLabels="0" minFeatureSize="0" obstacle="1" fontMaxPixelSize="10000" zIndex="0" scaleMax="0" scaleMin="0" fontMinPixelSize="3" fontLimitPixelSize="0" obstacleFactor="0" displayAll="1" scaleVisibility="0" obstacleType="0" mergeLines="0" drawLabels="1"/>
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
        <rule filter="&quot;population&quot; &lt; 100000" scalemindenom="1" scalemaxdenom="750001" key="{452392d8-ba7c-419c-9d5d-3c197fc8b73d}" description="City &lt; 100k">
          <settings calloutType="simple">
            <text-style fontItalic="0" fontKerning="1" fontLetterSpacing="0" namedStyle="Regular" fontStrikeout="0" fontCapitals="0" previewBkgrdColor="0,0,0,255" blendMode="0" useSubstitutions="0" fontUnderline="0" multilineHeight="1" fontFamily="Noto Sans" fontWordSpacing="0" fontWeight="50" textOpacity="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fieldName="name" textColor="124,124,123,255" fontSize="11" isExpression="0" fontSizeUnit="Point" textOrientation="horizontal">
              <text-buffer bufferSize="0.7" bufferSizeUnits="MM" bufferOpacity="0.5" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255" bufferNoFill="1" bufferBlendMode="0" bufferDraw="1" bufferJoinStyle="128"/>
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
            <text-format wrapChar="" autoWrapLength="0" decimals="3" rightDirectionSymbol=">" placeDirectionSymbol="0" multilineAlign="3" useMaxLineLengthForAutoWrap="1" formatNumbers="0" addDirectionSymbol="0" plussign="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0"/>
            <placement repeatDistanceUnits="MM" xOffset="0" offsetUnits="MM" maxCurvedCharAngleOut="-25" geometryGenerator="" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" maxCurvedCharAngleIn="25" preserveRotation="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetType="0" quadOffset="4" layerType="UnknownGeometry" centroidInside="0" centroidWhole="0" overrunDistanceUnit="MM" geometryGeneratorEnabled="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="1" dist="0" fitInPolygonOnly="0" placementFlags="10" rotationAngle="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" yOffset="0" overrunDistance="0" geometryGeneratorType="PointGeometry" distUnits="MM" repeatDistance="0" distMapUnitScale="3x:0,0,0,0,0,0"/>
            <rendering labelPerPart="0" maxNumLabels="2000" upsidedownLabels="0" limitNumLabels="0" minFeatureSize="0" obstacle="1" fontMaxPixelSize="10000" zIndex="0" scaleMax="0" scaleMin="0" fontMinPixelSize="3" fontLimitPixelSize="0" obstacleFactor="0" displayAll="1" scaleVisibility="0" obstacleType="0" mergeLines="0" drawLabels="1"/>
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
      </rule>
      <rule filter=" &quot;fclass&quot;  =  'town' " key="{e4e44494-e706-47ba-8f33-e8d3c4c0fec6}" description="Town">
        <rule filter="&quot;population&quot; >= 100000" scalemindenom="1" scalemaxdenom="750001" key="{0354fa4b-00a1-46a4-8391-e9b7eb799eaa}" description="Town > 100k">
          <settings calloutType="simple">
            <text-style fontItalic="0" fontKerning="1" fontLetterSpacing="0" namedStyle="Regular" fontStrikeout="0" fontCapitals="0" previewBkgrdColor="0,0,0,255" blendMode="0" useSubstitutions="0" fontUnderline="0" multilineHeight="1" fontFamily="Noto Sans" fontWordSpacing="0" fontWeight="50" textOpacity="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fieldName="name" textColor="124,124,123,255" fontSize="10" isExpression="0" fontSizeUnit="Point" textOrientation="horizontal">
              <text-buffer bufferSize="0.7" bufferSizeUnits="MM" bufferOpacity="0.5" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255" bufferNoFill="1" bufferBlendMode="0" bufferDraw="1" bufferJoinStyle="128"/>
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
            <text-format wrapChar="" autoWrapLength="0" decimals="3" rightDirectionSymbol=">" placeDirectionSymbol="0" multilineAlign="3" useMaxLineLengthForAutoWrap="1" formatNumbers="0" addDirectionSymbol="0" plussign="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0"/>
            <placement repeatDistanceUnits="MM" xOffset="0" offsetUnits="MM" maxCurvedCharAngleOut="-25" geometryGenerator="" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" maxCurvedCharAngleIn="25" preserveRotation="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetType="0" quadOffset="4" layerType="UnknownGeometry" centroidInside="0" centroidWhole="0" overrunDistanceUnit="MM" geometryGeneratorEnabled="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="1" dist="0" fitInPolygonOnly="0" placementFlags="10" rotationAngle="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" yOffset="0" overrunDistance="0" geometryGeneratorType="PointGeometry" distUnits="MM" repeatDistance="0" distMapUnitScale="3x:0,0,0,0,0,0"/>
            <rendering labelPerPart="0" maxNumLabels="2000" upsidedownLabels="0" limitNumLabels="0" minFeatureSize="0" obstacle="1" fontMaxPixelSize="10000" zIndex="0" scaleMax="0" scaleMin="0" fontMinPixelSize="3" fontLimitPixelSize="0" obstacleFactor="0.2" displayAll="0" scaleVisibility="0" obstacleType="0" mergeLines="0" drawLabels="1"/>
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
        <rule filter="&quot;population&quot; &lt; 100000 AND &quot;population&quot; >= 50000" scalemindenom="1" scalemaxdenom="500001" key="{73f902af-0302-45ea-b2ea-0e8a4bc11c61}" description="Town 100k - 50k">
          <settings calloutType="simple">
            <text-style fontItalic="0" fontKerning="1" fontLetterSpacing="0" namedStyle="Regular" fontStrikeout="0" fontCapitals="0" previewBkgrdColor="0,0,0,255" blendMode="0" useSubstitutions="0" fontUnderline="0" multilineHeight="1" fontFamily="Noto Sans" fontWordSpacing="0" fontWeight="50" textOpacity="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fieldName="name" textColor="124,124,123,255" fontSize="10" isExpression="0" fontSizeUnit="Point" textOrientation="horizontal">
              <text-buffer bufferSize="0.7" bufferSizeUnits="MM" bufferOpacity="0.5" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255" bufferNoFill="1" bufferBlendMode="0" bufferDraw="1" bufferJoinStyle="128"/>
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
            <text-format wrapChar="" autoWrapLength="0" decimals="3" rightDirectionSymbol=">" placeDirectionSymbol="0" multilineAlign="3" useMaxLineLengthForAutoWrap="1" formatNumbers="0" addDirectionSymbol="0" plussign="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0"/>
            <placement repeatDistanceUnits="MM" xOffset="0" offsetUnits="MM" maxCurvedCharAngleOut="-25" geometryGenerator="" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" maxCurvedCharAngleIn="25" preserveRotation="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetType="0" quadOffset="4" layerType="UnknownGeometry" centroidInside="0" centroidWhole="0" overrunDistanceUnit="MM" geometryGeneratorEnabled="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="1" dist="0" fitInPolygonOnly="0" placementFlags="10" rotationAngle="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" yOffset="0" overrunDistance="0" geometryGeneratorType="PointGeometry" distUnits="MM" repeatDistance="0" distMapUnitScale="3x:0,0,0,0,0,0"/>
            <rendering labelPerPart="0" maxNumLabels="2000" upsidedownLabels="0" limitNumLabels="0" minFeatureSize="0" obstacle="1" fontMaxPixelSize="10000" zIndex="0" scaleMax="0" scaleMin="0" fontMinPixelSize="3" fontLimitPixelSize="0" obstacleFactor="0.2" displayAll="0" scaleVisibility="0" obstacleType="0" mergeLines="0" drawLabels="1"/>
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
        <rule filter="&quot;population&quot; &lt; 50000 AND &quot;population&quot; >= 25000" scalemindenom="1" scalemaxdenom="500001" key="{1ecf840a-baf8-4436-8dd5-ddc944562113}" description="Town 50k - 25k">
          <settings calloutType="simple">
            <text-style fontItalic="0" fontKerning="1" fontLetterSpacing="0" namedStyle="Regular" fontStrikeout="0" fontCapitals="0" previewBkgrdColor="0,0,0,255" blendMode="0" useSubstitutions="0" fontUnderline="0" multilineHeight="1" fontFamily="Noto Sans" fontWordSpacing="0" fontWeight="50" textOpacity="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fieldName="name" textColor="124,124,123,255" fontSize="10" isExpression="0" fontSizeUnit="Point" textOrientation="horizontal">
              <text-buffer bufferSize="0.7" bufferSizeUnits="MM" bufferOpacity="0.5" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255" bufferNoFill="1" bufferBlendMode="0" bufferDraw="1" bufferJoinStyle="128"/>
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
            <text-format wrapChar="" autoWrapLength="0" decimals="3" rightDirectionSymbol=">" placeDirectionSymbol="0" multilineAlign="3" useMaxLineLengthForAutoWrap="1" formatNumbers="0" addDirectionSymbol="0" plussign="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0"/>
            <placement repeatDistanceUnits="MM" xOffset="0" offsetUnits="MM" maxCurvedCharAngleOut="-25" geometryGenerator="" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" maxCurvedCharAngleIn="25" preserveRotation="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetType="0" quadOffset="4" layerType="UnknownGeometry" centroidInside="0" centroidWhole="0" overrunDistanceUnit="MM" geometryGeneratorEnabled="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="1" dist="0" fitInPolygonOnly="0" placementFlags="10" rotationAngle="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" yOffset="0" overrunDistance="0" geometryGeneratorType="PointGeometry" distUnits="MM" repeatDistance="0" distMapUnitScale="3x:0,0,0,0,0,0"/>
            <rendering labelPerPart="0" maxNumLabels="2000" upsidedownLabels="0" limitNumLabels="0" minFeatureSize="0" obstacle="1" fontMaxPixelSize="10000" zIndex="0" scaleMax="0" scaleMin="0" fontMinPixelSize="3" fontLimitPixelSize="0" obstacleFactor="0.2" displayAll="0" scaleVisibility="0" obstacleType="0" mergeLines="0" drawLabels="1"/>
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
        <rule filter="&quot;population&quot; &lt; 25000" scalemindenom="1" scalemaxdenom="500001" key="{5f963b15-dfd4-4bc1-89bc-7cca047bbdb0}" description="Town &lt; 25k">
          <settings calloutType="simple">
            <text-style fontItalic="0" fontKerning="1" fontLetterSpacing="0" namedStyle="Regular" fontStrikeout="0" fontCapitals="0" previewBkgrdColor="0,0,0,255" blendMode="0" useSubstitutions="0" fontUnderline="0" multilineHeight="1" fontFamily="Noto Sans" fontWordSpacing="0" fontWeight="50" textOpacity="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fieldName="name" textColor="124,124,123,255" fontSize="10" isExpression="0" fontSizeUnit="Point" textOrientation="horizontal">
              <text-buffer bufferSize="0.7" bufferSizeUnits="MM" bufferOpacity="0.5" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255" bufferNoFill="1" bufferBlendMode="0" bufferDraw="1" bufferJoinStyle="128"/>
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
            <text-format wrapChar="" autoWrapLength="0" decimals="3" rightDirectionSymbol=">" placeDirectionSymbol="0" multilineAlign="3" useMaxLineLengthForAutoWrap="1" formatNumbers="0" addDirectionSymbol="0" plussign="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0"/>
            <placement repeatDistanceUnits="MM" xOffset="0" offsetUnits="MM" maxCurvedCharAngleOut="-25" geometryGenerator="" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" maxCurvedCharAngleIn="25" preserveRotation="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetType="0" quadOffset="4" layerType="UnknownGeometry" centroidInside="0" centroidWhole="0" overrunDistanceUnit="MM" geometryGeneratorEnabled="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="1" dist="0" fitInPolygonOnly="0" placementFlags="10" rotationAngle="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" yOffset="0" overrunDistance="0" geometryGeneratorType="PointGeometry" distUnits="MM" repeatDistance="0" distMapUnitScale="3x:0,0,0,0,0,0"/>
            <rendering labelPerPart="0" maxNumLabels="2000" upsidedownLabels="0" limitNumLabels="0" minFeatureSize="0" obstacle="1" fontMaxPixelSize="10000" zIndex="0" scaleMax="0" scaleMin="0" fontMinPixelSize="3" fontLimitPixelSize="0" obstacleFactor="0.2" displayAll="0" scaleVisibility="0" obstacleType="0" mergeLines="0" drawLabels="1"/>
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
      </rule>
      <rule filter=" &quot;fclass&quot;  =  'village' " key="{13e7c6bc-aeb8-4513-8bff-dca2d66ad066}" description="Village">
        <rule filter="&quot;population&quot; >= 25000" scalemindenom="1" scalemaxdenom="500001" key="{1d40efe5-78a2-4f04-ba98-b89f77ffc53c}" description="Village > 25k">
          <settings calloutType="simple">
            <text-style fontItalic="0" fontKerning="1" fontLetterSpacing="0" namedStyle="Regular" fontStrikeout="0" fontCapitals="0" previewBkgrdColor="0,0,0,255" blendMode="0" useSubstitutions="0" fontUnderline="0" multilineHeight="1" fontFamily="Noto Sans" fontWordSpacing="0" fontWeight="50" textOpacity="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fieldName="name" textColor="124,124,123,255" fontSize="8" isExpression="0" fontSizeUnit="Point" textOrientation="horizontal">
              <text-buffer bufferSize="0.7" bufferSizeUnits="MM" bufferOpacity="0.5" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255" bufferNoFill="1" bufferBlendMode="0" bufferDraw="1" bufferJoinStyle="128"/>
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
            <text-format wrapChar="" autoWrapLength="0" decimals="3" rightDirectionSymbol=">" placeDirectionSymbol="0" multilineAlign="3" useMaxLineLengthForAutoWrap="1" formatNumbers="0" addDirectionSymbol="0" plussign="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0"/>
            <placement repeatDistanceUnits="MM" xOffset="0" offsetUnits="MM" maxCurvedCharAngleOut="-25" geometryGenerator="" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" maxCurvedCharAngleIn="25" preserveRotation="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetType="0" quadOffset="4" layerType="UnknownGeometry" centroidInside="0" centroidWhole="0" overrunDistanceUnit="MM" geometryGeneratorEnabled="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="1" dist="0" fitInPolygonOnly="0" placementFlags="10" rotationAngle="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" yOffset="0" overrunDistance="0" geometryGeneratorType="PointGeometry" distUnits="MM" repeatDistance="0" distMapUnitScale="3x:0,0,0,0,0,0"/>
            <rendering labelPerPart="0" maxNumLabels="2000" upsidedownLabels="0" limitNumLabels="0" minFeatureSize="0" obstacle="1" fontMaxPixelSize="10000" zIndex="0" scaleMax="0" scaleMin="0" fontMinPixelSize="3" fontLimitPixelSize="0" obstacleFactor="0.4" displayAll="0" scaleVisibility="0" obstacleType="0" mergeLines="0" drawLabels="1"/>
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
        <rule filter="&quot;population&quot; &lt; 25000 AND &quot;population&quot; >= 10000" scalemindenom="1" scalemaxdenom="500001" key="{7626d581-df0a-44cf-a3ad-acfd1062e552}" description="Village 25k - 10k">
          <settings calloutType="simple">
            <text-style fontItalic="0" fontKerning="1" fontLetterSpacing="0" namedStyle="Regular" fontStrikeout="0" fontCapitals="0" previewBkgrdColor="0,0,0,255" blendMode="0" useSubstitutions="0" fontUnderline="0" multilineHeight="1" fontFamily="Noto Sans" fontWordSpacing="0" fontWeight="50" textOpacity="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fieldName="name" textColor="124,124,123,255" fontSize="8" isExpression="0" fontSizeUnit="Point" textOrientation="horizontal">
              <text-buffer bufferSize="0.7" bufferSizeUnits="MM" bufferOpacity="0.5" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255" bufferNoFill="1" bufferBlendMode="0" bufferDraw="1" bufferJoinStyle="128"/>
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
            <text-format wrapChar="" autoWrapLength="0" decimals="3" rightDirectionSymbol=">" placeDirectionSymbol="0" multilineAlign="3" useMaxLineLengthForAutoWrap="1" formatNumbers="0" addDirectionSymbol="0" plussign="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0"/>
            <placement repeatDistanceUnits="MM" xOffset="0" offsetUnits="MM" maxCurvedCharAngleOut="-25" geometryGenerator="" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" maxCurvedCharAngleIn="25" preserveRotation="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetType="0" quadOffset="4" layerType="UnknownGeometry" centroidInside="0" centroidWhole="0" overrunDistanceUnit="MM" geometryGeneratorEnabled="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="1" dist="0" fitInPolygonOnly="0" placementFlags="10" rotationAngle="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" yOffset="0" overrunDistance="0" geometryGeneratorType="PointGeometry" distUnits="MM" repeatDistance="0" distMapUnitScale="3x:0,0,0,0,0,0"/>
            <rendering labelPerPart="0" maxNumLabels="2000" upsidedownLabels="0" limitNumLabels="0" minFeatureSize="0" obstacle="1" fontMaxPixelSize="10000" zIndex="0" scaleMax="0" scaleMin="0" fontMinPixelSize="3" fontLimitPixelSize="0" obstacleFactor="0.4" displayAll="0" scaleVisibility="0" obstacleType="0" mergeLines="0" drawLabels="1"/>
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
        <rule filter="&quot;population&quot; &lt; 10000 " scalemindenom="1" scalemaxdenom="200001" key="{0c1d39f0-dfb6-4ef1-bc55-7b8d73d8b03a}" description="Village &lt; 10k">
          <settings calloutType="simple">
            <text-style fontItalic="0" fontKerning="1" fontLetterSpacing="0" namedStyle="Regular" fontStrikeout="0" fontCapitals="0" previewBkgrdColor="0,0,0,255" blendMode="0" useSubstitutions="0" fontUnderline="0" multilineHeight="1" fontFamily="Noto Sans" fontWordSpacing="0" fontWeight="50" textOpacity="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fieldName="name" textColor="124,124,123,255" fontSize="8" isExpression="0" fontSizeUnit="Point" textOrientation="horizontal">
              <text-buffer bufferSize="0.7" bufferSizeUnits="MM" bufferOpacity="0.5" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255" bufferNoFill="1" bufferBlendMode="0" bufferDraw="1" bufferJoinStyle="128"/>
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
            <text-format wrapChar="" autoWrapLength="0" decimals="3" rightDirectionSymbol=">" placeDirectionSymbol="0" multilineAlign="3" useMaxLineLengthForAutoWrap="1" formatNumbers="0" addDirectionSymbol="0" plussign="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0"/>
            <placement repeatDistanceUnits="MM" xOffset="0" offsetUnits="MM" maxCurvedCharAngleOut="-25" geometryGenerator="" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" maxCurvedCharAngleIn="25" preserveRotation="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetType="0" quadOffset="4" layerType="UnknownGeometry" centroidInside="0" centroidWhole="0" overrunDistanceUnit="MM" geometryGeneratorEnabled="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="1" dist="0" fitInPolygonOnly="0" placementFlags="10" rotationAngle="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" yOffset="0" overrunDistance="0" geometryGeneratorType="PointGeometry" distUnits="MM" repeatDistance="0" distMapUnitScale="3x:0,0,0,0,0,0"/>
            <rendering labelPerPart="0" maxNumLabels="2000" upsidedownLabels="0" limitNumLabels="0" minFeatureSize="0" obstacle="1" fontMaxPixelSize="10000" zIndex="0" scaleMax="0" scaleMin="0" fontMinPixelSize="3" fontLimitPixelSize="0" obstacleFactor="0.4" displayAll="0" scaleVisibility="0" obstacleType="0" mergeLines="0" drawLabels="1"/>
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
      </rule>
      <rule filter=" &quot;fclass&quot;  =  'suburb' " key="{c075dd86-8b83-426d-842b-79981af267df}" description="Suburb">
        <settings calloutType="simple">
          <text-style fontItalic="0" fontKerning="1" fontLetterSpacing="0" namedStyle="Standard" fontStrikeout="0" fontCapitals="0" previewBkgrdColor="0,0,0,255" blendMode="0" useSubstitutions="0" fontUnderline="0" multilineHeight="1" fontFamily="Noto Sans" fontWordSpacing="0" fontWeight="50" textOpacity="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fieldName="" textColor="0,0,0,255" fontSize="10" isExpression="1" fontSizeUnit="Point" textOrientation="horizontal">
            <text-buffer bufferSize="1" bufferSizeUnits="MM" bufferOpacity="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255" bufferNoFill="1" bufferBlendMode="0" bufferDraw="0" bufferJoinStyle="128"/>
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
          <text-format wrapChar="" autoWrapLength="0" decimals="3" rightDirectionSymbol=">" placeDirectionSymbol="0" multilineAlign="3" useMaxLineLengthForAutoWrap="1" formatNumbers="0" addDirectionSymbol="0" plussign="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0"/>
          <placement repeatDistanceUnits="MM" xOffset="0" offsetUnits="MM" maxCurvedCharAngleOut="-25" geometryGenerator="" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" maxCurvedCharAngleIn="25" preserveRotation="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetType="0" quadOffset="4" layerType="UnknownGeometry" centroidInside="0" centroidWhole="0" overrunDistanceUnit="MM" geometryGeneratorEnabled="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="0" dist="0" fitInPolygonOnly="0" placementFlags="10" rotationAngle="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" yOffset="0" overrunDistance="0" geometryGeneratorType="PointGeometry" distUnits="MM" repeatDistance="0" distMapUnitScale="3x:0,0,0,0,0,0"/>
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
        <rule scalemindenom="1" scalemaxdenom="25001" key="{3b38692e-3017-4c08-9f59-7d0579cfb32e}" description="Suburbs">
          <settings calloutType="simple">
            <text-style fontItalic="0" fontKerning="1" fontLetterSpacing="0" namedStyle="Regular" fontStrikeout="0" fontCapitals="0" previewBkgrdColor="0,0,0,255" blendMode="0" useSubstitutions="0" fontUnderline="0" multilineHeight="1" fontFamily="Noto Sans" fontWordSpacing="0" fontWeight="50" textOpacity="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fieldName="name" textColor="124,124,123,255" fontSize="7" isExpression="0" fontSizeUnit="Point" textOrientation="horizontal">
              <text-buffer bufferSize="0.7" bufferSizeUnits="MM" bufferOpacity="0.5" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255" bufferNoFill="1" bufferBlendMode="0" bufferDraw="1" bufferJoinStyle="128"/>
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
            <text-format wrapChar="" autoWrapLength="0" decimals="3" rightDirectionSymbol=">" placeDirectionSymbol="0" multilineAlign="3" useMaxLineLengthForAutoWrap="1" formatNumbers="0" addDirectionSymbol="0" plussign="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0"/>
            <placement repeatDistanceUnits="MM" xOffset="0" offsetUnits="MM" maxCurvedCharAngleOut="-25" geometryGenerator="" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" maxCurvedCharAngleIn="25" preserveRotation="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetType="0" quadOffset="4" layerType="UnknownGeometry" centroidInside="0" centroidWhole="0" overrunDistanceUnit="MM" geometryGeneratorEnabled="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="1" dist="0" fitInPolygonOnly="0" placementFlags="10" rotationAngle="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" yOffset="0" overrunDistance="0" geometryGeneratorType="PointGeometry" distUnits="MM" repeatDistance="0" distMapUnitScale="3x:0,0,0,0,0,0"/>
            <rendering labelPerPart="0" maxNumLabels="2000" upsidedownLabels="0" limitNumLabels="0" minFeatureSize="0" obstacle="1" fontMaxPixelSize="10000" zIndex="0" scaleMax="0" scaleMin="0" fontMinPixelSize="3" fontLimitPixelSize="0" obstacleFactor="0.6" displayAll="0" scaleVisibility="0" obstacleType="0" mergeLines="0" drawLabels="1"/>
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
      </rule>
    </rules>
  </labeling>
  <customproperties>
    <property key="dualview/previewExpressions">
      <value>osm_id</value>
    </property>
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
  <DiagramLayerSettings obstacle="0" priority="0" placement="0" dist="0" linePlacementFlags="18" zIndex="0" showAll="1">
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
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="code">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option value="true" name="AllowNull" type="bool"/>
            <Option value="2147483647" name="Max" type="int"/>
            <Option value="-2147483648" name="Min" type="int"/>
            <Option value="0" name="Precision" type="int"/>
            <Option value="1" name="Step" type="int"/>
            <Option value="SpinBox" name="Style" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fclass">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="population">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="name">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias index="0" name="" field="osm_id"/>
    <alias index="1" name="" field="code"/>
    <alias index="2" name="" field="fclass"/>
    <alias index="3" name="" field="population"/>
    <alias index="4" name="" field="name"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" applyOnUpdate="0" field="osm_id"/>
    <default expression="" applyOnUpdate="0" field="code"/>
    <default expression="" applyOnUpdate="0" field="fclass"/>
    <default expression="" applyOnUpdate="0" field="population"/>
    <default expression="" applyOnUpdate="0" field="name"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" field="osm_id" constraints="0"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" field="code" constraints="0"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" field="fclass" constraints="0"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" field="population" constraints="0"/>
    <constraint notnull_strength="0" unique_strength="0" exp_strength="0" field="name" constraints="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" exp="" field="osm_id"/>
    <constraint desc="" exp="" field="code"/>
    <constraint desc="" exp="" field="fclass"/>
    <constraint desc="" exp="" field="population"/>
    <constraint desc="" exp="" field="name"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortOrder="1" sortExpression="&quot;name&quot;" actionWidgetStyle="dropDown">
    <columns>
      <column name="osm_id" width="-1" type="field" hidden="0"/>
      <column name="code" width="-1" type="field" hidden="0"/>
      <column name="fclass" width="-1" type="field" hidden="0"/>
      <column name="population" width="-1" type="field" hidden="0"/>
      <column name="name" width="-1" type="field" hidden="0"/>
      <column width="-1" type="actions" hidden="1"/>
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
    <field name="code" editable="1"/>
    <field name="fclass" editable="1"/>
    <field name="name" editable="1"/>
    <field name="osm_id" editable="1"/>
    <field name="population" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="code" labelOnTop="0"/>
    <field name="fclass" labelOnTop="0"/>
    <field name="name" labelOnTop="0"/>
    <field name="osm_id" labelOnTop="0"/>
    <field name="population" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>osm_id</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
