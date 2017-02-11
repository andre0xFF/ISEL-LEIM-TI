<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template name="comment_minimized">
        <xsl:param name="comment_id"/>
        <xsl:variable name="comment" select="//comment[@id=$comment_id]"/>
        
        <section class="minimized">
            <p id="username">
                <a href="../../users/detailed/{$comment/@username}.html"><xsl:value-of select="$comment/@username"/></a> - 
                <xsl:value-of select="$comment/date"/> - 
                <a href="../detailed/{$comment/@username}.html"><img src="../../images/like.png" alt="Likes" class="icon"/><xsl:value-of select="count(//like[@comment_id=$comment/@id])"/></a>
                <a href="../detailed/{$comment/@username}.html"><img src="../../images/dislike.png" alt="Dislikes" class="icon"/><xsl:value-of select="count(//dislike[@comment_id=$comment/@id])"/></a>
            </p>
            
            <p><xsl:value-of select="//$comment/content"/></p>
        </section>
        
    </xsl:template>
</xsl:stylesheet>