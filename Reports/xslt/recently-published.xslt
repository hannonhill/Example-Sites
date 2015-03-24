<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="yes" omit-xml-declaration="yes"/>
    <xsl:include href="/_cascade/formats/xslt/_common"/>
    <xsl:include href="site://_Common Resources/formats/xslt/format-date"/>
    <xsl:variable name="currentTime" select="/system-index-block/@current-time"/>
    <xsl:template match="/system-index-block/calling-page/system-page">
        <xsl:variable name="range" select="$currentTime - (system-data-structure/range * 86400000)"/>
        <xsl:variable name="datetime" select="system-data-structure/datetime"/>
        <xsl:variable name="timestamp">
            <xsl:choose>
                <xsl:when test="system-data-structure/filter = 'Range'">
                    <xsl:value-of select="$range"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$datetime"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="recentPublishes" select="system-data-structure/block/content/system-index-block//system-page[last-published-on&gt;$timestamp][not(@current)]"/>
        <div class="row">
            <div class="col-xs-12">
                <h1>
                    <xsl:value-of select="title"/>
                </h1>
                <p>
                    <xsl:text>Pages published since </xsl:text>
                    <xsl:call-template name="format-date">
                        <xsl:with-param name="date" select="$timestamp"/>
                        <xsl:with-param name="mask">default</xsl:with-param>
                    </xsl:call-template>
                    <xsl:text>: </xsl:text>
                    <xsl:value-of select="count($recentPublishes)"/>
                </p>
            </div>
        </div>
        <hr/>
        <div class="row">
            <div class="col-xs-12">
                <xsl:choose>
                    <xsl:when test="count($recentPublishes) &gt; 0">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover table-condensed" id="reportTable">
                                <thead>
                                    <tr>
                                        <th>Page</th>
                                        <th>Last Publish</th>
                                        <th>Published By</th>
                                        <th class="col-xs-1 actions">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <xsl:apply-templates select="$recentPublishes">
                                        <xsl:sort data-type="number" order="descending" select="last-published-on"/>
                                    </xsl:apply-templates>
                                </tbody>
                            </table>
                        </div>
                    </xsl:when>
                    <xsl:otherwise>
                        <p>Nothing to show here. No pages were published within the range you selected.</p>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="system-page">
        <tr>
            <td>
                <a href="{link}">
                    <xsl:call-template name="chooseDisplay"/>
                </a>
                <xsl:text>&#160;</xsl:text>
                <small class="text-muted">
                    <xsl:value-of select="concat('[',path,']')"/>
                </small>
            </td>
            <td>
                <xsl:call-template name="format-date">
                    <xsl:with-param name="date" select="last-published-on"/>
                    <xsl:with-param name="mask">shortDate</xsl:with-param>
                </xsl:call-template>
            </td>
            <td>
                <xsl:value-of select="last-published-by"/>
            </td>
            <td>
                <xsl:call-template name="cascadelink">
                    <xsl:with-param name="type">open</xsl:with-param>
                    <xsl:with-param name="pageID" select="@id"/>
                </xsl:call-template>
                <xsl:call-template name="cascadelink">
                    <xsl:with-param name="type">edit</xsl:with-param>
                    <xsl:with-param name="pageID" select="@id"/>
                </xsl:call-template>
                <xsl:call-template name="cascadelink">
                    <xsl:with-param name="type">publish</xsl:with-param>
                    <xsl:with-param name="pageID" select="@id"/>
                </xsl:call-template>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>