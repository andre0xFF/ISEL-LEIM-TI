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
                    <title>XMLTube - User visualization</title> 
                </head>
                
                <body>
                    <xsl:call-template name="header"/>
                    
                    <nav id="intro">
                        <h2><a href="./lists/videos/videos.html">VIDEOS</a></h2>
                        <h2><a href="./lists/playlists/playlists.html">PLAYLISTS</a></h2>
                        <h2><a href="./lists/users/users.html">USERS</a></h2>
                    </nav>
                    
                    <footer>
                        <p>Instituto Superior de Engenharia de Lisboa</p>
                        <p>Andre' Fonseca 39758</p><br/>
                        <p>February, 2017</p>
                    </footer>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>