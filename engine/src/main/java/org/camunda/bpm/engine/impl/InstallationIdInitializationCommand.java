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
package org.camunda.bpm.engine.impl;

import java.util.UUID;

import org.camunda.bpm.engine.impl.db.EnginePersistenceLogger;
import org.camunda.bpm.engine.impl.db.entitymanager.DbEntityManager;
import org.camunda.bpm.engine.impl.interceptor.Command;
import org.camunda.bpm.engine.impl.interceptor.CommandContext;
import org.camunda.bpm.engine.impl.persistence.entity.PropertyEntity;

public class InstallationIdInitializationCommand implements Command<Void> {

  private final static EnginePersistenceLogger LOG = ProcessEngineLogger.PERSISTENCE_LOGGER;

  public Void execute(CommandContext commandContext) {

    checkInstallationIdLockExists(commandContext);

    String databaseInstallationId = databaseInstallationId(commandContext);

    if (databaseInstallationId == null || databaseInstallationId.isEmpty()) {

      commandContext.getPropertyManager().acquireExclusiveLockForInstallationId();
      databaseInstallationId = databaseInstallationId(commandContext);

      if (databaseInstallationId == null || databaseInstallationId.isEmpty()) {
        LOG.noInstallationIdPropertyFound();
        createInstallationProperty(commandContext);
      }
    } else {
      LOG.installationIdPropertyFound(databaseInstallationId);
      commandContext.getProcessEngineConfiguration().setInstallationId(databaseInstallationId);
    }
    return null;
  }

  protected void createInstallationProperty(CommandContext commandContext) {
    String installationId = UUID.randomUUID().toString();
    PropertyEntity property = new PropertyEntity("camunda.installation.id", installationId);
    commandContext.getSession(DbEntityManager.class).insert(property);
    LOG.creatingInstallationPropertyInDatabase(property.getValue());
    commandContext.getProcessEngineConfiguration().setInstallationId(installationId);
  }

  protected String databaseInstallationId(CommandContext commandContext) {
    try {
      PropertyEntity installationIdProperty = commandContext.getPropertyManager().findPropertyById("camunda.installation.id");
      return installationIdProperty != null ? installationIdProperty.getValue() : null;
    } catch (Exception e) {
      LOG.couldNotSelectInstallationId(e.getMessage());
      return null;
    }
  }

  protected void checkInstallationIdLockExists(CommandContext commandContext) {
    PropertyEntity installationIdProperty = commandContext.getPropertyManager().findPropertyById("installationId.lock");
    if (installationIdProperty == null) {
      LOG.noInstallationIdLockPropertyFound();
    }
  }

}
