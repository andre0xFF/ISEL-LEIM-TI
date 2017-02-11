<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:import href="head.xsl"/>
    <xsl:import href="header.xsl"/>
    <xsl:import href="video_detailed.xsl"/>
    
    <xsl:template name="videos" match="/">
        <xsl:call-template name="videos_list"/>
        <xsl:call-template name="videos_generator"/>
    </xsl:template>
    
    <xsl:template name="videos_list">
        <xsl:result-document method="html" href="../lists/videos/videos.html">
            <html>
                <xsl:call-template name="head"/>
                
                <body>
                    <xsl:call-template name="header"/> 
                    <xsl:call-template name="section_article_container">
                        <xsl:with-param name="id" select="'videos'"/>
                        <xsl:with-param name="description" select="'Videos'"/>
                        <xsl:with-param name="xpath" select="//video"/>
                        <xsl:with-param name="template" select="'video_medium'"/>
                    </xsl:call-template>
                </body>
                
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- GENERATE ALL VIDEOS -->
    <xsl:template name="videos_generator">
        <xsl:for-each select="//video">
            
            <!-- MINIMIZED -->
            <xsl:result-document method="html" href="../videos/minimized/{@id}.html">
                <html>
                    <xsl:call-template name="head"/>
                    
                    <body>
                        <xsl:call-template name="header"/>               
                        <xsl:call-template name="video_minimized" ><xsl:with-param name="video_id" select="@id"/></xsl:call-template>
                    </body>
                </html>
            </xsl:result-document>
            
            <!-- MEDIUM -->
            <xsl:result-document method="html" href="../videos/medium/{@id}.html">
                <html>
                    <xsl:call-template name="head"/>
                    
                    <body>
                        <xsl:call-template name="header"/>
                        <xsl:call-template name="video_medium"><xsl:with-param name="video_id" select="@id"/></xsl:call-template>
                    </body>
                </html>
            </xsl:result-document>
            
            <!-- DETAILED -->
            <xsl:result-document method="html" href="../videos/detailed/{@id}.html">
                <html>
                    <xsl:call-template name="head"/>
                    
                    <body>
                        <xsl:call-template name="header"/>
                        <xsl:call-template name="video_detailed"><xsl:with-param name="video_id" select="@id"/></xsl:call-template>
                    </body>
                </html>
            </xsl:result-document>
            
        </xsl:for-each>   
    </xsl:template>
    
</xsl:stylesheet>