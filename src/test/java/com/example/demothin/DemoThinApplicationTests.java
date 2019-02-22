package com.example.demothin;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DemoThinApplicationTests {

    @Test
    public void contextLoads() {
    }

    @Test
    public void test() {
        List<String> list = new ArrayList<>();
        List<String> collect = list.stream().filter(""::equals).collect(Collectors.toList());
        System.out.println(collect.size());
    }
}
