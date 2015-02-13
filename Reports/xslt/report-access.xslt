<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="yes" omit-xml-declaration="yes"/>
    <xsl:include href="/_cascade/formats/xslt/_common"/>
    <xsl:include href="site://_Common Resources/formats/xslt/format-date"/>
    <xsl:variable name="userGroups">
        <xsl:for-each select="/system-index-block/user-information/groups/group">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()">
                <xsl:text>|</xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="userDisplayName">
        <xsl:choose>
            <xsl:when test="/system-index-block/user-information/full-name != ''">
                <xsl:value-of select="/system-index-block/user-information/full-name"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="/system-index-block/user-information/username"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:template match="/system-index-block">
        <xsl:variable name="reports" select="system-page[name!='index'][access-rights[group[contains($userGroups,name)][permission='read']]]"/>
        <div class="row">
            <div class="col-xs-12">
                <h1>
                    <xsl:value-of select="calling-page/system-page/title"/>
                </h1>
                <p>
                    <xsl:text>Reports you have access to: </xsl:text>
                    <xsl:value-of select="count($reports)"/>
                </p>
            </div>
        </div>
        <hr/>
        <div class="row">
            <div class="col-xs-12">
                <xsl:choose>
                    <xsl:when test="count($reports) &gt; 0">
                        <ul>
                            <xsl:apply-templates select="$reports"/>
                        </ul>
                    </xsl:when>
                    <xsl:otherwise>
                        <p>Currently you do not have access to any reports.</p>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="system-page">
        <li>
            <a href="{link}">
                <xsl:call-template name="chooseDisplay"/>
            </a>
        </li>
    </xsl:template>
</xsl:stylesheet>