<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template name="playlist_minimized">
        <xsl:param name="playlist_id"/>
            <section class="minimized">
                <img src="{//playlist[@id=$playlist_id]/@thumbnail}" alt="" class="thumbnail"/>
                <a href="../../playlists/detailed/{$playlist_id}.html"><p id="title"><xsl:value-of select="//playlist[@id=$playlist_id]/title"/></p></a>
                <a href="../../videos/detailed/{$playlist_id}.html#comments"><img src="../../images/comment.png" alt="Comments" class="icon"/><xsl:value-of select="count(//comment[@reference=$playlist_id])"/></a>
                <a href="../../videos/detailed/{$playlist_id}.html"><img src="../../images/like.png" alt="Likes" class="icon"/><xsl:value-of select="count(//like[@video_id=$playlist_id])"/></a>
                <a href="../../videos/detailed/{$playlist_id}.html"><img src="../../images/dislike.png" alt="Dislikes" class="icon"/><xsl:value-of select="count(//dislike[@video_id=$playlist_id])"/></a>
            </section>
    </xsl:template>
</xsl:stylesheet>