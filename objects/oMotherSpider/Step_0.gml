create_spider_counter--;
if(create_spider_counter<=0){
instance_create_layer(x,y,"Outside_Middle",oSpider)
create_spider_counter=create_spider_counter_max;
}

if(flash){
	instance_create_layer(x,y,"Outside_Middle",oSpider)
}