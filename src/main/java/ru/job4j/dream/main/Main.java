package ru.job4j.dream.main;

import ru.job4j.dream.store.Store;

public class Main {
    public static void main(String[] args) {
        ru.job4j.dream.store.Store store = Store.instOf();
        System.out.println(store.findAll());
    }
}
