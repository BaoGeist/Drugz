package scrape;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.*;
import com.opencsv.CSVWriter;
import org.eclipse.jetty.util.IO;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class WebScraper {

    WebClient webClient = new WebClient();
    HtmlPage page;

    // Constructor can be used to set the URL we want to scrape
    public WebScraper() throws IOException {
        String url = "https://www.drugs.com/drug-interactions/omeprazole-index.html";
        page = getWebPage(url);
    }
    //  Get the web page and store it into the page object -> We essentially are looking at the raw HTML of the webpage
    public HtmlPage getWebPage(String url) throws IOException {
        webClient.getOptions().setJavaScriptEnabled(false);
        webClient.getOptions().setCssEnabled(false);
        return webClient.getPage(url);
    }

    public List<HtmlElement> getConflicts() {
//        HtmlElement book = page.getFirstByXPath("//ul[@class=\"interactions ddc-list-column-2\"]/li/a");
//        System.out.print(book.asNormalizedText());

        // Identified how HTMl elemnts stored the drug interactions by inspecting the webpage
        // They are all stored within lists and we only want to look at the highest (major) problems
        List<HtmlElement> lists = page.getByXPath("//li[@class=\"int_3\"]/a");
        lists.remove(0);

        for (HtmlElement list : lists) {
            System.out.println(list.asNormalizedText());
        }
        return lists;

    }
    // Generate the associated barcode with the current drug
    public String getBarcode() {
        int ranInt;
        Random rand = new Random();
        String barcode = "";

        for (int i = 0; i < 6; i++) {
            ranInt = rand.nextInt(10);
            // Concatenating the randomly generated integers -> to form a 6 digit barcode
            barcode += ranInt;
        }
        return barcode;
    }

    public String getCombinedConflicts() {
        List<HtmlElement> conflicts = getConflicts();

        // Convert html element array to string array
        // Once converted we can use string join method to make it all into 1 string
        // This is necesssary so we can upload to our CSV
        ArrayList<String> textConflicts = new ArrayList<String>();
        String result, prev, current;

        // A problem faced -> the web scraper will pick up on a couple of elements at the end of the website which are not what we want
        // These are "associated diseases" -> we want to somehow not add these to our conflicts
        // When looking at the data -> we notice everything is in ALPHABETICAL ORDER except for when we reach those elements
        // So we just compare the curr and prev elements using compareTo method -> to see if alphabetical
        for (HtmlElement conflict : conflicts) {
            textConflicts.add(conflict.asNormalizedText());

            if (textConflicts.size() > 1) {
                current = textConflicts.get(textConflicts.size() - 1);
                prev = textConflicts.get(textConflicts.size() - 2);
                // Look at only the first letter -> if first letter goes (z, a) for example -> this will give -ve ASCII -> so we know to remove the most recently added
                if (current.charAt(0) - prev.charAt(0) < 0) {
                    textConflicts.remove(textConflicts.size() - 1);
                }
            }
        }
        result = String.join(";", textConflicts);
        return result;


    }
    public void writeToCsv() {
        File file = new File("C:\\Users\\derro\\Documents\\Code\\DeltaHacks2023\\Drugz\\webScrape\\Scraping\\output\\drug_data");

        try {
            FileWriter outputfile = new FileWriter(file, true);
            CSVWriter writer = new CSVWriter(outputfile);
            // header of CSV file
//            String[] header = { "Code", "Name", "Conflicts" };
//            writer.writeNext(header);
            // Data inputs
            String[] data = { getBarcode(), "Omeprazole", getCombinedConflicts() };
            writer.writeNext(data);

            writer.close();

        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws IOException {

        WebScraper a = new WebScraper();
        a.writeToCsv();
    }

}
