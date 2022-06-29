#!/bin/bash -e
mkdir -p /etc/3cxpbx
cat > /etc/3cxpbx/setupconfig.xml << "<EOF>"
<?xml version="1.0" encoding="utf-8"?>
<ArrayOfSerializedQuestion xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<SetupConfig xmlns:xsd=http://www.w3.org/2001/XMLSchema xmlns:xsi=http://www.w3.org/2001/XMLSchema-instance>
  <tcxinit>
    <option>
      <code>InstallationType</code>
      <answer>new</answer><!--New install "new", restore Backup  = "restore"-->
    </option>
    <option>
      <code>LicenseKey</code>
      <answer>xxxxx</answer>
    </option>
    <option>
      <code>BackupFile</code><!--If New install skip this-->
      <answer /><!--If you want to restore a backup put a reachable path from where the backup can be downloaded from. Can be actual physical path on local machine or http link-->
    </option>
    <option>
      <code>BackupPassword</code><!--Password for backup file (if backup is encrypted)-->
      <answer />
    </option>
    <option>
      <code>AdminUsername</code>
      <answer>admin</answer><!--Admin Username-->
    </option>
    <option>
      <code>AdminPassword</code>
      <answer>${adminpassword}</answer><!--Admin Pasword-->
    </option>
    <option>
      <code>PublicIP</code>
      <answer>auto</answer><!--"auto" means automatically detect the ip address. Useful in most cases. Otherwise you can put "manual" and fill in Manual Public IP below-->
    </option>
    <option>
      <code>ManualPublicIP</code><!--If public IP = "manual" enter ip here. if "auto" skip-->
      <answer />
    </option>
    <option>
      <code>StaticOrDynamicIP</code>
      <answer>static</answer><!--If your public ip is Static (does not change) use "static" otherwise use "dynamic"-->
    </option>
    <option>
      <code>LocalIP</code><!--Here we ask to choose the local ip of the machine. If you have no nat then the public is taken-->
      <answer>auto</answer><!--if auto it takes the first ip on the network stack in the list. If you answer with the "manual" option (in multiple nic adapters you will have more interfaces,) then you need to populate the next option ManualLocalIP with the local IP Address you want"-->
    </option>
    <option>
      <code>ManualLocalIP</code><!--Answer only if above question you choose that you want to enter ip manually-->
    <answer></answer>
    </option>
    <option>
      <code>NeedFqdn</code>
      <answer>yes</answer><!-- enter "yes" to get a 3CX FQDN. enter "no" to use your fqdn (custom domains)-->
    </option>
    <option>
      <code>Hostname</code>
      <answer>peoplefone-roadshow</answer><!--enter your hostname example contoso - the company name - This option needs to be filled in if NeedFqdn is yes. Skip if need fqdn is NO-->
    </option>
  <option>
  <!--
    Select Domain Group:
    (1) Africa
    (2) Asia
    (3) Cities
    (4) Continent
    (5) Europe
    (6) Oceania
    (7) Other
    (8) South America
    (9) United States
   
    List of available suffixes per Domain Group can be found on:https://activation.3cx.com/apiv2/domains  
  -->
    <code>DomainGroup</code>
    <answer>Europe</answer>
  </option>
    <option>
      <code>DnsSuffix</code> <!--This option needs to be selected in NeedFqdn is yes. List of available suffixes per Domain Group can be found on:https://activation.3cx.com/apiv2/domains Skip if need fqdn is NO. -->
      <answer>ch</answer>
    </option>
    <option>
      <code>FullExternalFqdn</code><!--This should be populated if NeedFqdn = "no". -->
      <answer>peoplefone-roadshow.3cx.ch</answer><!--User selected needfqdn = no. This means you have an fqdn so enter your fully qualified domain here example pbx.contoso.com-->
    </option>
    <option>
      <code>CertificatePath</code><!--Use if NeedFqdn = "no". -->
      <answer></answer><!--This is the certificate file which can be either a path, http link or just copy and paste the whole contents of the certificate - Including the "BEGIN certificate part"-->
    </option>
    <option>
      <code>CertificatePassword</code><!--Use if NeedFqdn = "no". -->
      <answer></answer><!--This is the PFX certificate password. Shows only when you select a pfx file"-->
    </option>
    <option>
      <code>CertificateKey</code><!--Use if NeedFqdn = "no". -->
      <answer></answer><!--This is the certificate key which can be either a path, http link or it can be the whole contents of the pem file.. Including the "BEGIN certificate part Applies to PEM Certs"-->
    </option>
    <option>
      <code>CertificateKeyPasswordRequest</code><!--Use if NeedFqdn = "no". -->
      <answer /><!-- It could be that the pem file is encrypted, so without the key, setupconfig will download the file but will not be able to decrypt it unless we enter the password request key here.-->
    </option>
    <option>
      <code>HasLocalDns</code><!--"yes" assumes that you have a manageable local dns example windows dns. "no" assumes that you do not have a dns and therefore will fallback to using IP Addresses -->
      <answer>yes</answer>
    </option>
    <option>
      <code>InternalFqdn</code><!--Used when HasLocalDns = yes. Can be skipped if HasLocalDns = no-->
      <answer>pbx.exoscale.internal</answer><!--this is the full internal FQDN. If in HasLocalDns  you select "yes", this means you have a managed dns so therefore we need to know the FQDN local. if you select 2 then you can skip this out. "-->
    </option>
    <option>
      <code>HttpsPort</code>
      <answer>5001</answer>
    </option>
    <option>
      <code>HttpPort</code>
      <answer>5000</answer>
    </option>
  <option>
      <code>SipPort</code>
      <answer>5060</answer>
    </option>
  <option>
      <code>TunnelPort</code>
      <answer>5090</answer>
    </option>
    <option>
      <code>NumberOfExtensions</code> <!--How many digits your extensions should have. Default is 3 Digits. Note that the system reserves 30 numbers for system extension. This can not be changed later. -->
      <answer>3</answer>
    </option>
    <option>
      <code>AdminEmail</code>
      <answer>${adminemail}</answer> <!-- Email for important system notifications such as 3CX Updates, Service failures, Hacking attempts, Network Errors, Emergencies and other diagnostics.-->
    </option>
  <option>
  <!--
    Mail Server Configuration. One of values: 3CX, Custom or one of SMTP server names from: https://downloads.3cx.com/downloads/v155/templates/smtp/smtpproviders.html . With free key (3CXPSPBX) you can use only 3CX SMTP provider
    You can use a Gmail account. More info here: https://www.3cx.com/blog/docs/gmail-mail-server/. Select mail server type:
    (1) 3CX SMTP server
    (2) Custom SMTP server
    (3) Gmail (smtp.gmail.com:587)
    (4) Outlook.com (smtp-mail.outlook.com:587)
    (5) Office365 (smtp.office365.com:587)
  -->
      <code>MailServerType</code>
      <answer>3CX</answer>
    </option>
    <option>
      <code>MailServerAddress</code> <!-- Email server details to be used for notifications, voicemails and invites. You can use a Gmail account. More info here: https://www.3cx.com/blog/docs/gmail-mail-server/-->
      <answer></answer>
    </option>
    <option>
      <code>MailServerReplyTo</code>
      <answer></answer>
    </option>
    <option>
      <code>MailServerUserName</code> <!-- Can be empty -->
      <answer></answer>
    </option>
    <option>
      <code>MailServerPassword</code> <!-- Can be empty -->
      <answer></answer>
    </option>
    <option>
      <code>MailServerEnableSslTls</code>
      <answer></answer>
    </option>
  <option>
    <!--
    Continent name one of:
    North America
    South America
    Europe
    Asia and the Middle East
    Africa
    Australia
    -->
    <code>Continent</code>
    <answer>Europe</answer>
  </option>
    <option>
      <code>Country</code> <!-- Country name from here http://www.3cx.com/wp-content/uploads/2016/11/Time-Zone-Sheet1-1.pdf  -->
      <answer>Switzerland</answer>
    </option>
    <option>
      <code>Timezone</code> <!--get codes from here http://www.3cx.com/wp-content/uploads/2016/11/Time-Zone-Sheet1-1.pdf -->
      <answer>58</answer>
    </option>
    <option>
      <code>OperatorExtension</code>
      <answer>998</answer>
    </option>
    <option>
      <code>OperatorFirstName</code> <!-- Operator first name. Can be empty. -->
      <answer>${operatorfirstname}</answer>
    </option>
    <option>
      <code>OperatorLastName</code> <!-- Operator last name. Can be empty. -->
      <answer>OperatorLastName</answer>
    </option>
    <option>
      <code>OperatorEmail</code>
      <answer>${adminemail}</answer>
    </option>
    <option>
      <code>OperatorVoicemail</code>
      <answer>999</answer>
    </option>
    <option>
      <code>Promptset</code>
      <answer>French</answer> <!-- get data from http://downloads.3cx.com/downloads/v150/templates/promptsets/promptsets.xml-->
    </option>
    <option>
      <code>LicenseContactName</code>
      <answer>LicenseContactName</answer>
    </option>
    <option>
      <code>LicenseCompanyName</code>
      <answer>Exoscale</answer>
    </option>
    <option>
      <code>LicenseEmail</code>
      <answer>email@exoscale.ch</answer>
    </option>
    <option>
      <code>LicensePhone</code>
      <answer>+357</answer>
    </option>
    <option>
      <code>ResellerId</code> <!-- Id of reseller. Can be empty-->
      <answer></answer>
    </option>
  </tcxinit>
  <HostingConfiguration>
    <HostingAdminLogin></HostingAdminLogin> <!-- Hosting Administrative Login-->
    <HostingAdminPassword></HostingAdminPassword> <!-- Hosting Administrative Password-->
    <HostingAdminEmail></HostingAdminEmail> <!-- Hosting Administrative Email-->
  </HostingConfiguration>
  <extensions>
    <extension>
      <Number>222</Number> <!-- Extension Number -->
      <FirstName>Hannibal</FirstName>
      <LastName>Smith</LastName>
      <EmailAddress>hannibal.smith@a-team.com</EmailAddress>
      <MobileNumber>0225520211</MobileNumber>
      <OutboundCallerId>0225520211</OutboundCallerId>
      <AuthPassword>xxxxx</AuthPassword> <!-- Authentication password-->
      <AuthID>222</AuthID> <!-- Authentication ID -->
      <AllowLanOnly>false</AllowLanOnly> <!-- true false-->
      <RecordCalls>false</RecordCalls>
      <TemplateFilename>snom.ph.xml</TemplateFilename>
    <!--http://www.3cx.com/wp-content/uploads/2016/11/Phone-templates-and-Models-Sheet1.pdf -->
    <ProvisioningFilename2>Snom 300</ProvisioningFilename2>
    <!--http://www.3cx.com/wp-content/uploads/2016/11/Phone-templates-and-Models-Sheet1.pdf -->
      <MAC>121212ABABAB</MAC>
      <Codecs> <!-- Codec Priority  - based on phone model - different phones support different codecs-->
        <codec>G722</codec>
      </Codecs>
      <Language>French</Language> <!--take languages based on phone model - different phones support different languages-->
      <ProvisionType>LocalLan</ProvisionType>
    <!-- Available values: LocalLan, RemoteExt, SBC -->              
    </extension>
  </extensions>
  <siptrunk>
    <Name>Peoplefone</Name>
    <TemplateFilename>GenericSIPTrunk.pv.xml</TemplateFilename> <!-- Template file name from C:\ProgramData\3CX\Instance1\Data\Http\Templates\provider -->
    <Host>sips.peoplefone.ch</Host> <!-- Registrar/Server/Gateway Hostname or IP -->
    <Port>5060</Port>
    <ProxyHost></ProxyHost> <!-- Outbound Proxy of sip trunk -->
    <ProxyPort>5060</ProxyPort> <!-- Proxy port -->
    <SimultaneousCalls>10</SimultaneousCalls> <!-- Number of SIM Calls -->
    <RequireRegistrationFor>InOutCalls</RequireRegistrationFor>
  <!-- Type of Authentication possible values: "Nothing" - No registration required, "IncomingCalls" - Registration is only required for incoming calls, "OutgoingCalls" - Registration is only required for outgoing call, "InOutCalls"  - Registration is required for both incoming and outgoing calls -->
    <AuthID>90783703939</AuthID> <!-- Authentication ID (aka SIP User ID) -->
    <AuthPassword>xxxxx</AuthPassword> <!-- Authentication Password -->
    <Use3WayAuth>false</Use3WayAuth> <!-- Use 3 Way Authentication can be true or false -->
    <SeparateAuthPassword></SeparateAuthPassword> <!-- Authentication Password for 3 way authentication -->
    <ExternalNumber>0225520211</ExternalNumber> <!-- Main Trunk Number -->
    <OfficeHoursDestinationType>Extension</OfficeHoursDestinationType>
  <!-- Destination for calls during office hours, possible values: "None" - end call, "Extension", "VoiceMail", "External" - destination is external number, "Fax" - destination is Fax number -->                                    
    <OfficeHoursDestination>101</OfficeHoursDestination>  <!-- Destination for calls during office hours (number) -->
    <OutOfOfficeHoursDestinationType>External</OutOfOfficeHoursDestinationType>
  <!-- Destination for calls outside office hours, possible values: "None" - end call, "Extension", "VoiceMail", "" - destination is external number, "Fax" - destination is Fax number -->
    <OutOfOfficeHoursDestination>101</OutOfOfficeHoursDestination> <!-- Destination for calls during out of office hours (number) -->
    <DIDNumbers>0225520211</DIDNumbers> <!--enter DID numbers that the provider gave you here in comma separated form.-->
    <OutboundCallerID>0225520211</OutboundCallerID>
    <Direction>Both</Direction>
  <!-- Allow inbound/outbound calls, possible value:
  Both - Both inbound and outbound calls can be made on this line - default option
  None - No calls can be made on this line,
  Inbound - Only inbound calls can be made on this line,
  Outbound - Only outbound calls can be made on this line, -->  
 
  <!-- PBX Delivers Audio true / false-->
  <DeliverAudio>true</DeliverAudio>
 
  <!--Disallow video calls-->
  <DisableVideoCalls>true</DisableVideoCalls>
 
  <!--Supports Re-Invite-->
  <SupportReinvite>false</SupportReinvite>
 
  <!--Supports Replaces-->
  <SupportReplaces>false</SupportReplaces>
 
  <!--Put Public IP in SIP VIA Header-->
  <PublicIpInSipViaHeader>1.2.3.4</PublicIpInSipViaHeader> <!-- Optional. Can be empty or absent -->
 
  <!-- SRTP-->
  <EnableSRTP>false</EnableSRTP>
 
    <TimeBetweenReg>120</TimeBetweenReg> <!-- Re-Register Timeout -->
  <!--Select which IP to use in 'Contact' (SIP) and 'Connection'(SDP) fields
  Available options are
  "Default"
  "Local"
  "Specified"
  -->
  <!--IPcontactsdp 2.2.2.2:5061-->
    <IPInRegistrationContact>Default</IPInRegistrationContact>
    <SpecifiedIPForRegistrationContact></SpecifiedIPForRegistrationContact>
 
    <Codecs> <!-- Codec Priority adjust depending on what the sip trunk supports-->
      <codec>Speex</codec>
      <codec>PCMU</codec>
      <codec>GSM</codec>
      <codec>iLBC</codec>
      <codec>G722</codec>
      <codec>opus</codec>
      <codec>G729</codec>
      <codec>PCMA</codec>
    </Codecs>
    <InboundRules> <!--creation of inbound rules-->
    <InboundRule>
      <Name>Inbound</Name>
      <DID>41225520211</DID> <!--select one of the DID's you declared in <DIDNumbers>-->
      <OfficeHoursDestinationType>Extension</OfficeHoursDestinationType>
      <OfficeHoursDestination>222</OfficeHoursDestination> <!--select an extension that exists or that is already declared in this file-->
      <OutOfOfficeHoursDestinationType>VoiceMail</OutOfOfficeHoursDestinationType>
      <OutOfOfficeHoursDestination>222</OutOfOfficeHoursDestination>
      <SpecificHours> <!-- OPTIONAL. If not specified it means use Global Office Hours -->
        <HoursRange>
          <StartTime>08:00</StartTime><!--Start time in format 00:00-->
          <EndTime>16:00</EndTime> <!--End time in format 00:00-->
          <DayOfWeek>Monday</DayOfWeek> <!-- Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday-->
        </HoursRange>
        <HoursRange>
          <StartTime>08:00</StartTime><!--Start time in format 00:00-->
          <EndTime>16:00</EndTime> <!--End time in format 00:00-->
          <DayOfWeek>Tuesday</DayOfWeek> <!-- Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday-->
        </HoursRange>
        <HoursRange>
          <StartTime>08:00</StartTime><!--Start time in format 00:00-->
          <EndTime>16:00</EndTime> <!--End time in format 00:00-->
          <DayOfWeek>Wednesday</DayOfWeek> <!-- Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday-->
        </HoursRange>
        <HoursRange>
          <StartTime>08:00</StartTime><!--Start time in format 00:00-->
          <EndTime>16:00</EndTime> <!--End time in format 00:00-->
          <DayOfWeek>Thursday</DayOfWeek> <!-- Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday-->
        </HoursRange>
        <HoursRange>
          <StartTime>08:00</StartTime><!--Start time in format 00:00-->
          <EndTime>16:00</EndTime> <!--End time in format 00:00-->
          <DayOfWeek>Friday</DayOfWeek> <!-- Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday-->
        </HoursRange>
      </SpecificHours>
    </InboundRule>
  </InboundRules>
  </siptrunk>
   <!-- All following rules will be added to the end of list of existed (if any) rules on target PBX -->
  <OutboundRules>
    <OutboundRule>
      <Name>Outbound Line Peoplefone</Name>
    <Prefix>222</Prefix>
    <DNRanges> <!--Calls from extensions example 100,200-205-->
        <DNRange>
          <To>999</To>
          <From>000</From>
        </DNRange>
      </DNRanges>
    <NumberLengthRanges>9,10,11</NumberLengthRanges> <!-- can be comma-separated string of lengths as well: 9,10,11 -->
      <OutboundRoutes>
        <OutboundRoute>
          <Gateway>Peoplefone</Gateway>
          <StripDigits>0</StripDigits>
          <Prepend></Prepend>
        </OutboundRoute>
      </OutboundRoutes>
    </OutboundRule>
  </OutboundRules>
</SetupConfig>
EOF

wget -O- http://downloads-global.3cx.com/downloads/3cxpbx/public.key | apt-key add -
echo "deb http://downloads-global.3cx.com/downloads/debian buster main" | tee /etc/apt/sources.list.d/3cxpbx.list
apt-get update
apt-get -y install nginx net-tools dphys-swapfile gnupg2
rm -f /etc/nginx/sites-enabled/default
systemctl reload nginx
apt-get -y install 3cxpbx
