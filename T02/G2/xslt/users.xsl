<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:import href="head.xsl"/>
    <xsl:import href="header.xsl"/>
    <xsl:import href="user_minimized.xsl"/>
    <xsl:import href="user_medium.xsl"/>
    <xsl:import href="user_detailed.xsl"/>
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="/" name="users_list">
        <xsl:result-document method="html" href="../lists/users/users.html">
            <html>
                <xsl:call-template name="head"/>
                
                <body>
                    <xsl:call-template name="header"/> 
                    <xsl:call-template name="section_article_container">
                        <xsl:with-param name="id" select="'users'"/>
                        <xsl:with-param name="description" select="'Users'"/>
                        <xsl:with-param name="xpath" select="//user"/>
                        <xsl:with-param name="template" select="'user_medium'"/>
                    </xsl:call-template>
                </body>
                
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="/" name="users">
        <xsl:for-each select="//user">
            
            <!-- MINIMIZED -->
            <xsl:result-document method="html" href="../users/minimized/{@username}.html">
                <html>
                    <xsl:call-template name="head"/>
                    
                    <body>
                        <xsl:call-template name="header"/>               
                        <xsl:call-template name="user_minimized"><xsl:with-param name="username" select="@username"/></xsl:call-template>
                    </body>
                </html>
            </xsl:result-document>
            
            <!-- MEDIUM -->
            <xsl:result-document method="html" href="../users/medium/{@username}.html">
                <html>
                    <xsl:call-template name="head"/>
                    
                    <body>
                        <xsl:call-template name="header"/>
                        <xsl:call-template name="user_medium"><xsl:with-param name="username" select="@username"/></xsl:call-template>
                    </body>
                </html>
            </xsl:result-document>
            
            <!-- DETAILED -->
            <xsl:result-document method="html" href="../users/detailed/{@username}.html">
                <html>
                    <xsl:call-template name="head"/>
                    
                    <body>
                        <xsl:call-template name="header"/>
                        <xsl:call-template name="user_detailed"><xsl:with-param name="username" select="@username"/></xsl:call-template>
                    </body>
                </html>
            </xsl:result-document>
            
        </xsl:for-each>   
    </xsl:template>

</xsl:stylesheet>