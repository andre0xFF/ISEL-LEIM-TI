<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:import href="section_article_container.xsl"/>
    
    <xsl:template name="video_detailed">
        <xsl:param name="video_id"/>
        
        <section id="detailed">
            <xsl:call-template name="video_medium"><xsl:with-param name="video_id" select="$video_id"/></xsl:call-template>
            
            <p><xsl:value-of select="//video[@id=$video_id]/@length"/></p>
            <p><xsl:value-of select="//video[@id=$video_id]/published_date"/></p>
            <p><xsl:value-of select="//video[@id=$video_id]/description"/></p>
        </section>
        
        <xsl:call-template name="section_article_container">
            <xsl:with-param name="id" select="'playlists'"/>
            <xsl:with-param name="description" select="'Playlists'"/>
            <xsl:with-param name="xpath" select="//playlist[@id=//playlist_video[@video_id=$video_id]/@playlist_id]"/>
            <xsl:with-param name="template" select="'playlist_medium'"/>
        </xsl:call-template>
        
        <xsl:call-template name="section_article_container">
            <xsl:with-param name="id" select="'related_videos'"/>
            <xsl:with-param name="description" select="'Related videos'"/>
            <xsl:with-param name="xpath" select="//video[tags/tag=//video[@id=$video_id]/tags/tag]"/>
            <xsl:with-param name="template" select="'video_medium'"/>
        </xsl:call-template>
        
        <xsl:call-template name="section_article_container">
            <xsl:with-param name="id" select="'comments'"/>
            <xsl:with-param name="description" select="'Comments'"/>
            <xsl:with-param name="xpath" select="//comment[@reference=$video_id]"/>
            <xsl:with-param name="template" select="'comment_minimized'"/>
        </xsl:call-template>
        
    </xsl:template>
</xsl:stylesheet>