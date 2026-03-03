/*
 * I2C Sensor Driver Skeleton (Conceptual)
 * Focusing on SPI/I2C interactions for Embedded Linux.
 */

#include <linux/module.h>
#include <linux/i2c.h>
#include <linux/kernel.h>

#define DRIVER_NAME "my_i2c_sensor"

static int sensor_probe(struct i2c_client *client, const struct i2c_device_id *id)
{
    pr_info("%s: Probing sensor at address 0x%x\n", DRIVER_NAME, client->addr);
    
    // Örn: Sensor ID oku (Register 0x00)
    s32 res = i2c_smbus_read_byte_data(client, 0x00);
    if (res < 0) {
        pr_err("%s: Failed to read sensor ID\n", DRIVER_NAME);
        return res;
    }
    
    pr_info("%s: Sensor ID: 0x%x\n", DRIVER_NAME, res);
    return 0;
}

static void sensor_remove(struct i2c_client *client)
{
    pr_info("%s: Removing sensor driver\n", DRIVER_NAME);
}

static const struct i2c_device_id sensor_id[] = {
    { "my_sensor", 0 },
    { }
};
MODULE_DEVICE_TABLE(i2c, sensor_id);

static struct i2c_driver sensor_driver = {
    .driver = {
        .name = DRIVER_NAME,
        .owner = THIS_MODULE,
    },
    .probe = sensor_probe,
    .remove = sensor_remove,
    .id_table = sensor_id,
};

module_i2c_driver(sensor_driver);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Bahattin Yunus");
MODULE_DESCRIPTION("A simple I2C sensor driver skeleton");
