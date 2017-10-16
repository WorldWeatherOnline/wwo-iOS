
World Weather Online Api Sample
============

A Simple weather api demo to show how to use the "world weather online apis".

 * Simple and easy UI 
 * Already configured api models (POJOs)
 * Access weather apis with Retrofit Library
 * Uses gson for adapter factory

This sample app is very easy to understand and you can simply
start using this weather online api in few minutes!
Apis are out there already and you can access it with any of
your favourite http client:-

    Local Weather API:
    http://api.worldweatheronline.com/premium/v1/weather.ashx?key=API_KEY&q=London&format=json&includelocation=yes
		
    Marine Weather API:
    http://api.worldweatheronline.com/premium/v1/marine.ashx?key=API_KEY&q=31.50,-12.50&format=json&includelocation=yes  
         
    Time Zone API:
    http://api.worldweatheronline.com/premium/v1/tz.ashx?key=API_KEY&q=Paris&format=json&includelocation=yes      
       
    Search API:
    http://api.worldweatheronline.com/premium/v1/tz.ashx?key=API_KEY&q=London&format=json          
      

    Historical Local Weather API:
    http://api.worldweatheronline.com/premium/v1/past-weather.ashx?key=API_KEY&q=Paris&format=json&includelocation=yes&date=2017-08-15&enddate=2017-09-10     
      

    Historical Marine Weather API:
    http://api.worldweatheronline.com/premium/v1/past-marine.ashx?key=API_KEY&q=31.50,-12.50&format=json&includelocation=yes&date=2017-08-15&enddate=2017-09-10       
     
	
    Ski Weather API:
    http://api.worldweatheronline.com/premium/v1/ski.ashx?key=API_KEY&q=52.233,-90.75&format=json&includelocation=yes  	
  	
But We have even make your journey more easier with this sample app :)  	
These are the simple steps to get started with retrofit library approach:-

1)Add Permission
-------
 
Add these permissions into your `AndroidManifest.xml`
```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

2)Add Api Models
-------
Copy complete package <b><i>com.worldweatheronline.domain</i></b> package in your code base.
<br>A domain package has two sub package:
<br><b>a) entity </b>(It contains data models i.e. pojos of the api)
<br><b>b) rest </b>(it contains classes related to retrofit lib)
in your package 

That's it! You can now use the api easily :)

__To Access Weather Api__
```java
      new RestClient().apiService().weather("London")
          .enqueue(new Callback<Api>() {
            @Override public void onResponse(Call<Api> call, Response<Api> response) {
              com.worldweatheronline.domain.entity.weather.Api weatherApi = response.body();
                //do whatever you want to do ...
            }
  
            @Override
            public void onFailure(Call<com.worldweatheronline.domain.entity.weather.Api> call,
                Throwable t) {
                //handle on failure case
            }
          });
```
__To Access Past Weather Api__
```java
      new RestClient().apiService().pastWeather("Paris", "2017-08-15", "2017-08-20")//city, startdate, enddate
          .enqueue(new Callback<Api>() {
            @Override public void onResponse(Call<Api> call, Response<Api> response) {
              com.worldweatheronline.domain.entity.weather.Api weatherApi = response.body();
                //do whatever you want to do ...
            }
  
            @Override
            public void onFailure(Call<com.worldweatheronline.domain.entity.weather.Api> call,
                Throwable t) {
                //handle on failure case
            }
          });
```
__To Access Marine Weather Api__
```java
      new RestClient().apiService().marine("31.50,-12.50")//latitude,longitude
          .enqueue(new Callback<Api>() {
            @Override public void onResponse(Call<Api> call, Response<Api> response) {
              com.worldweatheronline.domain.entity.weather.Api weatherApi = response.body();
                //do whatever you want to do ...
            }
  
            @Override
            public void onFailure(Call<com.worldweatheronline.domain.entity.weather.Api> call,
                Throwable t) {
                //handle on failure case
            }
          });
```
__To Access Past Marine Weather Api__
```java
      new RestClient().apiService().pastMarineWeather("31.50,-12.50", "2017-08-15", "2017-08-20")
          .enqueue(new Callback<Api>() {
            @Override public void onResponse(Call<Api> call, Response<Api> response) {
              com.worldweatheronline.domain.entity.weather.Api weatherApi = response.body();
                //do whatever you want to do ...
            }
  
            @Override
            public void onFailure(Call<com.worldweatheronline.domain.entity.weather.Api> call,
                Throwable t) {
                //handle on failure case
            }
          });
```
__To Access Timezone Api__
```java
      new RestClient().apiService().timezone("Paris")
          .enqueue(new Callback<Api>() {
            @Override public void onResponse(Call<Api> call, Response<Api> response) {
              com.worldweatheronline.domain.entity.weather.Api weatherApi = response.body();
                //do whatever you want to do ...
            }
  
            @Override
            public void onFailure(Call<com.worldweatheronline.domain.entity.weather.Api> call,
                Throwable t) {
                //handle on failure case
            }
          });
```
__To Access Ski Api__
```java
      new RestClient().apiService().ski("52.233,-90.75")//latitude,longitude
          .enqueue(new Callback<Api>() {
            @Override public void onResponse(Call<Api> call, Response<Api> response) {
              com.worldweatheronline.domain.entity.weather.Api weatherApi = response.body();
                //do whatever you want to do ...
            }
  
            @Override
            public void onFailure(Call<com.worldweatheronline.domain.entity.weather.Api> call,
                Throwable t) {
                //handle on failure case
            }
          });
```

License
-------
       MIT License
       
       Copyright (c) 2017 World Weather Online
       
       Permission is hereby granted, free of charge, to any person obtaining a copy
       of this software and associated documentation files (the "Software"), to deal
       in the Software without restriction, including without limitation the rights
       to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
       copies of the Software, and to permit persons to whom the Software is
       furnished to do so, subject to the following conditions:
       
       The above copyright notice and this permission notice shall be included in all
       copies or substantial portions of the Software.
       
       THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
       IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
       FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
       AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
       LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
       OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
       SOFTWARE.