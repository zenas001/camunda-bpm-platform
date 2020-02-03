  "/process-instance": {
    "get":
    <#include "/paths/process-instance/get.ftl">,
    "post":
    <#include "/paths/process-instance/post.ftl">
  },
  "/process-instance/{id}": {
    "delete":
    <#include "/paths/process-instance/{id}/delete.ftl">
  },
  "/process-instance/{id}/modification": {
    "post":
     <#include "/paths/process-instance/{id}/modification/post.ftl">
  },
  "/process-instance/count": {
    "get":
    <#include "/paths/process-instance/count/get.ftl">,
    "post":
    <#include "/paths/process-instance/count/post.ftl">
  },
  "/process-instance/delete": {
    "post":
    <#include "/paths/process-instance/delete/post.ftl">
  }