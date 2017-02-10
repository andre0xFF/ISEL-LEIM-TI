<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:import href="user_medium.xsl"/>
    <xsl:import href="section_article_container.xsl"/>
    
    <xsl:template name="user_detailed">
        <xsl:param name="username"/>
        
        <section id="detailed">
            <img class="user_img" src="{//user[@username=$username]/@photo}" alt=""/>
            <xsl:call-template name="user_medium"><xsl:with-param name="username" select="$username"></xsl:with-param></xsl:call-template>    
        </section>
        
        <xsl:call-template name="section_article_container">
            <xsl:with-param name="id" select="'published_videos'"/>
            <xsl:with-param name="description" select="'Published videos'"/>
            <xsl:with-param name="xpath" select="//video[@username=$username]"/>
            <xsl:with-param name="template" select="videos_medium"/>
        </xsl:call-template>
        
        <xsl:call-template name="section_article_container">
            <xsl:with-param name="id" select="'playlists'"/>
            <xsl:with-param name="description" select="'Playlists'"/>
            <xsl:with-param name="xpath" select="//playlist[@username=$username]"/>
            <xsl:with-param name="template" select="playlist_medium"/>
        </xsl:call-template>
        
        <xsl:call-template name="section_article_container">
            <xsl:with-param name="id" select="'subscribed_playlists'"/>
            <xsl:with-param name="description" select="'Subscribed playlists'"/>
            <xsl:with-param name="xpath" select="//playlist[@id=//subscriber[@username=$username]/@playlist_id]"/>
            <xsl:with-param name="template" select="playlist_medium"/>
        </xsl:call-template>
        
        <xsl:call-template name="section_article_container">
            <xsl:with-param name="id" select="'subscribed_channels'"/>
            <xsl:with-param name="description" select="'Subscribed channels'"/>
            <xsl:with-param name="xpath" select="//user[@username=//subscriber[@username=$username]/@channel]"/>
            <xsl:with-param name="template" select="user_medium"/>
        </xsl:call-template>
        
        <xsl:call-template name="section_article_container">
            <xsl:with-param name="id" select="'playlists_editor'"/>
            <xsl:with-param name="description" select="'Editor of playlists'"/>
            <xsl:with-param name="xpath" select="//playlist[@id=//editor[@username=$username]/@playlist_id]"/>
            <xsl:with-param name="template" select="playlist_medium"/>
        </xsl:call-template>
        
        <xsl:call-template name="section_article_container">
            <xsl:with-param name="id" select="'playlists_administrator'"/>
            <xsl:with-param name="description" select="'Administrator of playlists'"/>
            <xsl:with-param name="xpath" select="//playlist[@id=//administrator[@username=$username]/@playlist_id]"/>
            <xsl:with-param name="template" select="playlist_medium"/>
        </xsl:call-template>
        
        <xsl:call-template name="section_article_container">
            <xsl:with-param name="id" select="'comments'"/>
            <xsl:with-param name="description" select="'Comments'"/>
            <xsl:with-param name="xpath" select="//playlist[@id=//administrator[@username=$username]/@playlist_id]"/>
            <xsl:with-param name="template" select="comment"/>
        </xsl:call-template>
        
    </xsl:template>
</xsl:stylesheet>