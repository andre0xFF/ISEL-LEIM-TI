<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:import href="header.xsl"/>
    
    <xsl:template match="/" name="index">
        <xsl:result-document method="html" href="../index.html">
            <html>
                <head>
                    <link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet"/>
                    <link href="https://fonts.googleapis.com/css?family=Monoton" rel="stylesheet"/>
                    <link rel="stylesheet" href="./css/structure.css"/>
                    <link rel="stylesheet" href="./css/style.css"/>
                    <title>XMLTube</title> 
                </head>
                
                <body>
                    <xsl:call-template name="header"/>
                    
                    <nav id="intro">
                        <h2><a href="./lists/videos/videos.html">VIDEOS</a></h2>
                        <h2><a href="./lists/playlists/playlists.html">PLAYLISTS</a></h2>
                        <h2><a href="./lists/users/users.html">USERS</a></h2>
                        <br/>
                        <h4><a href="./lists/users/users_5_videos.html">Users with more than 5 published videos</a></h4>
                        <h4><a href="./lists/videos/videos_6_likes.html">Videos with more than 6 likes</a></h4>
                        <h4><a href="./lists/videos/videos_10_comments.html">Videos with more than 10 comments</a></h4>
                    </nav>
                    
                    <footer>
                        <p>Instituto Superior de Engenharia de Lisboa</p>
                        <p><a href="https://github.com/andrewfonseca" target="_blank">Andre' Fonseca 39758</a></p><br/>
                        <p>February, 2017</p>
                    </footer>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>