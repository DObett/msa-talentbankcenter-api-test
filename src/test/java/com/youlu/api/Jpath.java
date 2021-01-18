package com.youlu.api;
import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Iterator;
import java.util.List;

import com.jayway.jsonpath.Configuration;
import com.jayway.jsonpath.JsonPath;

public class Jpath {

    public static void main(String[] args) {
        Jpath jj=new Jpath();
        String sjson = readtxt();
        print("--------------------------------------getJsonValue--------------------------------------");
        Object document = Configuration.defaultConfiguration().jsonProvider().parse(sjson);
        String json = "...";
        List<String> authors = JsonPath.read(sjson, "$.store.book[*].author");
       print(authors);
        getJsonValue(sjson);
    }

    private static String readtxt() {
        StringBuilder sb = new StringBuilder();
        try {
            FileReader fr = new FileReader("D:/books.txt");
            BufferedReader bfd = new BufferedReader(fr);
            String s = "";
            while((s=bfd.readLine())!=null) {
                sb.append(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //System.out.println(sb.toString());
        return sb.toString();
    }

    private static void getJsonValue(String json) {
        //The authors of all books：获取json中store下book下的所有author值
        List<String> authors1 = JsonPath.read(json, "$.store.book[*].author");

        //All authors：获取所有json中所有author的值
        List<String> authors2 = JsonPath.read(json, "$..author");

        //All things, both books and bicycles
        //authors3返回的是net.minidev.json.JSONArray：获取json中store下的所有value值，不包含key，如key有两个，book和bicycle
        List<Object> authors3 = JsonPath.read(json, "$.store.*");

        //The price of everything：获取json中store下所有price的值
        List<Object> authors4 = JsonPath.read(json, "$.store..price");

        //The third book：获取json中book数组的第3个值  这种查询json必须是{0，1，2，3} 中间不能有数组这样{0，1，2，3[0,1,2]}
        List<Object> authors5 = JsonPath.read(json, "$..book[2]");//这种查询json必须是{0，1，2，3} 中间不能有数组这样{0，1，2，3[0,1,2]}

        //The first two books：获取json中book数组的第1和第2两个个值
        List<Object> authors6 = JsonPath.read(json, "$..book[0,1]");

        //All books from index 0 (inclusive) until index 2 (exclusive)：获取json中book数组的前两个区间值
        List<Object> authors7 = JsonPath.read(json, "$..book[:2]");

        //All books from index 1 (inclusive) until index 2 (exclusive)：获取json中book数组的第2个值
        List<Object> authors8 = JsonPath.read(json, "$..book[1:2]");

        //Last two books：获取json中book数组的最后两个值
        List<Object> authors9 = JsonPath.read(json, "$..book[-2:]");

        //Book number two from tail：获取json中book数组的第3个到最后一个的区间值
        List<Object> authors10 = JsonPath.read(json, "$..book[2:]");

        //All books with an ISBN number：获取json中book数组中包含isbn的所有值
        List<Object> authors11 = JsonPath.read(json, "$..book[?(@.isbn)]");

        //All books in store cheaper than 10：获取json中book数组中price<10的所有值
        List<Object> authors12 = JsonPath.read(json, "$.store.book[?(@.price < 10)]");

        //All books in store that are not "expensive"：获取json中book数组中price<=expensive的所有值
        List<Object> authors13 = JsonPath.read(json, "$..book[?(@.price <= $['expensive'])]");

        //All books matching regex (ignore case)：获取json中book数组中的作者以REES结尾的所有值（REES不区分大小写）
        List<Object> authors14 = JsonPath.read(json, "$..book[?(@.author =~ /.*REES/i)]");

        //Give me every thing：逐层列出json中的所有值，层级由外到内
        List<Object> authors15 = JsonPath.read(json, "$..*");

        //The number of books：获取json中book数组的长度
        List<Object> authors16 = JsonPath.read(json, "$..book.length()");
        print("**********authors1**********");
        print(authors1);
        print("**********authors2**********");
        print(authors2);
        print("**********authors3**********");
        printOb(authors3);
        print("**********authors4**********");
        printOb(authors4);
        print("**********authors5**********");
        printOb(authors5);
        print("**********authors6**********");
        printOb(authors6);
        print("**********authors7**********");
        printOb(authors7);
        print("**********authors8**********");
        printOb(authors8);
        print("**********authors9**********");
        printOb(authors9);
        print("**********authors10**********");
        printOb(authors10);
        print("**********authors11**********");
        printOb(authors11);
        print("**********authors12**********");
        printOb(authors12);
        print("**********authors13**********");
        printOb(authors13);
        print("**********authors14**********");
        printOb(authors14);
        print("**********authors15**********");
        printOb(authors15);
        print("**********authors16**********");
        printOb(authors16);

    }

    private static void print(List<String> list) {
        for(Iterator<String> it = list.iterator();it.hasNext();) {
            System.out.println(it.next());
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

    public   Jpath (){

    }
    public   Jpath (String A ,int  N){

    }


}
