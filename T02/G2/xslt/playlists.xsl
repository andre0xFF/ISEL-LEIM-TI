<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:import href="head.xsl"/>
    <xsl:import href="header.xsl"/>
    <xsl:import href="playlist_detailed.xsl"/>
    
    <xsl:template name="playlists" match="/">
        <xsl:call-template name="playlists_list"/>
        <xsl:call-template name="playlists_generator"/>
    </xsl:template>
    
    <xsl:template name="playlists_list">
        <xsl:result-document method="html" href="../lists/playlists/playlists.html">
            <html>
                <xsl:call-template name="head"/>
                
                <body>
                    <xsl:call-template name="header"/> 
                    <xsl:call-template name="section_article_container">
                        <xsl:with-param name="id" select="'playlists'"/>
                        <xsl:with-param name="description" select="'Playlists'"/>
                        <xsl:with-param name="xpath" select="//playlist"/>
                        <xsl:with-param name="template" select="'playlist_medium'"/>
                    </xsl:call-template>
                </body>
                
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- GENERATE ALL VIDEOS -->
    <xsl:template name="playlists_generator">
        <xsl:for-each select="//playlist">
            
            <!-- MINIMIZED -->
            <xsl:result-document method="html" href="../playlists/minimized/{@id}.html">
                <html>
                    <xsl:call-template name="head"/>
                    
                    <body>
                        <xsl:call-template name="header"/>               
                        <xsl:call-template name="playlist_minimized" ><xsl:with-param name="playlist_id" select="@id"/></xsl:call-template>
                    </body>
                </html>
            </xsl:result-document>
            
            <!-- MEDIUM -->
            <xsl:result-document method="html" href="../playlists/medium/{@id}.html">
                <html>
                    <xsl:call-template name="head"/>
                    
                    <body>
                        <xsl:call-template name="header"/>
                        <xsl:call-template name="playlist_medium"><xsl:with-param name="playlist_id" select="@id"/></xsl:call-template>
                    </body>
                </html>
            </xsl:result-document>
            
            <!-- DETAILED -->
            <xsl:result-document method="html" href="../playlists/detailed/{@id}.html">
                <html>
                    <xsl:call-template name="head"/>
                    
                    <body>
                        <xsl:call-template name="header"/>
                        <xsl:call-template name="playlist_detailed"><xsl:with-param name="playlist_id" select="@id"/></xsl:call-template>
                    </body>
                </html>
            </xsl:result-document>
            
        </xsl:for-each>   
    </xsl:template>
</xsl:stylesheet>