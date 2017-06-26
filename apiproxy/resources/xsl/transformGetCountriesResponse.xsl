<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" 
                xmlns:hs="http://www.holidaywebservice.com/HolidayService_v2/"
                 exclude-result-prefixes="soap hs">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/soap:Envelope/soap:Body/hs:GetCountriesAvailableResponse/hs:GetCountriesAvailableResult">
        <countries>
           <xsl:for-each select="./hs:CountryCode">
                <country>
                    <countryCode>
                        <xsl:value-of select="./hs:Code"/>
                    </countryCode>
                    <countryName>
                        <xsl:value-of select="./hs:Description" />
                    </countryName>
                </country>
            </xsl:for-each>
        </countries>
    </xsl:template>
</xsl:stylesheet>