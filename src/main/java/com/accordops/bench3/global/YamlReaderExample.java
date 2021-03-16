package com.accordops.bench3.global;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;

import java.io.File;

public class YamlReaderExample {
    public static void main(String[] args) throws Exception {
        File file = new File("src/main/resources/application.yaml");

        ObjectMapper objectMapper = new ObjectMapper(new YAMLFactory());
        ApplicationConfig config = objectMapper.readValue(file, ApplicationConfig.class);
        System.out.println("Application config info " + config.toString());

    }

    public String embedded(String[] args) throws Exception {
        File file = new File("src/main/resources/application.yaml");

        ObjectMapper objectMapper = new ObjectMapper(new YAMLFactory());
        ApplicationConfig config = objectMapper.readValue(file, ApplicationConfig.class);
        System.out.println("Application config info " + config.toString());
        return "Test Succeeded";
    }
}
