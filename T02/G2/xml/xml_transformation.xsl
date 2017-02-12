<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE XMLTubeUserInfo SYSTEM "userInfo.dtd"&gt;</xsl:text>

        <XMLTubeUserInfo>
            <xsl:for-each select="//user">
                <xsl:variable name="u" select="."/>
                <user username="{$u/@username}" birthdate="{$u/birthday}" numberOfComments="{count(//comment[@username=$u/@username])}">
                    <name><xsl:value-of select="$u/name"/></name>
                    <xsl:for-each select="//video">
                        <xsl:variable name="v" select="."/>
                        <xsl:if test="$v[@username=$u/@username]">
                            <publishedVideo id="{$v/@id}">
                                <title><xsl:value-of select="$v/title"/></title>
                                <videoLink><xsl:value-of select="$v/@link"/></videoLink>
                            </publishedVideo>
                        </xsl:if>
                    </xsl:for-each>
                </user>
            </xsl:for-each>
        </XMLTubeUserInfo>
        
    </xsl:template>
</xsl:stylesheet>