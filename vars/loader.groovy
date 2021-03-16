#!/usr/bin/env groovy
import com.accordops.bench3.global.YamlReaderExample
def call(String name = 'human') {
    YamlReaderExample yre = new YamlReaderExample()
    echo "Hello, ${name}."
    println(yre)
    return "test123"
}