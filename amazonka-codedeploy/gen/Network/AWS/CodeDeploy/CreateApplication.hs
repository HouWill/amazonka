{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}

-- Module      : Network.AWS.CodeDeploy.CreateApplication
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

-- | Creates a new application.
--
-- <http://docs.aws.amazon.com/codedeploy/latest/APIReference/API_CreateApplication.html>
module Network.AWS.CodeDeploy.CreateApplication
    (
    -- * Request
      CreateApplication
    -- ** Request constructor
    , createApplication
    -- ** Request lenses
    , caApplicationName

    -- * Response
    , CreateApplicationResponse
    -- ** Response constructor
    , createApplicationResponse
    -- ** Response lenses
    , carApplicationId
    , carStatus
    ) where

import           Network.AWS.CodeDeploy.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Represents the input of a create application operation.
--
-- /See:/ 'createApplication' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'caApplicationName'
newtype CreateApplication = CreateApplication'
    { _caApplicationName :: Text
    } deriving (Eq,Read,Show)

-- | 'CreateApplication' smart constructor.
createApplication :: Text -> CreateApplication
createApplication pApplicationName =
    CreateApplication'
    { _caApplicationName = pApplicationName
    }

-- | The name of the application. This name must be unique with the
-- applicable IAM user or AWS account.
caApplicationName :: Lens' CreateApplication Text
caApplicationName = lens _caApplicationName (\ s a -> s{_caApplicationName = a});

instance AWSRequest CreateApplication where
        type Sv CreateApplication = CodeDeploy
        type Rs CreateApplication = CreateApplicationResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 CreateApplicationResponse' <$>
                   (x .?> "applicationId") <*> (pure s))

instance ToHeaders CreateApplication where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("CodeDeploy_20141006.CreateApplication" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON CreateApplication where
        toJSON CreateApplication'{..}
          = object ["applicationName" .= _caApplicationName]

instance ToPath CreateApplication where
        toPath = const "/"

instance ToQuery CreateApplication where
        toQuery = const mempty

-- | Represents the output of a create application operation.
--
-- /See:/ 'createApplicationResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'carApplicationId'
--
-- * 'carStatus'
data CreateApplicationResponse = CreateApplicationResponse'
    { _carApplicationId :: !(Maybe Text)
    , _carStatus        :: !Status
    } deriving (Eq,Show)

-- | 'CreateApplicationResponse' smart constructor.
createApplicationResponse :: Status -> CreateApplicationResponse
createApplicationResponse pStatus =
    CreateApplicationResponse'
    { _carApplicationId = Nothing
    , _carStatus = pStatus
    }

-- | A unique application ID.
carApplicationId :: Lens' CreateApplicationResponse (Maybe Text)
carApplicationId = lens _carApplicationId (\ s a -> s{_carApplicationId = a});

-- | FIXME: Undocumented member.
carStatus :: Lens' CreateApplicationResponse Status
carStatus = lens _carStatus (\ s a -> s{_carStatus = a});
