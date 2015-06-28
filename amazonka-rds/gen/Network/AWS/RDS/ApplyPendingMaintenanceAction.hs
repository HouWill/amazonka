{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}

-- Module      : Network.AWS.RDS.ApplyPendingMaintenanceAction
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

-- | Applies a pending maintenance action to a resource (for example, a DB
-- instance).
--
-- <http://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_ApplyPendingMaintenanceAction.html>
module Network.AWS.RDS.ApplyPendingMaintenanceAction
    (
    -- * Request
      ApplyPendingMaintenanceAction
    -- ** Request constructor
    , applyPendingMaintenanceAction
    -- ** Request lenses
    , apmaResourceIdentifier
    , apmaApplyAction
    , apmaOptInType

    -- * Response
    , ApplyPendingMaintenanceActionResponse
    -- ** Response constructor
    , applyPendingMaintenanceActionResponse
    -- ** Response lenses
    , apmarResourcePendingMaintenanceActions
    , apmarStatus
    ) where

import           Network.AWS.Prelude
import           Network.AWS.RDS.Types
import           Network.AWS.Request
import           Network.AWS.Response

-- |
--
-- /See:/ 'applyPendingMaintenanceAction' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'apmaResourceIdentifier'
--
-- * 'apmaApplyAction'
--
-- * 'apmaOptInType'
data ApplyPendingMaintenanceAction = ApplyPendingMaintenanceAction'
    { _apmaResourceIdentifier :: !Text
    , _apmaApplyAction        :: !Text
    , _apmaOptInType          :: !Text
    } deriving (Eq,Read,Show)

-- | 'ApplyPendingMaintenanceAction' smart constructor.
applyPendingMaintenanceAction :: Text -> Text -> Text -> ApplyPendingMaintenanceAction
applyPendingMaintenanceAction pResourceIdentifier pApplyAction pOptInType =
    ApplyPendingMaintenanceAction'
    { _apmaResourceIdentifier = pResourceIdentifier
    , _apmaApplyAction = pApplyAction
    , _apmaOptInType = pOptInType
    }

-- | The ARN of the resource that the pending maintenance action applies to.
apmaResourceIdentifier :: Lens' ApplyPendingMaintenanceAction Text
apmaResourceIdentifier = lens _apmaResourceIdentifier (\ s a -> s{_apmaResourceIdentifier = a});

-- | The pending maintenance action to apply to this resource.
apmaApplyAction :: Lens' ApplyPendingMaintenanceAction Text
apmaApplyAction = lens _apmaApplyAction (\ s a -> s{_apmaApplyAction = a});

-- | A value that specifies the type of opt-in request, or undoes an opt-in
-- request. An opt-in request of type @immediate@ cannot be undone.
--
-- Valid values:
--
-- -   @immediate@ - Apply the maintenance action immediately.
-- -   @next-maintenance@ - Apply the maintenance action during the next
--     maintenance window for the resource.
-- -   @undo-opt-in@ - Cancel any existing @next-maintenance@ opt-in
--     requests.
apmaOptInType :: Lens' ApplyPendingMaintenanceAction Text
apmaOptInType = lens _apmaOptInType (\ s a -> s{_apmaOptInType = a});

instance AWSRequest ApplyPendingMaintenanceAction
         where
        type Sv ApplyPendingMaintenanceAction = RDS
        type Rs ApplyPendingMaintenanceAction =
             ApplyPendingMaintenanceActionResponse
        request = post
        response
          = receiveXMLWrapper
              "ApplyPendingMaintenanceActionResult"
              (\ s h x ->
                 ApplyPendingMaintenanceActionResponse' <$>
                   (x .@? "ResourcePendingMaintenanceActions") <*>
                     (pure s))

instance ToHeaders ApplyPendingMaintenanceAction
         where
        toHeaders = const mempty

instance ToPath ApplyPendingMaintenanceAction where
        toPath = const "/"

instance ToQuery ApplyPendingMaintenanceAction where
        toQuery ApplyPendingMaintenanceAction'{..}
          = mconcat
              ["Action" =:
                 ("ApplyPendingMaintenanceAction" :: ByteString),
               "Version" =: ("2014-10-31" :: ByteString),
               "ResourceIdentifier" =: _apmaResourceIdentifier,
               "ApplyAction" =: _apmaApplyAction,
               "OptInType" =: _apmaOptInType]

-- | /See:/ 'applyPendingMaintenanceActionResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'apmarResourcePendingMaintenanceActions'
--
-- * 'apmarStatus'
data ApplyPendingMaintenanceActionResponse = ApplyPendingMaintenanceActionResponse'
    { _apmarResourcePendingMaintenanceActions :: !(Maybe ResourcePendingMaintenanceActions)
    , _apmarStatus                            :: !Status
    } deriving (Eq,Show)

-- | 'ApplyPendingMaintenanceActionResponse' smart constructor.
applyPendingMaintenanceActionResponse :: Status -> ApplyPendingMaintenanceActionResponse
applyPendingMaintenanceActionResponse pStatus =
    ApplyPendingMaintenanceActionResponse'
    { _apmarResourcePendingMaintenanceActions = Nothing
    , _apmarStatus = pStatus
    }

-- | FIXME: Undocumented member.
apmarResourcePendingMaintenanceActions :: Lens' ApplyPendingMaintenanceActionResponse (Maybe ResourcePendingMaintenanceActions)
apmarResourcePendingMaintenanceActions = lens _apmarResourcePendingMaintenanceActions (\ s a -> s{_apmarResourcePendingMaintenanceActions = a});

-- | FIXME: Undocumented member.
apmarStatus :: Lens' ApplyPendingMaintenanceActionResponse Status
apmarStatus = lens _apmarStatus (\ s a -> s{_apmarStatus = a});
