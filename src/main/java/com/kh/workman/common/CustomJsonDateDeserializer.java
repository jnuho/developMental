package com.kh.workman.common;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

public class CustomJsonDateDeserializer extends JsonDeserializer<Date> {

  @Override
  public Date deserialize(JsonParser jsonParser, DeserializationContext ctxt)
        throws IOException, JsonProcessingException {

      /* Wed Oct 16 13:21:06 UTC 2019 */
      SimpleDateFormat format = new SimpleDateFormat("EEE MMM dd hh:mm:ss Z yyyy",Locale.ENGLISH);
      String date = jsonParser.getText();
      try {
          return format.parse(date);
      } catch (ParseException e) {
          throw new RuntimeException(e);
      }

  }


}
