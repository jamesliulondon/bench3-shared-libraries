#!/usr/bin/env groovy

@groovy.lang.Grab
import com.accprdops.bench3.global.global

def call(String name = 'human') {
    echo "Hello, ${name}."
}