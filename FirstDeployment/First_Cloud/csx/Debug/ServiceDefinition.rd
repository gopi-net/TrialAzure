<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="First_Cloud" generation="1" functional="0" release="0" Id="42f25088-c0c6-4fd1-8c7e-93d63b869b90" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="First_CloudGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="First_Role:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/First_Cloud/First_CloudGroup/LB:First_Role:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="First_Role:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/First_Cloud/First_CloudGroup/MapFirst_Role:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="First_RoleInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/First_Cloud/First_CloudGroup/MapFirst_RoleInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:First_Role:Endpoint1">
          <toPorts>
            <inPortMoniker name="/First_Cloud/First_CloudGroup/First_Role/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapFirst_Role:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/First_Cloud/First_CloudGroup/First_Role/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapFirst_RoleInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/First_Cloud/First_CloudGroup/First_RoleInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="First_Role" generation="1" functional="0" release="0" software="D:\Net\Azure\FirstDeployment\First_Cloud\csx\Debug\roles\First_Role" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;First_Role&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;First_Role&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/First_Cloud/First_CloudGroup/First_RoleInstances" />
            <sCSPolicyUpdateDomainMoniker name="/First_Cloud/First_CloudGroup/First_RoleUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/First_Cloud/First_CloudGroup/First_RoleFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="First_RoleUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="First_RoleFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="First_RoleInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="22cbdcb3-a7fd-4e53-91af-192a4bf8edd4" ref="Microsoft.RedDog.Contract\ServiceContract\First_CloudContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="7faeb185-824f-4ed6-8a3b-9d91b859420e" ref="Microsoft.RedDog.Contract\Interface\First_Role:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/First_Cloud/First_CloudGroup/First_Role:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>