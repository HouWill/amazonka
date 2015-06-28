{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}

-- Module      : Network.AWS.StorageGateway.AddCache
-- Copyright   : (c) 2013-2015 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- | This operation configures one or more gateway local disks as cache for a
-- cached-volume gateway. This operation is supported only for the
-- gateway-cached volume architecture (see
-- <http://docs.aws.amazon.com/storagegateway/latest/userguide/StorageGatewayConcepts.html Storage Gateway Concepts>).
--
-- In the request, you specify the gateway Amazon Resource Name (ARN) to
-- which you want to add cache, and one or more disk IDs that you want to
-- configure as cache.
--
-- <http://docs.aws.amazon.com/storagegateway/latest/APIReference/API_AddCache.html>
module Network.AWS.StorageGateway.AddCache
    (
    -- * Request
      AddCache
    -- ** Request constructor
    , addCache
    -- ** Request lenses
    , acGatewayARN
    , acDiskIds

    -- * Response
    , AddCacheResponse
    -- ** Response constructor
    , addCacheResponse
    -- ** Response lenses
    , acrGatewayARN
    , acrStatus
    ) where

import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.StorageGateway.Types

-- | /See:/ 'addCache' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'acGatewayARN'
--
-- * 'acDiskIds'
data AddCache = AddCache'
    { _acGatewayARN :: !Text
    , _acDiskIds    :: ![Text]
    } deriving (Eq,Read,Show)

-- | 'AddCache' smart constructor.
addCache :: Text -> AddCache
addCache pGatewayARN =
    AddCache'
    { _acGatewayARN = pGatewayARN
    , _acDiskIds = mempty
    }

-- | FIXME: Undocumented member.
acGatewayARN :: Lens' AddCache Text
acGatewayARN = lens _acGatewayARN (\ s a -> s{_acGatewayARN = a});

-- | FIXME: Undocumented member.
acDiskIds :: Lens' AddCache [Text]
acDiskIds = lens _acDiskIds (\ s a -> s{_acDiskIds = a});

instance AWSRequest AddCache where
        type Sv AddCache = StorageGateway
        type Rs AddCache = AddCacheResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 AddCacheResponse' <$>
                   (x .?> "GatewayARN") <*> (pure s))

instance ToHeaders AddCache where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("StorageGateway_20130630.AddCache" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON AddCache where
        toJSON AddCache'{..}
          = object
              ["GatewayARN" .= _acGatewayARN,
               "DiskIds" .= _acDiskIds]

instance ToPath AddCache where
        toPath = const "/"

instance ToQuery AddCache where
        toQuery = const mempty

-- | /See:/ 'addCacheResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'acrGatewayARN'
--
-- * 'acrStatus'
data AddCacheResponse = AddCacheResponse'
    { _acrGatewayARN :: !(Maybe Text)
    , _acrStatus     :: !Status
    } deriving (Eq,Show)

-- | 'AddCacheResponse' smart constructor.
addCacheResponse :: Status -> AddCacheResponse
addCacheResponse pStatus =
    AddCacheResponse'
    { _acrGatewayARN = Nothing
    , _acrStatus = pStatus
    }

-- | FIXME: Undocumented member.
acrGatewayARN :: Lens' AddCacheResponse (Maybe Text)
acrGatewayARN = lens _acrGatewayARN (\ s a -> s{_acrGatewayARN = a});

-- | FIXME: Undocumented member.
acrStatus :: Lens' AddCacheResponse Status
acrStatus = lens _acrStatus (\ s a -> s{_acrStatus = a});
