<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" 
                xmlns:hs="http://www.holidaywebservice.com/HolidayService_v2/"
                 exclude-result-prefixes="soap hs">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/soap:Envelope/soap:Body/hs:GetHolidaysForDateRangeResponse/hs:GetHolidaysForDateRangeResult">
        <holidays>
           <xsl:for-each select="./hs:Holiday">
                <xsl:variable name="holidayDate" select="./hs:Date"/>
                <holiday>
                    <holidayCode>
                        <xsl:value-of select="./hs:HolidayCode"/>
                    </holidayCode>
                    <holidayType>
                        <xsl:value-of select="./hs:HolidayType"/>
                    </holidayType>
                    <holidayDesc>
                        <xsl:value-of select="./hs:Descriptor" />
                    </holidayDesc>
                     <holidayDate>
                        <xsl:value-of select="format-dateTime($holidayDate, '[Y0001]-[M01]-[D01]')" />
                    </holidayDate>
                    <holidayDayOfTheWeek>
                        <xsl:value-of select="format-dateTime($holidayDate, '[F]')" />
                    </holidayDayOfTheWeek>
                </holiday>
            </xsl:for-each>
        </holidays>
    </xsl:template>
</xsl:stylesheet>