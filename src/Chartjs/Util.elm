module Chartjs.Util exposing (beginObject, boolField, colorField, customField, dateField, encodeColor, encodeDate, floatField, intField, listField, maybeBoolField, maybeColorField, maybeCustomField, maybeDateField, maybeField, maybeFloatField, maybeIntField, maybeListField, maybeStringField, stringField, toValue)

import Color exposing (Color)
import Json.Encode as Encode
import Time
import Iso8601


-- Encode pipeline style helpers


beginObject : List a
beginObject =
    []


customField : String -> (a -> Encode.Value) -> a -> List ( String, Encode.Value ) -> List ( String, Encode.Value )
customField name encoder value properties =
    ( name, encoder value ) :: properties


listField : String -> (a -> Encode.Value) -> List a -> List ( String, Encode.Value ) -> List ( String, Encode.Value )
listField name encoder =
    customField name (Encode.list encoder)


stringField : String -> String -> List ( String, Encode.Value ) -> List ( String, Encode.Value )
stringField name =
    customField name Encode.string


floatField : String -> Float -> List ( String, Encode.Value ) -> List ( String, Encode.Value )
floatField name =
    customField name Encode.float


intField : String -> Int -> List ( String, Encode.Value ) -> List ( String, Encode.Value )
intField name =
    customField name Encode.int


boolField : String -> Bool -> List ( String, Encode.Value ) -> List ( String, Encode.Value )
boolField name =
    customField name Encode.bool


colorField : String -> Color -> List ( String, Encode.Value ) -> List ( String, Encode.Value )
colorField name =
    customField name encodeColor


dateField : String -> Time.Posix -> List ( String, Encode.Value ) -> List ( String, Encode.Value )
dateField name =
    customField name encodeDate


maybeField : (String -> a -> List ( String, Encode.Value ) -> List ( String, Encode.Value )) -> String -> Maybe a -> List ( String, Encode.Value ) -> List ( String, Encode.Value )
maybeField innerField name =
    Maybe.map (innerField name)
        >> Maybe.withDefault identity


maybeCustomField : String -> (a -> Encode.Value) -> Maybe a -> List ( String, Encode.Value ) -> List ( String, Encode.Value )
maybeCustomField name encoder =
    Maybe.map (customField name encoder)
        >> Maybe.withDefault identity


maybeStringField : String -> Maybe String -> List ( String, Encode.Value ) -> List ( String, Encode.Value )
maybeStringField =
    maybeField stringField


maybeFloatField : String -> Maybe Float -> List ( String, Encode.Value ) -> List ( String, Encode.Value )
maybeFloatField =
    maybeField floatField


maybeIntField : String -> Maybe Int -> List ( String, Encode.Value ) -> List ( String, Encode.Value )
maybeIntField =
    maybeField intField


maybeBoolField : String -> Maybe Bool -> List ( String, Encode.Value ) -> List ( String, Encode.Value )
maybeBoolField =
    maybeField boolField


maybeColorField : String -> Maybe Color -> List ( String, Encode.Value ) -> List ( String, Encode.Value )
maybeColorField =
    maybeField colorField


maybeDateField : String -> Maybe Time.Posix -> List ( String, Encode.Value ) -> List ( String, Encode.Value )
maybeDateField =
    maybeField dateField


maybeListField : String -> (a -> Encode.Value) -> Maybe (List a) -> List ( String, Encode.Value ) -> List ( String, Encode.Value )
maybeListField name encoder =
    Maybe.map (listField name encoder)
        >> Maybe.withDefault identity


toValue : List ( String, Encode.Value ) -> Encode.Value
toValue properties =
    properties
        |> List.reverse
        |> Encode.object



-- Common encoders


encodeDate : Time.Posix -> Encode.Value
encodeDate =
    Iso8601.fromTime >> Encode.string


encodeColor : Color -> Encode.Value
encodeColor color =
    Encode.string <| Color.toCssString color
