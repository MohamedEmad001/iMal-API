Feature: Get Membership Details

Background:

* url 'http://192.168.112.44:8066/ISHRAQOnlineBankingIntegration.asmx'

Scenario: FunctionalTest
   Given request 
   """
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/">
   <soapenv:Header/>
   <soapenv:Body>
      <tem:GetCustomerSummary>
         <!--Optional:-->
         <tem:customerCIFNumber>188</tem:customerCIFNumber>
      </tem:GetCustomerSummary>
   </soapenv:Body>
</soapenv:Envelope>
"""

   And header Content-Type = "text/xml;charset=\"utf-8\""
   And soap action 'http:/tempuri.org/GetCustomerSummary'
   And Accept 'text/xml'
   When method POST
   Then status 200
   And match /Envelope/Body/AddResponse/AddResult == 5
   And print 'response: ', response
