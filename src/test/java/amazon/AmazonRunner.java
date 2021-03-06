package amazon;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class AmazonRunner {

//    @Karate.Test
//    Karate testUsers() {
//        return Karate.run("amazon").relativeTo(getClass());
//    }   

    @Test
    void testUsersParallel() {
    	
    	 Results results = Runner.path("classpath:amazon").tags("@amazon, @sanity").outputCucumberJson(true).parallel(5);
    	 
         generateReport(results.getReportDir());
         
        //  assertEquals(results.getErrorMessages(), results.getFailCount() == 0);
        
    }   
    
    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "dev");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
