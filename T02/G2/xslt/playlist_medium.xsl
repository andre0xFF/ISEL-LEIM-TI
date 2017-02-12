<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:import href="playlist_minimized.xsl"/>
    <xsl:template name="playlist_medium">
        <xsl:param name="playlist_id"/>
        
        <xsl:variable name="username" select="//playlist[@id=$playlist_id]/@username"/>
        <section class="medium">
            <a href="../../users/detailed/{$username}.html"><p><xsl:value-of select="$username"/></p></a>
            <xsl:call-template name="playlist_minimized"><xsl:with-param name="playlist_id" select="$playlist_id"/></xsl:call-template>
        </section>
        
    </xsl:template>
</xsl:stylesheet>