<#--

     Copyright 2012-2014 Gunnar Morling (http://www.gunnarmorling.de/)
     and/or other contributors as indicated by the @authors tag. See the
     copyright.txt file in the distribution for a full listing of all
     contributors.

     Licensed under the Apache License, Version 2.0 (the "License");
     you may not use this file except in compliance with the License.
     You may obtain a copy of the License at

         http://www.apache.org/licenses/LICENSE-2.0

     Unless required by applicable law or agreed to in writing, software
     distributed under the License is distributed on an "AS IS" BASIS,
     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
     See the License for the specific language governing permissions and
     limitations under the License.

-->
<#lt>private <@includeModel object=returnType/> ${name}(<#list parameters as param><@includeModel object=param/><#if param_has_next>, </#if></#list>) {

    <#compress>
    <@includeModel object=returnType/> ${targetLocalVariable} = null;
    if ( ${sourceParameter.name} != null ) {
    <#list propertyEntries as entry>
        <@includeModel object=entry.type/> ${entry.name} = <#if entry_index == 0>${sourceParameter.name}.${entry.accessor}<#else>${propertyEntries[entry_index-1].name}.${entry.accessor}</#if>;
        if ( ${entry.name} != null ) {
        <#if !entry_has_next>${targetLocalVariable} = ${entry.name};</#if>
    </#list>
    <#list propertyEntries as entry>
        }
    </#list>
    }
    return ${targetLocalVariable};
    </#compress>

}