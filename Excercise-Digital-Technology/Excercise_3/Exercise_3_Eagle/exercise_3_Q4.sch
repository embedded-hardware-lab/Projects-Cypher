<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.6.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="CC2640R2FRHBT">
<description>&lt;SimpleLink Bluetooth low energy wireless MCU&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by SamacSys&lt;/author&gt;</description>
<packages>
<package name="QFN50P500X500X100-33N">
<description>&lt;b&gt;RHB0032E&lt;/b&gt;&lt;br&gt;
</description>
<smd name="1" x="-2.45" y="1.75" dx="0.85" dy="0.3" layer="1"/>
<smd name="2" x="-2.45" y="1.25" dx="0.85" dy="0.3" layer="1"/>
<smd name="3" x="-2.45" y="0.75" dx="0.85" dy="0.3" layer="1"/>
<smd name="4" x="-2.45" y="0.25" dx="0.85" dy="0.3" layer="1"/>
<smd name="5" x="-2.45" y="-0.25" dx="0.85" dy="0.3" layer="1"/>
<smd name="6" x="-2.45" y="-0.75" dx="0.85" dy="0.3" layer="1"/>
<smd name="7" x="-2.45" y="-1.25" dx="0.85" dy="0.3" layer="1"/>
<smd name="8" x="-2.45" y="-1.75" dx="0.85" dy="0.3" layer="1"/>
<smd name="9" x="-1.75" y="-2.45" dx="0.85" dy="0.3" layer="1" rot="R90"/>
<smd name="10" x="-1.25" y="-2.45" dx="0.85" dy="0.3" layer="1" rot="R90"/>
<smd name="11" x="-0.75" y="-2.45" dx="0.85" dy="0.3" layer="1" rot="R90"/>
<smd name="12" x="-0.25" y="-2.45" dx="0.85" dy="0.3" layer="1" rot="R90"/>
<smd name="13" x="0.25" y="-2.45" dx="0.85" dy="0.3" layer="1" rot="R90"/>
<smd name="14" x="0.75" y="-2.45" dx="0.85" dy="0.3" layer="1" rot="R90"/>
<smd name="15" x="1.25" y="-2.45" dx="0.85" dy="0.3" layer="1" rot="R90"/>
<smd name="16" x="1.75" y="-2.45" dx="0.85" dy="0.3" layer="1" rot="R90"/>
<smd name="17" x="2.45" y="-1.75" dx="0.85" dy="0.3" layer="1"/>
<smd name="18" x="2.45" y="-1.25" dx="0.85" dy="0.3" layer="1"/>
<smd name="19" x="2.45" y="-0.75" dx="0.85" dy="0.3" layer="1"/>
<smd name="20" x="2.45" y="-0.25" dx="0.85" dy="0.3" layer="1"/>
<smd name="21" x="2.45" y="0.25" dx="0.85" dy="0.3" layer="1"/>
<smd name="22" x="2.45" y="0.75" dx="0.85" dy="0.3" layer="1"/>
<smd name="23" x="2.45" y="1.25" dx="0.85" dy="0.3" layer="1"/>
<smd name="24" x="2.45" y="1.75" dx="0.85" dy="0.3" layer="1"/>
<smd name="25" x="1.75" y="2.45" dx="0.85" dy="0.3" layer="1" rot="R90"/>
<smd name="26" x="1.25" y="2.45" dx="0.85" dy="0.3" layer="1" rot="R90"/>
<smd name="27" x="0.75" y="2.45" dx="0.85" dy="0.3" layer="1" rot="R90"/>
<smd name="28" x="0.25" y="2.45" dx="0.85" dy="0.3" layer="1" rot="R90"/>
<smd name="29" x="-0.25" y="2.45" dx="0.85" dy="0.3" layer="1" rot="R90"/>
<smd name="30" x="-0.75" y="2.45" dx="0.85" dy="0.3" layer="1" rot="R90"/>
<smd name="31" x="-1.25" y="2.45" dx="0.85" dy="0.3" layer="1" rot="R90"/>
<smd name="32" x="-1.75" y="2.45" dx="0.85" dy="0.3" layer="1" rot="R90"/>
<smd name="33" x="0" y="0" dx="3.55" dy="3.55" layer="1" rot="R90"/>
<text x="0" y="0" size="1.27" layer="25" align="center">&gt;NAME</text>
<text x="0" y="0" size="1.27" layer="27" align="center">&gt;VALUE</text>
<wire x1="-3.125" y1="3.125" x2="3.125" y2="3.125" width="0.05" layer="51"/>
<wire x1="3.125" y1="3.125" x2="3.125" y2="-3.125" width="0.05" layer="51"/>
<wire x1="3.125" y1="-3.125" x2="-3.125" y2="-3.125" width="0.05" layer="51"/>
<wire x1="-3.125" y1="-3.125" x2="-3.125" y2="3.125" width="0.05" layer="51"/>
<wire x1="-2.5" y1="2.5" x2="2.5" y2="2.5" width="0.1" layer="51"/>
<wire x1="2.5" y1="2.5" x2="2.5" y2="-2.5" width="0.1" layer="51"/>
<wire x1="2.5" y1="-2.5" x2="-2.5" y2="-2.5" width="0.1" layer="51"/>
<wire x1="-2.5" y1="-2.5" x2="-2.5" y2="2.5" width="0.1" layer="51"/>
<wire x1="-2.5" y1="2" x2="-2" y2="2.5" width="0.1" layer="51"/>
<circle x="-2.875" y="2.5" radius="0.125" width="0.25" layer="25"/>
</package>
</packages>
<symbols>
<symbol name="CC2640R2FRHBT">
<wire x1="5.08" y1="15.24" x2="35.56" y2="15.24" width="0.254" layer="94"/>
<wire x1="35.56" y1="-35.56" x2="35.56" y2="15.24" width="0.254" layer="94"/>
<wire x1="35.56" y1="-35.56" x2="5.08" y2="-35.56" width="0.254" layer="94"/>
<wire x1="5.08" y1="15.24" x2="5.08" y2="-35.56" width="0.254" layer="94"/>
<text x="36.83" y="20.32" size="1.778" layer="95" align="center-left">&gt;NAME</text>
<text x="36.83" y="17.78" size="1.778" layer="96" align="center-left">&gt;VALUE</text>
<pin name="RF_P" x="0" y="0" length="middle"/>
<pin name="RF_N" x="0" y="-2.54" length="middle"/>
<pin name="RX_TX" x="0" y="-5.08" length="middle"/>
<pin name="X32K_Q1" x="0" y="-7.62" length="middle"/>
<pin name="X32K_Q2" x="0" y="-10.16" length="middle"/>
<pin name="DIO_0" x="0" y="-12.7" length="middle"/>
<pin name="DIO_1" x="0" y="-15.24" length="middle"/>
<pin name="DIO_2" x="0" y="-17.78" length="middle"/>
<pin name="DIO_3" x="10.16" y="-40.64" length="middle" rot="R90"/>
<pin name="DIO_4" x="12.7" y="-40.64" length="middle" rot="R90"/>
<pin name="VDDS2" x="15.24" y="-40.64" length="middle" rot="R90"/>
<pin name="DCOUPL" x="17.78" y="-40.64" length="middle" rot="R90"/>
<pin name="JTAG_TMSC" x="20.32" y="-40.64" length="middle" rot="R90"/>
<pin name="JTAG_TCKC" x="22.86" y="-40.64" length="middle" rot="R90"/>
<pin name="DIO_5" x="25.4" y="-40.64" length="middle" rot="R90"/>
<pin name="DIO_6" x="27.94" y="-40.64" length="middle" rot="R90"/>
<pin name="DIO_11" x="40.64" y="0" length="middle" rot="R180"/>
<pin name="DIO_10" x="40.64" y="-2.54" length="middle" rot="R180"/>
<pin name="DIO_9" x="40.64" y="-5.08" length="middle" rot="R180"/>
<pin name="DIO_8" x="40.64" y="-7.62" length="middle" rot="R180"/>
<pin name="DIO_7" x="40.64" y="-10.16" length="middle" rot="R180"/>
<pin name="RESET_N" x="40.64" y="-12.7" length="middle" rot="R180"/>
<pin name="VDDS_DCDC" x="40.64" y="-15.24" length="middle" rot="R180"/>
<pin name="DCDC_SW" x="40.64" y="-17.78" length="middle" rot="R180"/>
<pin name="GND" x="10.16" y="20.32" length="middle" rot="R270"/>
<pin name="VDDR_RF" x="12.7" y="20.32" length="middle" rot="R270"/>
<pin name="X24M_P" x="15.24" y="20.32" length="middle" rot="R270"/>
<pin name="X24M_N" x="17.78" y="20.32" length="middle" rot="R270"/>
<pin name="VDDR" x="20.32" y="20.32" length="middle" rot="R270"/>
<pin name="VDDS" x="22.86" y="20.32" length="middle" rot="R270"/>
<pin name="DIO_14" x="25.4" y="20.32" length="middle" rot="R270"/>
<pin name="DIO_13" x="27.94" y="20.32" length="middle" rot="R270"/>
<pin name="DIO_12" x="30.48" y="20.32" length="middle" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="CC2640R2FRHBT" prefix="IC">
<description>&lt;b&gt;SimpleLink Bluetooth low energy wireless MCU&lt;/b&gt;&lt;p&gt;
Source: &lt;a href="http://www.ti.com/lit/gpn/CC2640R2F"&gt; Datasheet &lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="CC2640R2FRHBT" x="0" y="0"/>
</gates>
<devices>
<device name="" package="QFN50P500X500X100-33N">
<connects>
<connect gate="G$1" pin="DCDC_SW" pad="17"/>
<connect gate="G$1" pin="DCOUPL" pad="12"/>
<connect gate="G$1" pin="DIO_0" pad="6"/>
<connect gate="G$1" pin="DIO_1" pad="7"/>
<connect gate="G$1" pin="DIO_10" pad="23"/>
<connect gate="G$1" pin="DIO_11" pad="24"/>
<connect gate="G$1" pin="DIO_12" pad="25"/>
<connect gate="G$1" pin="DIO_13" pad="26"/>
<connect gate="G$1" pin="DIO_14" pad="27"/>
<connect gate="G$1" pin="DIO_2" pad="8"/>
<connect gate="G$1" pin="DIO_3" pad="9"/>
<connect gate="G$1" pin="DIO_4" pad="10"/>
<connect gate="G$1" pin="DIO_5" pad="15"/>
<connect gate="G$1" pin="DIO_6" pad="16"/>
<connect gate="G$1" pin="DIO_7" pad="20"/>
<connect gate="G$1" pin="DIO_8" pad="21"/>
<connect gate="G$1" pin="DIO_9" pad="22"/>
<connect gate="G$1" pin="GND" pad="33"/>
<connect gate="G$1" pin="JTAG_TCKC" pad="14"/>
<connect gate="G$1" pin="JTAG_TMSC" pad="13"/>
<connect gate="G$1" pin="RESET_N" pad="19"/>
<connect gate="G$1" pin="RF_N" pad="2"/>
<connect gate="G$1" pin="RF_P" pad="1"/>
<connect gate="G$1" pin="RX_TX" pad="3"/>
<connect gate="G$1" pin="VDDR" pad="29"/>
<connect gate="G$1" pin="VDDR_RF" pad="32"/>
<connect gate="G$1" pin="VDDS" pad="28"/>
<connect gate="G$1" pin="VDDS2" pad="11"/>
<connect gate="G$1" pin="VDDS_DCDC" pad="18"/>
<connect gate="G$1" pin="X24M_N" pad="30"/>
<connect gate="G$1" pin="X24M_P" pad="31"/>
<connect gate="G$1" pin="X32K_Q1" pad="4"/>
<connect gate="G$1" pin="X32K_Q2" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="ARROW_PART_NUMBER" value="CC2640R2FRHBT" constant="no"/>
<attribute name="ARROW_PRICE-STOCK" value="https://www.arrow.com/en/products/cc2640r2frhbt/texas-instruments?region=nac" constant="no"/>
<attribute name="DESCRIPTION" value="SimpleLink Bluetooth low energy wireless MCU" constant="no"/>
<attribute name="HEIGHT" value="1mm" constant="no"/>
<attribute name="MANUFACTURER_NAME" value="Texas Instruments" constant="no"/>
<attribute name="MANUFACTURER_PART_NUMBER" value="CC2640R2FRHBT" constant="no"/>
<attribute name="MOUSER_PART_NUMBER" value="595-CC2640R2FRHBT" constant="no"/>
<attribute name="MOUSER_PRICE-STOCK" value="https://www.mouser.co.uk/ProductDetail/Texas-Instruments/CC2640R2FRHBT?qs=6ZHl3BmPMW1THU0nD14Wvg%3D%3D" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="IC1" library="CC2640R2FRHBT" deviceset="CC2640R2FRHBT" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="IC1" gate="G$1" x="20.32" y="60.96" smashed="yes">
<attribute name="NAME" x="57.15" y="81.28" size="1.778" layer="95" align="center-left"/>
<attribute name="VALUE" x="57.15" y="78.74" size="1.778" layer="96" align="center-left"/>
</instance>
</instances>
<busses>
</busses>
<nets>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
