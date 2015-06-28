{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}

-- Module      : Network.AWS.SES.ListVerifiedEmailAddresses
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

-- | Returns a list containing all of the email addresses that have been
-- verified.
--
-- The ListVerifiedEmailAddresses action is deprecated as of the May 15,
-- 2012 release of Domain Verification. The ListIdentities action is now
-- preferred.
--
-- This action is throttled at one request per second.
--
-- <http://docs.aws.amazon.com/ses/latest/APIReference/API_ListVerifiedEmailAddresses.html>
module Network.AWS.SES.ListVerifiedEmailAddresses
    (
    -- * Request
      ListVerifiedEmailAddresses
    -- ** Request constructor
    , listVerifiedEmailAddresses

    -- * Response
    , ListVerifiedEmailAddressesResponse
    -- ** Response constructor
    , listVerifiedEmailAddressesResponse
    -- ** Response lenses
    , lvearVerifiedEmailAddresses
    , lvearStatus
    ) where

import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.SES.Types

-- | /See:/ 'listVerifiedEmailAddresses' smart constructor.
data ListVerifiedEmailAddresses =
    ListVerifiedEmailAddresses'
    deriving (Eq,Read,Show)

-- | 'ListVerifiedEmailAddresses' smart constructor.
listVerifiedEmailAddresses :: ListVerifiedEmailAddresses
listVerifiedEmailAddresses = ListVerifiedEmailAddresses'

instance AWSRequest ListVerifiedEmailAddresses where
        type Sv ListVerifiedEmailAddresses = SES
        type Rs ListVerifiedEmailAddresses =
             ListVerifiedEmailAddressesResponse
        request = post
        response
          = receiveXMLWrapper
              "ListVerifiedEmailAddressesResult"
              (\ s h x ->
                 ListVerifiedEmailAddressesResponse' <$>
                   (x .@? "VerifiedEmailAddresses" .!@ mempty >>=
                      may (parseXMLList "member"))
                     <*> (pure s))

instance ToHeaders ListVerifiedEmailAddresses where
        toHeaders = const mempty

instance ToPath ListVerifiedEmailAddresses where
        toPath = const "/"

instance ToQuery ListVerifiedEmailAddresses where
        toQuery
          = const
              (mconcat
                 ["Action" =:
                    ("ListVerifiedEmailAddresses" :: ByteString),
                  "Version" =: ("2010-12-01" :: ByteString)])

-- | Represents a list of all the email addresses verified for the current
-- user.
--
-- /See:/ 'listVerifiedEmailAddressesResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'lvearVerifiedEmailAddresses'
--
-- * 'lvearStatus'
data ListVerifiedEmailAddressesResponse = ListVerifiedEmailAddressesResponse'
    { _lvearVerifiedEmailAddresses :: !(Maybe [Text])
    , _lvearStatus                 :: !Status
    } deriving (Eq,Show)

-- | 'ListVerifiedEmailAddressesResponse' smart constructor.
listVerifiedEmailAddressesResponse :: Status -> ListVerifiedEmailAddressesResponse
listVerifiedEmailAddressesResponse pStatus =
    ListVerifiedEmailAddressesResponse'
    { _lvearVerifiedEmailAddresses = Nothing
    , _lvearStatus = pStatus
    }

-- | A list of email addresses that have been verified.
lvearVerifiedEmailAddresses :: Lens' ListVerifiedEmailAddressesResponse [Text]
lvearVerifiedEmailAddresses = lens _lvearVerifiedEmailAddresses (\ s a -> s{_lvearVerifiedEmailAddresses = a}) . _Default;

-- | FIXME: Undocumented member.
lvearStatus :: Lens' ListVerifiedEmailAddressesResponse Status
lvearStatus = lens _lvearStatus (\ s a -> s{_lvearStatus = a});
