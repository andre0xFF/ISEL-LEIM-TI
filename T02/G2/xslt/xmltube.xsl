<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:import href="users.xsl"/>
    <xsl:import href="videos.xsl"/>
    <xsl:import href="playlists.xsl"/>
    
    <xsl:template match="/">
        <xsl:call-template name="users"/>
        <xsl:call-template name="videos"/>
        <xsl:call-template name="playlists"/>
    </xsl:template>
    
</xsl:stylesheet>