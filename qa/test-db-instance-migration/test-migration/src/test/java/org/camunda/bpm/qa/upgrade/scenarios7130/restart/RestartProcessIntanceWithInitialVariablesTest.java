/*
 * Copyright Camunda Services GmbH and/or licensed to Camunda Services GmbH
 * under one or more contributor license agreements. See the NOTICE file
 * distributed with this work for additional information regarding copyright
 * ownership. Camunda licenses this file to you under the Apache License,
 * Version 2.0; you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.camunda.bpm.qa.upgrade.scenarios7130.restart;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.text.ParseException;
import java.util.List;

import org.camunda.bpm.engine.HistoryService;
import org.camunda.bpm.engine.ManagementService;
import org.camunda.bpm.engine.RuntimeService;
import org.camunda.bpm.engine.history.HistoricDetail;
import org.camunda.bpm.engine.history.HistoricVariableInstance;
import org.camunda.bpm.engine.impl.history.event.HistoricVariableUpdateEventEntity;
import org.camunda.bpm.engine.runtime.Job;
import org.camunda.bpm.engine.runtime.ProcessInstance;
import org.camunda.bpm.engine.runtime.VariableInstance;
import org.camunda.bpm.engine.test.ProcessEngineRule;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;

public class RestartProcessIntanceWithInitialVariablesTest {

  @Rule
  public ProcessEngineRule engineRule = new ProcessEngineRule("camunda.cfg.xml");

  RuntimeService runtimeService;
  HistoryService historyService;

  @Before
  public void assignServices() {
    runtimeService = engineRule.getRuntimeService();
    historyService = engineRule.getHistoryService();
  }

  @Test
  public void shouldRestartWithInitialVariablesJobExecutedIn712() throws ParseException {
    String businessKey = "712_ProcessIntanceExecuted";
    ProcessInstance processInstanceWithInitialVariables = runtimeService.createProcessInstanceQuery()
        .processInstanceBusinessKey(businessKey)
        .singleResult();
    assertNotNull(processInstanceWithInitialVariables);

    runtimeService.deleteProcessInstance(processInstanceWithInitialVariables.getId(), "test");
    // when
    runtimeService.restartProcessInstances(processInstanceWithInitialVariables.getProcessDefinitionId())
      .startBeforeActivity("theTask")
      .processInstanceIds(processInstanceWithInitialVariables.getId())
      .initialSetOfVariables()
      .execute();

    ProcessInstance restartedProcessInstance = runtimeService.createProcessInstanceQuery()
        .processInstanceBusinessKey(businessKey)
        .active()
        .singleResult();

    // then
    restartedProcessInstance = runtimeService.createProcessInstanceQuery()
        .processInstanceBusinessKey(businessKey)
        .active()
        .singleResult();
    List<VariableInstance> variables = runtimeService.createVariableInstanceQuery().processInstanceIdIn(restartedProcessInstance.getId()).list();
    assertEquals(1, variables.size());
    assertEquals("var1", variables.get(0).getName());
    assertEquals("value1", variables.get(0).getValue());
    List<HistoricVariableInstance> list = historyService.createHistoricVariableInstanceQuery()
        .processInstanceId(restartedProcessInstance.getId())
        .list();

    assertEquals(1, list.size());
    HistoricVariableInstance historicVariableInstance = list.get(0);
    assertEquals(restartedProcessInstance.getId(), historicVariableInstance.getActivityInstanceId());
    assertEquals("var1", variables.get(0).getName());
    assertEquals("value1", variables.get(0).getValue());

    HistoricVariableUpdateEventEntity detail = (HistoricVariableUpdateEventEntity) historyService.createHistoricDetailQuery()
        .processInstanceId(restartedProcessInstance.getId())
        .singleResult();
    assertNotNull(detail);
    assertTrue(detail.isInitial());
    assertEquals("var1", detail.getVariableName());
    assertEquals("value2", detail.getTextValue());
  }

  @Test
  public void shouldRestartWithInitialVariablesJobExecutedIn713() throws ParseException {
    ManagementService managementService = engineRule.getManagementService();
    Job asyncJob = managementService.createJobQuery()
        .processDefinitionKey("asyncBeforeStartProcess_712").singleResult();
    try {
      managementService.executeJob(asyncJob.getId());
    } catch (Exception e) {
      // ignore
    }

    String businessKey = "7120_ProcessIntanceWithoutExecute";
    ProcessInstance processInstanceWithInitialVariables = runtimeService.createProcessInstanceQuery()
        .processInstanceBusinessKey(businessKey)
        .active()
        .singleResult();

    runtimeService.deleteProcessInstance(processInstanceWithInitialVariables.getId(), "test");
    // when
    runtimeService.restartProcessInstances(processInstanceWithInitialVariables.getProcessDefinitionId())
      .startBeforeActivity("theTask")
      .processInstanceIds(processInstanceWithInitialVariables.getId())
      .initialSetOfVariables()
      .execute();

    ProcessInstance restartedProcessInstance = runtimeService.createProcessInstanceQuery()
        .processInstanceBusinessKey(businessKey)
        .active()
        .singleResult();

    // then 
    List<VariableInstance> variables = runtimeService.createVariableInstanceQuery().processInstanceIdIn(restartedProcessInstance.getId()).list();
    assertEquals(3, variables.size());
    assertEquals("var3", variables.get(0).getName());
    assertEquals("value2", variables.get(0).getValue());

    List<HistoricVariableInstance> list = historyService.createHistoricVariableInstanceQuery()
        .processInstanceId(restartedProcessInstance.getId())
        .list();
    assertEquals(3, list.size());

    List<HistoricDetail> details = historyService.createHistoricDetailQuery()
        .processInstanceId(restartedProcessInstance.getId())
        .list();
    assertEquals(3, details.size());

    for (HistoricDetail historicDetail : details) {
      HistoricVariableUpdateEventEntity detail = (HistoricVariableUpdateEventEntity) historicDetail;
      assertTrue(detail.isInitial());
    }
  }
}
