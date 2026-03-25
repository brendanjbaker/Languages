<#ftl output_format="plainText" >
<#assign sum = 0>
<#list 0..100 as i>
  <#assign sum = sum + i>
</#list>
${sum?c}
