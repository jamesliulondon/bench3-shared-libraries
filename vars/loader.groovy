#!/usr/bin/env groovy
import com.accordops.bench2.global.YamlReaderExample
def call(String name = 'human') {
    YamlReaderExample yre = new YamlReaderExample()
    echo "Hello, ${name}."
    println(yre)
    return "test123"
}