<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:import href="head.xsl"/>

    <xsl:template match="XMLTube/users">
        <xsl:for-each select="user">

            <!-- MINIMIZED -->
            <xsl:result-document method="html" href="../users/minimized/{@username}.html">
                <html>
                    <xsl:call-template name="head"/>

                    <body>
                        <xsl:call-template name="header"/>
                        <xsl:call-template name="minimized"><xsl:with-param name="username" select="@username"/></xsl:call-template>
                    </body>
                </html>
            </xsl:result-document>

            <!-- MEDIUM -->
            <xsl:result-document method="html" href="../users/medium/{@username}.html">
                <html>
                    <xsl:call-template name="head"/>

                    <body>
                        <xsl:call-template name="header"/>
                        <xsl:call-template name="medium"><xsl:with-param name="username" select="@username"/></xsl:call-template>
                    </body>
                </html>
            </xsl:result-document>

            <!-- DETAILED -->
            <xsl:result-document method="html" href="../users/detailed/{@username}.html">
                <html>
                    <xsl:call-template name="head"/>

                    <body>
                        <xsl:call-template name="header"/>
                        <xsl:call-template name="detailed"><xsl:with-param name="username" select="@username"/></xsl:call-template>
                    </body>
                </html>
            </xsl:result-document>

        </xsl:for-each>

    </xsl:template>

    <xsl:template name="head">
        <head>
            <link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet"/>
            <link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet"/>
            <link rel="stylesheet" href="../../css/structure.css"/>
            <link rel="stylesheet" href="../../css/style.css"/>
            <title>XMLTube - User visualization</title>
        </head>
    </xsl:template>

    <xsl:template name="header">
        <header>
            <a href="../../index.xhtml"><h1 id="logo">XML TUBE</h1></a>
        </header>
    </xsl:template>

    <!-- MINIMIZED -->
    <xsl:template name="minimized">
        <xsl:param name="username"/>
            <section class="minimized">
                <a href="../detailed/{$username}.xhtml"><p><xsl:value-of select="$username"/></p></a>
                <a href="../detailed/{$username}.xhtml#published_videos"><img src="../../images/video.png" alt="Videos"/><xsl:value-of select="count(//video[@username=$username])"/></a>
                <a href="../detailed/{$username}.xhtml#comments"><img src="../../images/comment.png" alt="Comments"/><xsl:value-of select="count(//comment[@username=$username])"/></a>
                <a href="../detailed/{$username}.xhtml#likes"><img src="../../images/like.png" alt="Likes"/><xsl:value-of select="count(//like[@username=$username])"/></a>
                <a href="../detailed/{$username}.xhtml#dislikes"><img src="../../images/dislike.png" alt="Dislikes"/><xsl:value-of select="count(//dislike[@username=$username])"/></a>
            </section>
    </xsl:template>

    <!-- MEDIUM -->
    <xsl:template name="medium">
        <xsl:param name="username"/>
            <section class="medium">
                <p><xsl:value-of select="//user[@username=$username]/name"/></p>
                <p><xsl:value-of select="//user[@username=$username]/birthday/text()"/></p>
                <xsl:call-template name="minimized"><xsl:with-param name="username" select="$username"></xsl:with-param></xsl:call-template>
            </section>
    </xsl:template>

    <!-- DETAILED -->
    <xsl:template name="detailed">
        <xsl:param name="username"/>
        <section id="detailed">
            <img class="user_img" src="{//user[@username=$username]/@photo}" alt=""/>
            <xsl:call-template name="medium"><xsl:with-param name="username" select="$username"></xsl:with-param></xsl:call-template>
        </section>



    </xsl:template>
</xsl:stylesheet>
