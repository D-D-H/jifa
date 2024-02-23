/********************************************************************************
 * Copyright (c) 2024 Contributors to the Eclipse Foundation
 *
 * See the NOTICE file(s) distributed with this work for additional
 * information regarding copyright ownership.
 *
 * This program and the accompanying materials are made available under the
 * terms of the Eclipse Public License 2.0 which is available at
 * http://www.eclipse.org/legal/epl-2.0
 *
 * SPDX-License-Identifier: EPL-2.0
 ********************************************************************************/
package org.eclipse.jifa.jfr.model;

import lombok.Getter;
import lombok.Setter;
import org.eclipse.jifa.jfr.model.jfr.RecordedStackTrace;
import org.eclipse.jifa.jfr.model.jfr.RecordedThread;

import java.util.Map;

@Setter
@Getter
public class TaskData {
    public TaskData(RecordedThread thread) {
        this.thread = thread;
    }

    private RecordedThread thread;

    private Map<RecordedStackTrace, Long> samples;
}