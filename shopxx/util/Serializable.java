package net.shopxx.util;

interface Serializable {
    byte[] serialize();
    void unserialize(byte[] ss);
}
