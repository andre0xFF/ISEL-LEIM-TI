<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:import href="video_medium.xsl"/>
    <xsl:import href="video_minimized.xsl"/>
    <xsl:import href="playlist_medium.xsl"/>
    <xsl:import href="playlist_minimized.xsl"/>
    <xsl:import href="user_medium.xsl"/>
    <xsl:import href="user_minimized.xsl"/>
    
    <xsl:template name="section_article_container">
        <xsl:param name="id"/>
        <xsl:param name="description"/>
        <xsl:param name="xpath"/>
        <xsl:param name="template"/>
        
        <h3 class="heading"><xsl:value-of select="$description"/></h3>
        <section id="{$id}" class="section_article_container">
            <section class="article_container">
                <xsl:for-each select="$xpath">
                    <xsl:if test="position() mod 2 != 0">

                        <xsl:choose>
                            <xsl:when test="$template = 'video_medium'">
                                <xsl:call-template name="video_medium"/>                          
                            </xsl:when>
                            <xsl:when test="$template = 'video_minimized'">
                                <xsl:call-template name="video_minimized"/>
                            </xsl:when>
                            <xsl:when test="$template = 'playlist_medium'">
                                <xsl:call-template name="playlist_medium"/>
                            </xsl:when>
                            <xsl:when test="$template = 'playlist_minimzed'">
                                <xsl:call-template name="playlist_minimized"/>
                            </xsl:when>
                            <xsl:when test="$template = 'user_medium'">
                                <xsl:call-template name="user_medium">
                                    <xsl:with-param name="username" select="@username"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="$template = 'user_minimized'">
                                <xsl:call-template name="user_minimized"/> 
                            </xsl:when>
                        </xsl:choose>

                    </xsl:if>
                </xsl:for-each>
            </section>
            <section class="article_container">
                <xsl:for-each select="$xpath">
                    <xsl:if test="position() mod 2 = 0">

                        <xsl:choose>
                            <xsl:when test="$template = 'video_medium'">
                                <xsl:call-template name="video_medium"/>                                
                            </xsl:when>
                            <xsl:when test="$template = 'video_minimized'">
                                <xsl:call-template name="video_minimized"/> 
                            </xsl:when>
                            <xsl:when test="$template = 'playlist_medium'">
                                <xsl:call-template name="playlist_medium"/> 
                            </xsl:when>
                            <xsl:when test="$template = 'playlist_minimzed'">
                                <xsl:call-template name="playlist_minimized"/> 
                            </xsl:when>
                            <xsl:when test="$template = 'user_medium'">
                                <xsl:call-template name="user_medium">
                                    <xsl:with-param name="username" select="@username"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="$template = 'user_minimized'">
                                <xsl:call-template name="user_minimized"/> 
                            </xsl:when>
                        </xsl:choose>
                        
                    </xsl:if>
                </xsl:for-each>
            </section>
        </section>
        
    </xsl:template>
</xsl:stylesheet>