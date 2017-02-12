<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template name="video_minimized">
        <xsl:param name="video_id"/>
        <section class="minimized">
            <a href="{//video[@id=$video_id]/@link}" target="_blank"><img src="{//video[@id=$video_id]/@thumbnail}" alt="" class="thumbnail"/></a>
            <a href="../../videos/detailed/{$video_id}.html"><p id="title"><xsl:value-of select="//video[@id=$video_id]/title"/></p></a>
            <a href="../../videos/detailed/{$video_id}.html#comments"><img src="../../images/comment.png" alt="Comments" class="icon"/><xsl:value-of select="count(//comment[@reference=$video_id])"/></a>
            <a href="../../videos/detailed/{$video_id}.html"><img src="../../images/like.png" alt="Likes" class="icon"/><xsl:value-of select="count(//like[@video_id=$video_id])"/></a>
            <a href="../../videos/detailed/{$video_id}.html"><img src="../../images/dislike.png" alt="Dislikes" class="icon"/><xsl:value-of select="count(//dislike[@video_id=$video_id])"/></a>
        </section>
    </xsl:template>
</xsl:stylesheet>