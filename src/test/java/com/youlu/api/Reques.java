package com.youlu.api;
import com.alibaba.fastjson.JSONObject;
import com.jayway.jsonpath.JsonPath;
import org.apache.hc.client5.http.fluent.Content;
import org.apache.hc.client5.http.fluent.Request;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import java.io.IOException;
import java.util.*;

public class Reques {
    public static void main(String[] args) throws IOException {
    String url = "http://192.168.10.102:7010/api/ir/item/view/list?params=%7B%22pageIndex%22%3A%220%22%2C%22pageSize%22%3A%2210%22%2C%22orderNo%22%3A%22%22%2C%22userId%22%3A%22%22%2C%22projectId%22%3A%22%22%2C%22schoolId%22%3A%22%22%2C%22orderType%22%3A%22%22%2C%22itemdtlAimdatestart%22%3A%22%22%2C%22itemdtlAimdateend%22%3A%22%22%7D&ctype=YOULU.WEB";
        String urll ="http://192.168.10.102:7010/api/ir/item/view/info?params=%7B%22itemId%22%3A%22ITEM20201229010001142812%22%2C%22startDate%22%3A%22%22%2C%22endDate%22%3A%22%22%7D&ctype=YOULU.WEB";
    Content aa = Request.get(urll).addHeader("User-Agent", "Mozilla/5.0(Windows NT 6.1;Win64; x64; rv:50.0) Gecko/20100101 Firefox/50.0").execute().returnContent();
    String srr = aa.asString();

        print(srr);
       JSONObject json = JSONObject.parseObject(String.valueOf(aa));
        System.out.println("JSON字符串转换成JSON对象\n" + json);
       // String json = JSONObject.toJSONString(aa);
    Document doc = Jsoup.parse(srr);
        List<Object> author6 = JsonPath.read(srr, "$.data..itemdtl[2,3]") ;
//    List<String> authors = JsonPath.read(srr, "$.data.data[*].itemId ");
//    List<String> author1 = JsonPath.read(srr, "$..orderId ");
//     List<String> author2 = JsonPath.read(srr, "$.data.data[*]..className");
//
//    List<String> author3 = JsonPath.read(srr, "$.data.data..projectId ");
//    List<String> author4 = JsonPath.read(srr, "$..projectId[3] ");
//    List<String> author5 = JsonPath.read(srr, "$..schoolId[3] ");


        String AA="{\"className\":\"【2020】二级建造师机电3科通关班[网络]\",\"classAser\":\"N\",\"classType\":\"网络\",\"classNext\":null}";
        JSONObject json1 = JSONObject.parseObject(String.valueOf(AA));
        String userStr = JSONObject.toJSONString(json1);
        List<String> srcList = Arrays.asList(userStr);
        System.out.println("JSON字符串转换成JSON对象\n" + author6);
       // Map<String ,String>  author7 = JsonPath.read(srr, "$.data.data[0].classes[*] ");
       // System.out.println("JSON字符串转换成JSON对象\n" + author7);
    Map<String ,String> cellmap= new HashMap<>();
        cellmap.get("className");
        //System.out.println(cellmap.get("className"));
      //  HashMap<String, String> author7 = JsonPath.read(srr, "$..orderId");
//        print(authors);
//        print(author1);
//       print(author2);
//        print(author3);
//        print(author4);
//        print(author5);
        printOb(author6);
       // print(author7);








}




    private static void print(List<String> list) {
        for(Iterator<String> it = list.iterator(); it.hasNext();) {
            System.out.println(it.next());
        }
    }

    private static void print(Map<String ,String> cellmap ){
        Iterator<Map.Entry<String ,String >> iter=cellmap.entrySet().iterator();
       while (iter.hasNext()){
           Map.Entry entry=(Map.Entry)iter.next();
           Object key=entry.getKey();
           Object va=entry.getKey();
           System.out.println(key+"="+va);

       }

    }




    private static void printOb(List<Object> list) {
        for(Iterator<Object> it = list.iterator();it.hasNext();) {
            System.out.println(it.next());
        }
    }

    private static void print(String s) {
        System.out.println("\n"+s);
    }
}
