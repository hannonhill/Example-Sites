<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="yes" omit-xml-declaration="yes"/>
    <xsl:include href="/_cascade/formats/xslt/_common"/>
    <xsl:template match="/">
        <xsl:variable name="noTitleDisplay" select="count(system-index-block/system-page/system-data-structure/block/content/system-index-block//system-page[not(title | display-name)])"/>
        <div class="row">
            <div class="col-xs-12">
                <h1>
                    <xsl:value-of select="system-index-block/calling-page/system-page/title"/>
                </h1>
                <p>
                    <xsl:text>Pages with no Title or Display Name: </xsl:text>
                    <xsl:value-of select="$noTitleDisplay"/>
                    <xsl:text>. View the table below for the breakdown by Site.</xsl:text>
                </p>
            </div>
        </div>
        <hr/>
        <div class="row">
            <div class="col-xs-12">
                <xsl:choose>
                    <xsl:when test="$noTitleDisplay &gt; 0">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover table-condensed" id="reportTable">
                                <thead>
                                    <tr>
                                        <th>Site</th>
                                        <th>Number of Pages</th>
                                        <th class="col-xs-1 actions">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <xsl:apply-templates select="system-index-block/system-page[system-data-structure/block/content/system-index-block//system-page[not(title | display-name)]]">
                                        <xsl:sort data-type="text" order="ascending" select="site"/>
                                    </xsl:apply-templates>
                                </tbody>
                            </table>
                        </div>
                    </xsl:when>
                    <xsl:otherwise>
                        <p>Nothing to show here. Good job!</p>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="system-page">
        <tr>
            <td>
                <a href="{link}">
                    <xsl:value-of select="site"/>
                </a>
            </td>
            <td>
                <xsl:value-of select="count(system-data-structure/block/content/system-index-block//system-page[not(title | display-name)])"/>
            </td>
            <td>
                <xsl:call-template name="cascadelink">
                    <xsl:with-param name="type">open</xsl:with-param>
                    <xsl:with-param name="pageID" select="@id"/>
                </xsl:call-template>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>