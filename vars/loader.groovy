#!/usr/bin/env groovy
import com.accordops.bench1.global.YamlReaderExample
def call(String name = 'human') {
    YamlReaderExample yre = new YamlReaderExample()
    echo "Hello, ${name}."
    println(yre)
}