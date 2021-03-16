package com.accordops.bench3.global;

public class ApplicationConfig {
    public ApplicationConfig() {
    }
    private String author;
    private DatabaseConfig database;
    public String getAuthor() {
        return author;
    }
    public void setAuthor(String author) {
        this.author = author;
    }
    public DatabaseConfig getDatabase() {
        return database;
    }
    public void setDatabase(DatabaseConfig database) {
        this.database = database;
    }
    @Override
    public String toString() {
        return "\nAuthor: " + author
                + "\ndatabase: " + database + "\n";
    }
}
