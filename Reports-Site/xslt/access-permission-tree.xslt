<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="yes" omit-xml-declaration="yes"/>
    <xsl:template match="/system-index-block/calling-page/system-page">
        <xsl:variable name="assets" select="system-data-structure/block/content/system-index-block/system-page | system-data-structure/block/content/system-index-block/system-folder[descendant::system-page]"/>
        <div class="row">
            <div class="col-xs-12">
                <h1>
                    <xsl:value-of select="title"/>
                </h1>
                <p>Listing all the pages/folders and who has access.</p>
            </div>
        </div>
        <hr/>
        <div class="row">
            <div class="col-xs-12">
                <xsl:choose>
                    <xsl:when test="count($assets) &gt; 0">
                        <ul>
                            <xsl:apply-templates select="$assets"/>
                        </ul>
                    </xsl:when>
                    <xsl:otherwise>
                        <p>Nothing to show here. Go create some content!</p>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="system-page">
        <li>
            <a href="{link}">
                <xsl:value-of select="path"/>
            </a>
            <xsl:apply-templates select="access-rights"/>
        </li>
    </xsl:template>
    <xsl:template match="system-folder">
        <li>
            <a href="/entity/open.act?id={@id}&amp;type=folder" target="_parent">
                <xsl:value-of select="path"/>
            </a>
            <xsl:apply-templates select="access-rights"/>
            <xsl:if test="count(system-page | system-folder[descendant::system-page]) &gt; 0">
                <ul>
                    <xsl:apply-templates select="system-page | system-folder[descendant::system-page]"/>
                </ul>
            </xsl:if>
        </li>
    </xsl:template>
    <xsl:template match="access-rights">
        <xsl:text> ( </xsl:text>
        <xsl:apply-templates select="user | group">
            <xsl:sort data-type="text" order="ascending" select="name"/>
        </xsl:apply-templates>
        <xsl:text>)</xsl:text>
    </xsl:template>
    <xsl:template match="user | group">
        <xsl:value-of select="name"/>
        <xsl:text>:</xsl:text>
        <span>
            <xsl:choose>
                <xsl:when test="permission = 'read'">
                    <xsl:attribute name="class">text-success</xsl:attribute>
                </xsl:when>
                <xsl:when test="permission = 'write'">
                    <xsl:attribute name="class">text-danger</xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <xsl:value-of select="permission"/>
        </span>
        <xsl:text>; </xsl:text>
    </xsl:template>
</xsl:stylesheet>