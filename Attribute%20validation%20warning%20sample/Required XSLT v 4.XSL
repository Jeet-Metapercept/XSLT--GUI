<!--S†åR™-->
<?xml version='1.0' encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs	= "http://www.w3.org/2001/XMLSchema"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:db="http://docbook.org/ns/docbook"
    version="3.0"
    xmlns:gui	= "http://www.dita-semia.org/xslt-gui"
    extension-element-prefixes	= "gui"
    exclude-result-prefixes		= "#all"
    expand-text					= "yes">
    <xsl:output omit-xml-declaration="yes" indent="yes" encoding="UTF-8"/>
    
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="title">
       
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="id"><xsl:value-of select="
                concat(
                'URL = ',
                system-property('user.dir'),' ',
                format-dateTime(current-dateTime(), '[Y0001]-[M01]-[D01]-[H01]-[m01]-[s01]')
                )"/></xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
      
    </xsl:template>
    
  <!-- check label -->
    
    
    <xsl:template match="chapter/@label">
        <xsl:message terminate="no">
            
        </xsl:message>
    </xsl:template>
    
    <xsl:template match="chapter[not(@label)]">
        Error: Label attribute missing.
        <xsl:variable name="current-tag" select="
            concat(
            local-name(), 
            
            '>'
            )"/>
        <gui:message-dialog title="Warning!" icon="error">
            <!--<xsl:value-of select="$current-tag"/>-->
            <xsl:text>Chapter </xsl:text>
            <xsl:text>Label not available.  </xsl:text>
        </gui:message-dialog>
        
        <xsl:message terminate="no">Error!</xsl:message>
    </xsl:template>
    
</xsl:stylesheet>

<!-- @Metapercept #Jeet-->