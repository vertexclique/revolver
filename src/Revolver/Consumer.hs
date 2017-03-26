module Revolver.Consumer where

import           Haskakafka
import           Haskakafka.Consumer
import           Revolver.StatSender

runConsumerExample :: IO (Either KafkaError ())
runConsumerExample =
         runConsumer
              (ConsumerGroupId "test_group1")   -- group id is required
              []                                -- extra kafka conf properties
              (BrokersString "kfk001.dc4:9092") -- kafka brokers to connect to
              [TopicName "system"]              -- list of topics to consume, supporting regex
              processMessages                   -- handler to consume messages

processMessages :: Kafka -> IO (Either KafkaError ())
processMessages kafka = do
           message <- pollMessage kafka 10
           print $ show message
           case message of
            (Left err) -> putStrLn $ "ERR: " ++ show err
            (Right msg) -> putStrLn $ "MSG: " ++ show msg
           processMessages kafka
