<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:import href="user_minimized.xsl"/>
    <xsl:template name="user_medium">
        <xsl:param name="username"/>
        <section class="medium">
            <p><xsl:value-of select="//user[@username=$username]/name"/></p>
            <p><xsl:value-of select="//user[@username=$username]/birthday/text()"/></p>
            <xsl:call-template name="user_minimized"><xsl:with-param name="username" select="$username"/></xsl:call-template>
        </section>
    </xsl:template>
</xsl:stylesheet>