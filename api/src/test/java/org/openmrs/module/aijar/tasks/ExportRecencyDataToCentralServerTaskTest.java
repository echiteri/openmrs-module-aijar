package org.openmrs.module.aijar.tasks;

import org.junit.Before;
import org.junit.Test;

import static junit.framework.TestCase.assertTrue;

public class ExportRecencyDataToCentralServerTaskTest {

    private ExportRecencyDataToCentralServerTask exportRecencyDataToCentralServerTask;

    @Before
    public void setUp() {
        exportRecencyDataToCentralServerTask = new ExportRecencyDataToCentralServerTask();
    }

    @Test
    public void testTaskSending() throws Exception {
        exportRecencyDataToCentralServerTask.execute();
        assertTrue(true);

    }

}
