<?xml version="1.0"?>
<xsl:stylesheet xmlns:edate="http://exslt.org/dates-and-times"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns:txm="http://textometrie.org/ns/1.0"
  exclude-result-prefixes="tei edate" xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">

  <!--
This software is dual-licensed:

1. Distributed under a Creative Commons Attribution-ShareAlike 3.0
Unported License http://creativecommons.org/licenses/by-sa/3.0/ 

2. http://www.opensource.org/licenses/BSD-2-Clause
		
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

* Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.

This software is provided by the copyright holders and contributors
"as is" and any express or implied warranties, including, but not
limited to, the implied warranties of merchantability and fitness for
a particular purpose are disclaimed. In no event shall the copyright
holder or contributors be liable for any direct, indirect, incidental,
special, exemplary, or consequential damages (including, but not
limited to, procurement of substitute goods or services; loss of use,
data, or profits; or business interruption) however caused and on any
theory of liability, whether in contract, strict liability, or tort
(including negligence or otherwise) arising in any way out of the use
of this software, even if advised of the possibility of such damage.

     
This stylesheet adds a ref attribute to w elements that will be used for
references in TXM concordances. Can be used with TXM XTZ import module.

Written by Alexei Lavrentiev, UMR 5317 IHRIM, 2017
  -->


  <xsl:output method="xml" encoding="utf-8" omit-xml-declaration="no"/> 
  
  
  <!-- General patterns: all elements, attributes, comments and processing instructions are copied -->
  
  <xsl:template match="*">      
        <xsl:copy>
          <xsl:apply-templates select="*|@*|processing-instruction()|comment()|text()"/>
        </xsl:copy>    
  </xsl:template>
  
  <xsl:template match="*" mode="position"><xsl:value-of select="count(preceding-sibling::*)"/></xsl:template>

  <xsl:template match="@*|comment()|processing-instruction()">
    <xsl:copy/>
  </xsl:template>
  
  <xsl:variable name="filename">
    <xsl:analyze-string select="document-uri(.)" regex="^(.*)/([^/]+)\.xml$">
      <xsl:matching-substring>
        <xsl:value-of select="regex-group(2)"/>
      </xsl:matching-substring>
    </xsl:analyze-string>
  </xsl:variable>
  

  <xsl:template match="*:w">
  <!--
    <xsl:variable name="fullref">
      <xsl:choose>
        <xsl:when test="ancestor::*:text/@*:id">
          <xsl:value-of select="ancestor::*:text[1]/@*:id[1]"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$filename"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="ancestor::*:chapter[1]/@nAlpha">
        <xsl:text>, ch. </xsl:text>
        <xsl:value-of select="ancestor::*:chapter[1]/@nAlpha"/>
      </xsl:if>
      <xsl:if test="ancestor::*:section[1]/@nAlpha">
        <xsl:text>, § </xsl:text>
        <xsl:value-of select="ancestor::*:section[1]/@nAlpha"/>
      </xsl:if>
      <xsl:if test="preceding::*:pb[1]/@n">
        <xsl:text>, p. </xsl:text>
        <xsl:value-of select="preceding::*:pb[1]/@n"/>
      </xsl:if>


    </xsl:variable>

-->

    <xsl:variable name="ref">
      <xsl:value-of select="$filename"/>
      <xsl:if test="ancestor::*:div[1]/@n">
        <xsl:text>, ch</xsl:text>
        <xsl:value-of select="ancestor::*:div[1]/@n"/>
      </xsl:if>
      <xsl:if test="ancestor::*:p[1]/@n">
        <xsl:text>, §</xsl:text>
        <xsl:value-of select="ancestor::*:p[1]/@n"/>
      </xsl:if>
      <xsl:if test="preceding::*:pb[1]/@n">
        <xsl:text>, p.</xsl:text>
        <xsl:value-of select="preceding::*:pb[1]/@n"/>
      </xsl:if>
      <!--      <xsl:if test="preceding::*:lb[1]/@txmN">
        <xsl:text>, l. </xsl:text>
        <xsl:value-of select="preceding::*:lb[1]/@txmN"/>
      </xsl:if>-->
    </xsl:variable>
    
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="ref"><xsl:value-of select="$ref"/></xsl:attribute>
   <!--   <xsl:attribute name="fullref"><xsl:value-of select="$fullref"/></xsl:attribute> -->
      <xsl:apply-templates select="*|processing-instruction()|comment()|text()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
