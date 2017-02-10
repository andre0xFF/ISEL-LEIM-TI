<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template name="user_minimized">
        <xsl:param name="username"/>
        <section class="minimized">
            <a href="../../users/detailed/{$username}.html"><p><xsl:value-of select="$username"/></p></a>
            <a href="../../users/detailed/{$username}.html#published_videos"><img src="../../images/video.png" alt="Videos"/><xsl:value-of select="count(//video[@username=$username])"/></a>
            <a href="../../users/detailed/{$username}.html#comments"><img src="../../images/comment.png" alt="Comments"/><xsl:value-of select="count(//comment[@username=$username])"/></a>
            <a href="../../users/detailed/{$username}.html#likes"><img src="../../images/like.png" alt="Likes"/><xsl:value-of select="count(//like[@username=$username])"/></a>
            <a href="../../users/detailed/{$username}.html#dislikes"><img src="../../images/dislike.png" alt="Dislikes"/><xsl:value-of select="count(//dislike[@username=$username])"/></a>
        </section>
    </xsl:template>
</xsl:stylesheet>