{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-orphans        #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Test.AWS.Gen.XRay
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Test.AWS.Gen.XRay where

import Data.Proxy
import Test.AWS.Fixture
import Test.AWS.Prelude
import Test.Tasty
import Network.AWS.XRay
import Test.AWS.XRay.Internal

-- Auto-generated: the actual test selection needs to be manually placed into
-- the top-level so that real test data can be incrementally added.
--
-- This commented snippet is what the entire set should look like:

-- fixtures :: TestTree
-- fixtures =
--     [ testGroup "request"
--         [ requestGetServiceGraph $
--             getServiceGraph
--
--         , requestGetTraceSummaries $
--             getTraceSummaries
--
--         , requestPutTraceSegments $
--             putTraceSegments
--
--         , requestBatchGetTraces $
--             batchGetTraces
--
--         , requestPutTelemetryRecords $
--             putTelemetryRecords
--
--         , requestGetTraceGraph $
--             getTraceGraph
--
--           ]

--     , testGroup "response"
--         [ responseGetServiceGraph $
--             getServiceGraphResponse
--
--         , responseGetTraceSummaries $
--             getTraceSummariesResponse
--
--         , responsePutTraceSegments $
--             putTraceSegmentsResponse
--
--         , responseBatchGetTraces $
--             batchGetTracesResponse
--
--         , responsePutTelemetryRecords $
--             putTelemetryRecordsResponse
--
--         , responseGetTraceGraph $
--             getTraceGraphResponse
--
--           ]
--     ]

-- Requests

requestGetServiceGraph :: GetServiceGraph -> TestTree
requestGetServiceGraph = req
    "GetServiceGraph"
    "fixture/GetServiceGraph.yaml"

requestGetTraceSummaries :: GetTraceSummaries -> TestTree
requestGetTraceSummaries = req
    "GetTraceSummaries"
    "fixture/GetTraceSummaries.yaml"

requestPutTraceSegments :: PutTraceSegments -> TestTree
requestPutTraceSegments = req
    "PutTraceSegments"
    "fixture/PutTraceSegments.yaml"

requestBatchGetTraces :: BatchGetTraces -> TestTree
requestBatchGetTraces = req
    "BatchGetTraces"
    "fixture/BatchGetTraces.yaml"

requestPutTelemetryRecords :: PutTelemetryRecords -> TestTree
requestPutTelemetryRecords = req
    "PutTelemetryRecords"
    "fixture/PutTelemetryRecords.yaml"

requestGetTraceGraph :: GetTraceGraph -> TestTree
requestGetTraceGraph = req
    "GetTraceGraph"
    "fixture/GetTraceGraph.yaml"

-- Responses

responseGetServiceGraph :: GetServiceGraphResponse -> TestTree
responseGetServiceGraph = res
    "GetServiceGraphResponse"
    "fixture/GetServiceGraphResponse.proto"
    xRay
    (Proxy :: Proxy GetServiceGraph)

responseGetTraceSummaries :: GetTraceSummariesResponse -> TestTree
responseGetTraceSummaries = res
    "GetTraceSummariesResponse"
    "fixture/GetTraceSummariesResponse.proto"
    xRay
    (Proxy :: Proxy GetTraceSummaries)

responsePutTraceSegments :: PutTraceSegmentsResponse -> TestTree
responsePutTraceSegments = res
    "PutTraceSegmentsResponse"
    "fixture/PutTraceSegmentsResponse.proto"
    xRay
    (Proxy :: Proxy PutTraceSegments)

responseBatchGetTraces :: BatchGetTracesResponse -> TestTree
responseBatchGetTraces = res
    "BatchGetTracesResponse"
    "fixture/BatchGetTracesResponse.proto"
    xRay
    (Proxy :: Proxy BatchGetTraces)

responsePutTelemetryRecords :: PutTelemetryRecordsResponse -> TestTree
responsePutTelemetryRecords = res
    "PutTelemetryRecordsResponse"
    "fixture/PutTelemetryRecordsResponse.proto"
    xRay
    (Proxy :: Proxy PutTelemetryRecords)

responseGetTraceGraph :: GetTraceGraphResponse -> TestTree
responseGetTraceGraph = res
    "GetTraceGraphResponse"
    "fixture/GetTraceGraphResponse.proto"
    xRay
    (Proxy :: Proxy GetTraceGraph)
