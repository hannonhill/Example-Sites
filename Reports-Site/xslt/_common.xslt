<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template name="cascadelink">
        <xsl:param name="type"/>
        <xsl:param name="pageID"/>
        <a href="/entity/{$type}.act?id={$pageID}&amp;type=page" target="_parent">
            <span>
                <xsl:choose>
                    <xsl:when test="$type = 'open'">
                        <xsl:attribute name="class">fa fa-fw fa-search</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="$type = 'edit'">
                        <xsl:attribute name="class">fa fa-fw fa-pencil</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="$type = 'publish'">
                        <xsl:attribute name="class">fa fa-fw fa-paper-plane-o</xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </span>
        </a>
    </xsl:template>
    <xsl:template name="chooseDisplay">
        <xsl:choose>
            <xsl:when test="title">
                <xsl:value-of select="title"/>
            </xsl:when>
            <xsl:when test="display-name">
                <xsl:value-of select="display-name"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="name"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="noReportData">
        <p>There is nothing here because no reports have been created. Create a report of this type in one of your Sites to view data.</p>
    </xsl:template>
</xsl:stylesheet>