Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017C4390569
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 17:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA9D6EA61;
	Tue, 25 May 2021 15:27:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591B06EA61;
 Tue, 25 May 2021 15:27:57 +0000 (UTC)
IronPort-SDR: Gw9QjuNEeNMgpNIFsInVlQz3rbBpOKGy9fKjubaJQGAg9Al2p7Bw/eH9yk10tnB/PiPTvfrqry
 SJS5btEt+23w==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="202237976"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="202237976"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 08:27:53 -0700
IronPort-SDR: Dej0CYihPLpXX7PX410TElOPH4UbwzYrwd0QwmxpNyTfU1etYQyTkuqL1o/Bl9fIXeWWQe4yIr
 px4EEJTopO0g==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="442589081"
Received: from tomeara-mobl.ger.corp.intel.com (HELO [10.213.211.66])
 ([10.213.211.66])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 08:27:51 -0700
Subject: Re: [Intel-gfx] [PATCH 0/3] Clean a few backend interfaces in the i915
To: Daniel Vetter <daniel@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>
References: <20210521183215.65451-1-matthew.brost@intel.com>
 <YK0CKLSCx0qowxhy@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <040887b2-48f3-c4be-2a43-7e99492af5fc@linux.intel.com>
Date: Tue, 25 May 2021 16:27:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YK0CKLSCx0qowxhy@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 25/05/2021 14:56, Daniel Vetter wrote:
> On Fri, May 21, 2021 at 11:32:12AM -0700, Matthew Brost wrote:
>> As discussed in [1] start merging some support patches as a precursor to
>> GuC submission the i915. This is step #1 mentioned in [1].
>>
>> [1] https://patchwork.freedesktop.org/series/89844/
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Pushed to drm-intel-gt-next, thanks for patches&reviews. Btw you can also
> ping John H or Daniele for pushing stuff for you, should be quicker than
> waiting for me to return from a lon w/e :-)
> 
> Plus I _really_ don't want to get back into the business of pushing other
> people's work ...

To Matt - Also please take care to preserve r-b's when resurrecting 
patches because all of these three had mine from before which is now 
lost in git history.

Regards,

Tvrtko
