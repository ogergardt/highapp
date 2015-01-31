<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="modal hide fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
    <h3 id="errorModalLabel"></h3>
  </div>
  <div id="errorModelBody" class="modal-body">
    <p id="errorModalMsg" ></p>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true"><spring:message code="modal.table.close"/></button>
  </div>
</div>
